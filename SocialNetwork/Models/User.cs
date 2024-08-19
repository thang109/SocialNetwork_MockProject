using System;
using System.Collections.Generic;

namespace SocialNetwork.Models;

public partial class User
{
    public int UserId { get; set; }

    public string UserName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public string? Bio { get; set; }

    public string? ProfilePictureUrl { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public string? ConfirmationCode { get; set; }

    public bool IsEmailConfirmed { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<Follow> FollowFollowers { get; set; } = new List<Follow>();

    public virtual ICollection<Follow> FollowFollowings { get; set; } = new List<Follow>();

    public virtual ICollection<Friendship> FriendshipFriends { get; set; } = new List<Friendship>();

    public virtual ICollection<Friendship> FriendshipUsers { get; set; } = new List<Friendship>();

    public virtual ICollection<Like> Likes { get; set; } = new List<Like>();

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();

    public virtual ICollection<PostShare> PostShares { get; set; } = new List<PostShare>();

    public virtual ICollection<Post> Posts { get; set; } = new List<Post>();
}
