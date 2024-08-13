using Microsoft.EntityFrameworkCore;
using SocialNetwork.Interfaces;
using SocialNetwork.Models;

namespace SocialNetwork.Repositories
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        public UserRepository(SocialMockContext context) : base(context)
        {

        }

        public User GetByEmail(string email)
        {
            return _dbSet.SingleOrDefault(x => x.Email == email);
        }

        public bool UserExist(string email)
        {
            return _dbSet.Any(x => x.Email == email);
        }
    }
}
