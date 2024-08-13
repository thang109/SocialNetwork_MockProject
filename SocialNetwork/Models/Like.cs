﻿using System;
using System.Collections.Generic;

namespace SocialNetwork.Models;

public partial class Like
{
    public int LikeId { get; set; }

    public int PostId { get; set; }

    public int UserId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual Post Post { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
