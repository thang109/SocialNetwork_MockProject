namespace SocialNetwork.DTO.AccountDTOs
{
    public class EditProfileRequest
    {
        public string UserName { get; set; }
        public string? Email { get; set; }
        public string? Bio { get; set; }
        public string? ProfilePictureUrl { get; set; }
    }
}
