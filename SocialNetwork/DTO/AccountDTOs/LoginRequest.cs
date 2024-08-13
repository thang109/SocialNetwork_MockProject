using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.AccountDTOs
{
    public class LoginRequest
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
