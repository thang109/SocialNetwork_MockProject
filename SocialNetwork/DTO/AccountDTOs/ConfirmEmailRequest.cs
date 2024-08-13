using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.AccountDTOs
{
    public class ConfirmEmailRequest
    {
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Code { get; set; }
    }
}
