using Microsoft.EntityFrameworkCore;
using SocialNetwork.Interfaces;
using SocialNetwork.Models;

namespace SocialNetwork.Repositories
{
    public class PostRepository : BaseRepository<Post>, IPostRepository
    {
        public PostRepository(SocialMockContext context) : base(context)
        {
        }

        public async Task<Post> GetByIdAsnyc(int id)
        {
            return await _context.Posts
                .Include(p => p.Comments)
                .Include(p => p.Likes)
                .Include(p => p.PostShares)
                .FirstOrDefaultAsync(p => p.PostId == id);
        }
    }
}
