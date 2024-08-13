using SocialNetwork.Models;

namespace SocialNetwork.Interfaces
{
    public interface IUserRepository : IBaseRepository<User>
    {
        User GetByEmail(string email);
        bool UserExist(string email);
    }
}
