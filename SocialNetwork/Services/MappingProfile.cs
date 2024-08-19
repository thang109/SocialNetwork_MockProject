using AutoMapper;
using SocialNetwork.DTO.PostDTOs;
using SocialNetwork.Models;

namespace SocialNetwork.Services
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<CreatePost, Post>();
            CreateMap<EditPost, Post>();
            CreateMap<DeletePost, Post>();
            CreateMap<LikePost, Post>();
            CreateMap<SharePost, Post>();
            CreateMap<CommentPost, Post>();
        }
    }
}
