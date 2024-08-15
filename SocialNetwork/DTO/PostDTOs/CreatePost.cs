using System.ComponentModel.DataAnnotations;

namespace SocialNetwork.DTO.PostDTOs
{
    public class CreatePost
    {
        public string Content { get; set; } = string.Empty;

        public string? ImageUrl { get; set; }
    }
}
