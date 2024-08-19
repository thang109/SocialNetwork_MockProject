using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SocialNetwork.DTO.PostDTOs;
using SocialNetwork.Interfaces;
using SocialNetwork.Models;
using System.Security.Claims;

namespace SocialNetwork.Controllers
{
    [Route("posts")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly IPostRepository _postRepository;
        private readonly IMapper _mapper;

        public PostController(IPostRepository postRepository, IMapper mapper)
        {
            _postRepository = postRepository;
            _mapper = mapper;
        }

        [HttpPost("create")]
        public async Task<IActionResult> CreatePost([FromBody] CreatePost createPost)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var userIdClaim = User.FindFirst("userId");
                if(userIdClaim == null)
                {
                    return Unauthorized("User not authenticated");
                }
                if (!int.TryParse(userIdClaim.Value, out var userId))
                {
                    return BadRequest(new { Error = "Invalid user ID format in token" });
                }

                var post = _mapper.Map<Post>(createPost);
                post.CreatedAt = DateTime.Now;
                post.UserId = userId;

                await _postRepository.CreateAsync(post);
                await _postRepository.SaveChangesAsync();

                return Ok(post);
            }
            catch (Exception ex)
            {
                var errorDetails = new
                {
                    Message = ex.Message,
                    StackTrace = ex.StackTrace
                };

                return BadRequest(errorDetails);
            }
        }

        [HttpPut("edit/{id}")]
        public async Task<IActionResult> EditPost([FromBody] EditPost editPost, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var post = await _postRepository.GetByIdAsync(id);

                if (post == null)
                {
                    return NotFound();
                }

                _mapper.Map(editPost, post);
                post.UpdatedAt = DateTime.UtcNow;

                await _postRepository.UpdateAsync(post);
                await _postRepository.SaveChangesAsync();

                return Ok(post);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeletePost(int id)
        {
            var post = await _postRepository.GetByIdAsnyc(id);

            if (post == null)
            {
                return NotFound();
            }

            await _postRepository.DeleteAsync(post);
            await _postRepository.SaveChangesAsync();

            return Ok();
        }

        [HttpPost("like/{id}")]
        public async Task<IActionResult> LikePost(int id, [FromBody] LikePost likePost)
        {
            try
            {
                var post = await _postRepository.GetByIdAsnyc(id);

                if(post == null)
                {
                    return NotFound();
                }

                var like = new Like { PostId = id};
                post.Likes.Add(like);

                await _postRepository.SaveChangesAsync();

                return Ok(post);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost("comment/{id}")]
        public async Task<IActionResult> CommentPost(int id, [FromBody] CommentPost commentPost)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var post = await _postRepository.GetByIdAsync(id);

                if (post == null)
                {
                    return NotFound();
                }

                var comment = _mapper.Map<Comment>(commentPost);
                comment.PostId = id;
                comment.CreatedAt = DateTime.Now;
                comment.UpdatedAt = DateTime.Now;
                post.Comments.Add(comment);

                await _postRepository.SaveChangesAsync();

                return Ok(post);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost("share/{id}")]
        public async Task<IActionResult> SharePost(int id, [FromBody] SharePost sharePost)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var post = await _postRepository.GetByIdAsync(id);

                if (post == null)
                    return NotFound();

                var share = _mapper.Map<PostShare>(sharePost);
                share.PostId = id;
                post.PostShares.Add(share);

                await _postRepository.SaveChangesAsync();

                return Ok(post);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
