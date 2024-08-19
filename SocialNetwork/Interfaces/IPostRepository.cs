using SocialNetwork.Models;

namespace SocialNetwork.Interfaces
{
    public interface IPostRepository : IBaseRepository<Post>
    {
        Task<Post> GetByIdAsnyc(int id);
    }
}
