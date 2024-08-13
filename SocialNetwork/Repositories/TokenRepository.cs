using SocialNetwork.Interfaces;

namespace SocialNetwork.Repositories
{
    public class TokenRepository : ITokenRepository
    {
        public Task<bool> IsTokenUsedAsync(string token)
        {
            throw new NotImplementedException();
        }

        public Task MarkTokenAsUsedAsync(string token)
        {
            throw new NotImplementedException();
        }
    }
}
