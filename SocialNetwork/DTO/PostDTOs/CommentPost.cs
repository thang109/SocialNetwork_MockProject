using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.PostDTOs
{
    public class CommentPost
    {
        public int UserId { get; set; }

        [Required(ErrorMessage = "Content is required.")]
        [StringLength(500, ErrorMessage = "Content can't be longer than 500 characters.")]
        public string Content { get; set; } = string.Empty;
    }
}
