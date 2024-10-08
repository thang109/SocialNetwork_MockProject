USE [master]
GO
/****** Object:  Database [SocialMock]    Script Date: 8/13/2024 3:35:35 PM ******/
CREATE DATABASE [SocialMock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialMock', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\SocialMock.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialMock_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\SocialMock_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SocialMock] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialMock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialMock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialMock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialMock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialMock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialMock] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialMock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialMock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialMock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialMock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialMock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialMock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialMock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialMock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialMock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialMock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialMock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialMock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialMock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialMock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialMock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialMock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialMock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialMock] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialMock] SET  MULTI_USER 
GO
ALTER DATABASE [SocialMock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialMock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialMock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialMock] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialMock] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialMock] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialMock', N'ON'
GO
ALTER DATABASE [SocialMock] SET QUERY_STORE = ON
GO
ALTER DATABASE [SocialMock] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SocialMock]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follows]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follows](
	[FollowId] [int] IDENTITY(1,1) NOT NULL,
	[FollowerId] [int] NOT NULL,
	[FollowingId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FollowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendships](
	[FriendshipId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FriendId] [int] NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[IsRead] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsedTokens]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsedTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[UsedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/13/2024 3:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Bio] [nvarchar](255) NULL,
	[ProfilePictureUrl] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[ConfirmationCode] [nvarchar](max) NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (3, N'trong', N'abc@gmail.com', N'AQAAAAIAAYagAAAAEGuY1pffyQgWWYJtA3H79MNz2iTncSKJXRw4JYQpr4SE7F+tpNCsKyzmyHEX24sk4Q==', NULL, NULL, CAST(N'2024-08-08T18:19:06.060' AS DateTime), CAST(N'2024-08-08T18:19:06.060' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (4, N'thienthang109', N'thang@gmail.com', N'AQAAAAIAAYagAAAAELjqKRS3gLriaQTWx0uclJLdP4PF7xbfOw+MShyKhwA8Lb4hLb7fsinW2nGaMGRHZQ==', NULL, NULL, CAST(N'2024-08-08T18:35:28.657' AS DateTime), CAST(N'2024-08-08T18:35:28.657' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (5, N'ngothien', N'ngo@gmail.com', N'123', NULL, NULL, CAST(N'2024-08-08T18:42:06.943' AS DateTime), CAST(N'2024-08-08T18:42:06.943' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (6, N'ngothienthang', N'123@example.com', N'Thang109@', NULL, NULL, CAST(N'2024-08-09T09:43:43.420' AS DateTime), CAST(N'2024-08-09T09:43:43.420' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (1006, N'aaa', N'a@example.com', N'$2a$11$bcgVg2R4Q3JhRnCrAjedguzk1IP3SO.vqQLQLirfRmLou0uuK6BJu', NULL, NULL, CAST(N'2024-08-09T10:22:24.703' AS DateTime), CAST(N'2024-08-09T10:22:24.703' AS DateTime), NULL, 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (1007, N'aaa', N'b@example.com', N'$2a$11$krTQQnCE8z7PRD.tp69W.eNWlg.i7.rxXZLsp0MY.VplwQM.ak3r.', NULL, NULL, CAST(N'2024-08-09T10:27:41.500' AS DateTime), CAST(N'2024-08-09T10:27:41.500' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (1008, N'aaa', N'c@example.com', N'$2a$11$mXTl7063riJw.iCfVqKYGemrAxJc5Fr1IyMntRtOIYwchPqSrkje2', NULL, NULL, CAST(N'2024-08-09T15:11:19.967' AS DateTime), CAST(N'2024-08-09T15:11:19.967' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (2009, N'aaa', N'thien.thangg03@gmail.com', N'$2a$11$CVEp38Ex2doTlpBSY7hZeuhS0Y4bDRHi5sMPSAoELpm0xgWXuvHzG', NULL, NULL, CAST(N'2024-08-11T12:27:35.570' AS DateTime), CAST(N'2024-08-11T12:27:35.570' AS DateTime), NULL, 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (2010, N'trongandxi', N'ngothienthang2k3@gmail.com', N'$2a$11$kMjdbItibOd4AmLRq99oEujjG1iU2dlOMkiIEewlJ3VluwHJA8xyK', N'twentyagefpts', N'https://example.com/images/vector.svg', CAST(N'2024-08-11T12:31:01.660' AS DateTime), CAST(N'2024-08-13T07:53:02.957' AS DateTime), NULL, 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [PasswordHash], [Bio], [ProfilePictureUrl], [CreatedAt], [UpdatedAt], [ConfirmationCode], [IsEmailConfirmed]) VALUES (2012, N'trong', N'thangntde170747@fpt.edu.vn', N'$2a$11$NHr5Y9/ar2JJMaXSxx1V9.9OTFrK4ZFP9fUR0dNoIYEt8vQeU.Jom', NULL, NULL, CAST(N'2024-08-13T10:59:42.693' AS DateTime), CAST(N'2024-08-13T10:59:42.693' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053462C20A0E]    Script Date: 8/13/2024 3:35:35 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Follows] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Friendships] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsEmailConfirmed]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Follows]  WITH CHECK ADD FOREIGN KEY([FollowerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Follows]  WITH CHECK ADD FOREIGN KEY([FollowingId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD FOREIGN KEY([FriendId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD CHECK  (([Status]='rejected' OR [Status]='accepted' OR [Status]='pending'))
GO
USE [master]
GO
ALTER DATABASE [SocialMock] SET  READ_WRITE 
GO
