namespace SocialNetwork.Interfaces
{
    public interface ITokenRepository
    {
        Task<bool> IsTokenUsedAsync(string token);

        Task MarkTokenAsUsedAsync(string token);
    }
}
