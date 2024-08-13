using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using SocialNetwork.Interfaces;
using SocialNetwork.Models;

namespace SocialNetwork.Services
{
    public class TokenService : ITokenRepository
    {
        private readonly SocialMockContext _context;
        private readonly IDistributedCache _cache;

        public TokenService(SocialMockContext context, IDistributedCache cache)
        {
            _context = context;
            _cache = cache;
        }

        public async Task<bool> IsTokenUsedAsync(string token)
        {
            return await _cache.GetStringAsync(token) != null;
        }

        public async Task MarkTokenAsUsedAsync(string token)
        {
            // Lưu trữ token vào cache với thời gian hết hạn ngắn
            var options = new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(10)
            };
            await _cache.SetStringAsync(token, "used", options);
        }
    }
}
