using System;
using System.Collections.Generic;

namespace SocialNetwork.Models;

public partial class Follow
{
    public int FollowId { get; set; }

    public int FollowerId { get; set; }

    public int FollowingId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual User Follower { get; set; } = null!;

    public virtual User Following { get; set; } = null!;
}
