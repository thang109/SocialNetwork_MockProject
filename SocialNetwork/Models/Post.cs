using System;
using System.Collections.Generic;

namespace SocialNetwork.Models;

public partial class Post
{
    public int PostId { get; set; }

    public int UserId { get; set; }

    public string? Content { get; set; }

    public string? ImageUrl { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<Like> Likes { get; set; } = new List<Like>();

    public virtual ICollection<PostShare> PostShares { get; set; } = new List<PostShare>();

    public virtual User User { get; set; } = null!;
}
