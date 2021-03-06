USE [master]
GO
/****** Object:  Database [dbWebsite]    Script Date: 8/24/2016 6:22:01 PM ******/
CREATE DATABASE [dbWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbWebsite.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbWebsite_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbWebsite] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbWebsite] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [dbWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [dbWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbWebsite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbWebsite', N'ON'
GO
USE [dbWebsite]
GO
/****** Object:  StoredProcedure [dbo].[LoadMenus]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadMenus]
As
Begin
select * INTO #temp from tblCategory where CatParent = 0
end
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[CatParent] [nvarchar](50) NULL,
	[UpdateBy] [nchar](10) NULL,
	[CreateBy] [nchar](10) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tblCategoryLv1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblContent]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NULL,
	[Status] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nchar](10) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](10) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblContent_Image]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContent_Image](
	[IDImage] [int] NOT NULL,
	[IDContent] [int] NOT NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Path] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPermision]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermision](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblPermision] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](10) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 8/24/2016 6:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (1, N'THỜI TRANG MÙA HÈ', 1, N'0', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (2, N'THỜI TRANG MÙA ĐÔNG', 1, N'0', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (3, N'PHỤ KIỆN', 1, N'0', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (4, N'GIÀY DA', 1, N'0', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (5, N'Sơ mi ngắn tay', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (6, N'Sơ mi dài tay', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (7, N'Áo phông', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (8, N'Đồ lót', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (9, N'Quần âu', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (10, N'Quần bò', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (11, N'Quần ngố', 1, N'1', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (12, N'Áo khoác nỉ', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (13, N'Áo gió', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (14, N'Áo phao', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (15, N'Áo gile', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (16, N'Áo măng tô', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (17, N'Vest', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (18, N'Áo khoác bò', 1, N'2', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (20, N'Thắt lưng', 1, N'3', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (21, N'Túi xách', 1, N'3', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [CategoryName], [Status], [CatParent], [UpdateBy], [CreateBy], [CreateDate], [UpdateDate]) VALUES (22, N'Ví da', 1, N'3', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
USE [master]
GO
ALTER DATABASE [dbWebsite] SET  READ_WRITE 
GO
