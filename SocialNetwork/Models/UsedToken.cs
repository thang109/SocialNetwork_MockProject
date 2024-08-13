using System;
using System.Collections.Generic;

namespace SocialNetwork.Models;

public partial class UsedToken
{
    public int Id { get; set; }

    public string Token { get; set; } = null!;

    public DateTime UsedAt { get; set; }
}
