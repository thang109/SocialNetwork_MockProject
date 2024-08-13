using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.AccountDTOs
{
    public class EditProfileRequest
    {
        [Required]
        [EmailAddress(ErrorMessage = "Invalid email address.")]
        [Display(Name = "Email")]
        public string? Email { get; set; }
        
        [RegularExpression(@"^\S.*\S$|^\S$", ErrorMessage = "Username cannot start or end with whitespace.")]
        public string UserName { get; set; }

        [MaxLength(500, ErrorMessage = "Bio cannot exceed 500 characters.")]
        [Display(Name = "Bio")]
        public string? Bio { get; set; }

        [Url(ErrorMessage = "Invalid URL.")]
        //[AllowEmptyStrings]
        [Display(Name = "Profile Picture URL")]
        public string? ProfilePictureUrl { get; set; }
    }
}
