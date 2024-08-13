using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BCrypt.Net;
using Microsoft.IdentityModel.Tokens;
using SocialNetwork.Models;
using Microsoft.Data.SqlClient;
using SocialNetwork.DTO.AccountDTOs;
using SocialNetwork.Interfaces;

namespace SocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly SocialMockContext _context;
        private readonly IConfiguration _configuration;
        private readonly IUserRepository _userRepository;
        private readonly ISendMailService _sendMailService;
            
        public AccountController(SocialMockContext context, IConfiguration configuration, IUserRepository userRepository, ISendMailService sendMailService)
        {
            _context = context;
            _configuration = configuration;
            _userRepository = userRepository;
            _sendMailService = sendMailService;
        }

        [HttpPost("signup")]
        public async Task<IActionResult> SignUp([FromBody] SignUpRequest request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var confirmationCode = Guid.NewGuid().ToString();

                var user = new User
                {
                    UserName = request.UserName,
                    Email = request.Email,
                    PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.Password),
                    ConfirmationCode = confirmationCode,
                    IsEmailConfirmed = false
                };

                await _userRepository.CreateAsync(user);
                await _userRepository.SaveChangesAsync();

                var emailContent = new DTO.MailDTOs.MailContent
                {
                    To = user.Email,
                    Subject = "Email Confirmation",
                    Body = $"<h1>Confirm Your Email</h1><p>Please use the following code to confirm your email address: <strong>{confirmationCode}</strong></p>"
                };
                await _sendMailService.SendMail(emailContent);

                var token = GenerateJwtToken(user);
                return Ok(new { Token = token });
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException is SqlException sqlEx)
                {
                    if (sqlEx.Number == 2627 || sqlEx.Number == 2601)
                    {
                        return BadRequest(new { Error = "The email address is already in use. Please choose a different one." });
                    }
                }

                return StatusCode(500, new { Error = "An error occurred while processing your request." });
            }

        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] DTO.AccountDTOs.LoginRequest request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var user = _userRepository.GetByEmail(request.UserName);

                if (user == null || !BCrypt.Net.BCrypt.Verify(request.Password, user.PasswordHash))
                {
                    return Unauthorized(new { Error = "Invalid email or password. Please try again" });
                }
                if (!user.IsEmailConfirmed)
                {
                    return Unauthorized(new { Error = "Email not confirmed. Please check your email for the confirmation code." });
                }

                var token = GenerateJwtToken(user);
                return Ok(new { Token = token });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }
        
        [HttpPost("forgotPass")]
        public async Task<IActionResult> ForgotPass([FromBody] DTO.AccountDTOs.ForgotPasswordRequest request)
        {
            try
            {
                var user = _userRepository.GetByEmail(request.Email);
                if (user == null)
                {
                    return BadRequest("Email không tồn tại.");
                }
                var token = GenerateJwtToken(user);
                var resetLink = Url.Action("ResetPassword", "Account", new { token }, "https");

                var emailContent = new DTO.MailDTOs.MailContent
                {
                    To = user.Email,
                    Subject = "Password Reset Request",
                    Body = $"<p>Please click the link below to reset your password.</p><a href='{resetLink}'>Reset Password</a>"
                };
                await _sendMailService.SendMail(emailContent);

                return Ok("Email khôi phục mật khẩu đã được gửi.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, new {Error = ex.Message });
            }
        }

        [HttpPost("resetPassword")]
        public async Task<IActionResult> ResetPassword([FromBody] DTO.AccountDTOs.ResetPasswordRequest request)
        {
            try
            {
                var handler = new JwtSecurityTokenHandler();
                var jsonToken = handler.ReadToken(request.Token) as JwtSecurityToken;

                if (jsonToken == null || !jsonToken.Claims.Any())
                {
                    return BadRequest("Invalid or expired token.");
                }

                var emailClaim = jsonToken.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Sub)?.Value;
                var purposeClaim = jsonToken.Claims.FirstOrDefault(c => c.Type == "Purpose")?.Value;

                if (emailClaim == null || purposeClaim != "PasswordReset")
                {
                    return BadRequest("Invalid token.");
                }

                var user = _userRepository.GetByEmail(emailClaim);

                if (user == null)
                {
                    return BadRequest("User not found.");
                }

                user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);
                await _userRepository.UpdateAsync(user);
                await _userRepository.SaveChangesAsync();

                return Ok("Password has been reset successfully.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }


        [HttpPost("confirmemail")]
        public async Task<IActionResult> ConfirmEmail([FromBody] ConfirmEmailRequest request)
        {
            try
            {
                var user = _userRepository.GetByEmail(request.Email);
                if (user == null || user.ConfirmationCode != request.Code)
                {
                    return BadRequest(new { Error = "Invalid confirmation code or email address." });
                }

                user.IsEmailConfirmed = true;
                user.ConfirmationCode = null;
                await _userRepository.UpdateAsync(user);
                await _userRepository.SaveChangesAsync();

                return Ok(new { Message = "Email confirmed successfully. You can now log in." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = "An error occurred while processing your request." });
            }
        }

        [HttpPatch("changePass")]
        public async Task<IActionResult> ChangePass([FromBody] ChangePasswordRequest request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.UserName);
                if (user == null || !BCrypt.Net.BCrypt.Verify(request.OldPassword, user.PasswordHash))
                {
                    return Unauthorized();
                }

                user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);

                await _userRepository.UpdateAsync(user);
                await _userRepository.SaveChangesAsync();

                var emailContent = new DTO.MailDTOs.MailContent
                {
                    To = user.Email,
                    Subject = "Password Changed Successfully",
                    Body = "<p>Your password has been changed successfully.</p>"
                };
                await _sendMailService.SendMail(emailContent);
                return Ok("Mật khẩu đã được thay đổi.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPatch("editProfile")]
        public async Task<IActionResult> EditProfile([FromBody] EditProfileRequest request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var user = _userRepository?.GetByEmail(request.UserName);
                if (user == null)
                {
                    return NotFound();
                }

                user.Email = request.Email ?? user.Email;
                user.Bio = request.Bio ?? user.Bio;
                user.ProfilePictureUrl = request.ProfilePictureUrl ?? user.ProfilePictureUrl;
                user.UpdatedAt = DateTime.UtcNow;

                await _userRepository.UpdateAsync(user);
                await _userRepository.SaveChangesAsync();

                return Ok(user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost("logout")]
        public IActionResult Logout()
        {
            return Ok();
        }

        private object GenerateJwtToken(User user)
        {
            var claims = new List<Claim>
        {
            new Claim(JwtRegisteredClaimNames.Sub, user.Email),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim("Purpose", "PasswordReset"),
            new Claim("Purpose", "PasswordChange")
        };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
