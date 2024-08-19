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
            CreateMap<LikePost, LikePost>();
            CreateMap<SharePost, PostShare>();
            CreateMap<CommentPost, Comment>()
                .ForMember(dest => dest.Content, opt => opt.MapFrom(src => src.Content))
                .ForMember(dest => dest.CreatedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow));
        }
    }
}
