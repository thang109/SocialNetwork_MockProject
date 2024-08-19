using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.PostDTOs
{
    public class EditPost
    {
        [Required(ErrorMessage = "Content is required.")]
        [StringLength(500, ErrorMessage = "Content can't be longer than 500 characters.")]
        public string Content { get; set; } = string.Empty;

        [Url(ErrorMessage = "Url is invalid. Please give correct images")]
        public string? ImageUrl {  get; set; }
    }
}
