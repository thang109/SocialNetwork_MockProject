using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.AccountDTOs
{
    public class ForgotPasswordRequest
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
