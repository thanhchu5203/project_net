USE [BanTheCao]
GO
/****** Object:  Table [dbo].[Adv]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adv](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositHistory]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Money] [decimal](10, 2) NOT NULL,
	[UserID] [int] NULL,
	[isSuccess] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[ReplyID] [int] NULL,
	[IsRead] [bit] NULL,
	[Date] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Links] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Position] [int] NULL,
	[Links] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[URL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Quantity] [int] NULL,
	[ProductID] [int] NULL,
	[VoucherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Date] [datetime] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistoryDetail]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistoryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductDetailID] [int] NOT NULL,
	[OrderHistoryID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Serial] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderReport]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderHistoryId] [int] NULL,
	[ReportedBy] [nvarchar](255) NOT NULL,
	[ReportDate] [datetime] NULL,
	[Issue] [nvarchar](255) NOT NULL,
	[IsResolved] [bit] NULL,
 CONSTRAINT [PK__OrderRep__3214EC07ECB72FFA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Expiry] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Serial] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[ProductId] [int] NULL,
	[isDelete] [bit] NOT NULL,
 CONSTRAINT [PK__ProductD__3214EC27DC98BDDE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleID] [int] NULL,
	[isActive] [bit] NULL,
	[Money] [decimal](10, 2) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 7/28/2024 2:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Discount] [decimal](10, 2) NOT NULL,
	[Type] [int] NOT NULL,
	[RemainUsed] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime] NULL,
	[isDelete] [bit] NULL,
	[DeletedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adv] ON 

INSERT [dbo].[Adv] ([ID], [Title], [Image], [Link], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'Ảnh 1', N'/themes\images\Netflix slide-63906.png', N'https://localhost:7032/product/productDetail/7', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Adv] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Name], [CategoryID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (1, N'Viettel', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [CategoryID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'Mobifone', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [CategoryID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'Vinaphone', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [CategoryID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (4, N'Netflix', 2, NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (1, N'Thẻ Cào', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'Giải Trí', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'hi', CAST(N'2024-07-27T20:51:55.780' AS DateTime), N'Admin', NULL, NULL, CAST(N'2024-07-28T00:16:31.277' AS DateTime), 1, N'Admin')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[DepositHistory] ON 

INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (1, CAST(N'2024-07-26T23:52:24.943' AS DateTime), NULL, N'', CAST(100.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (2, CAST(N'2024-07-26T23:56:30.207' AS DateTime), NULL, N'nạp tiền', CAST(200.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (3, CAST(N'2024-07-27T01:08:35.627' AS DateTime), NULL, N'nạp tiền', CAST(100000.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (4, CAST(N'2024-07-27T01:13:29.747' AS DateTime), NULL, N'nạp tiền', CAST(100000.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (5, CAST(N'2024-07-27T01:15:25.017' AS DateTime), NULL, N'nạp tiền', CAST(100000.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (6, CAST(N'2024-07-27T01:20:22.200' AS DateTime), NULL, N'nạp tiền', CAST(500.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (7, CAST(N'2024-07-27T01:25:30.680' AS DateTime), NULL, N'nạp tiền', CAST(500.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (8, CAST(N'2024-07-27T09:29:59.040' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (9, CAST(N'2024-07-27T10:36:07.797' AS DateTime), NULL, N'', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (10, CAST(N'2024-07-27T11:19:25.777' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (11, CAST(N'2024-07-27T11:20:02.863' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (12, CAST(N'2024-07-27T11:24:44.947' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (13, CAST(N'2024-07-27T11:28:32.493' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (14, CAST(N'2024-07-27T11:30:41.297' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (15, CAST(N'2024-07-27T11:31:33.590' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (16, CAST(N'2024-07-27T11:39:31.013' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (17, CAST(N'2024-07-27T11:41:55.173' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (18, CAST(N'2024-07-27T12:41:05.510' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (19, CAST(N'2024-07-27T12:42:24.340' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (20, CAST(N'2024-07-27T20:36:33.757' AS DateTime), NULL, N'nạp tiền', CAST(100.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[DepositHistory] ([ID], [CreatedAt], [CreatedBy], [Description], [Money], [UserID], [isSuccess]) VALUES (21, CAST(N'2024-07-27T21:08:41.920' AS DateTime), NULL, N'nạp tiền', CAST(240.00 AS Decimal(10, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[DepositHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Description], [Image], [UserID], [ProductID], [ReplyID], [IsRead], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'123456', NULL, 1, 1, 0, NULL, CAST(N'2024-07-27T20:12:09.640' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Description], [Image], [UserID], [ProductID], [ReplyID], [IsRead], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (12, N'sản phẩm tốt', NULL, 2, 1, 0, NULL, CAST(N'2024-07-28T10:31:12.227' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Description], [Image], [UserID], [ProductID], [ReplyID], [IsRead], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (13, N'@User tôi muốn mua thêm sản phẩm', NULL, 1, 1, 12, NULL, CAST(N'2024-07-28T13:53:29.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Description], [Image], [UserID], [ProductID], [ReplyID], [IsRead], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (14, N'@User Tốt thật không', NULL, 7, 1, 12, NULL, CAST(N'2024-07-28T13:54:27.650' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Feedback] ([ID], [Description], [Image], [UserID], [ProductID], [ReplyID], [IsRead], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (15, N'Sản phẩm này có tốt không anh em', NULL, 7, 1, 0, NULL, CAST(N'2024-07-28T13:54:43.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([ID], [Name], [Position], [Description], [Links]) VALUES (1, N'Liên Hệ', 2, N'0386520230', NULL)
INSERT [dbo].[Footer] ([ID], [Name], [Position], [Description], [Links]) VALUES (2, N'EazyCao Website', 3, NULL, N'https://localhost:7032/home/index')
INSERT [dbo].[Footer] ([ID], [Name], [Position], [Description], [Links]) VALUES (3, N'Sản phẩm', 4, NULL, N'https://localhost:7032/product/search?key=')
INSERT [dbo].[Footer] ([ID], [Name], [Position], [Description], [Links]) VALUES (4, N'Giỏ hàng', 5, NULL, N'https://localhost:7032/Cart/Index')
SET IDENTITY_INSERT [dbo].[Footer] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Title], [Description], [Position], [Links], [Location], [URL]) VALUES (1, N'Trang Chủ', NULL, NULL, N'https://localhost:7032/Home/Index', NULL, NULL)
INSERT [dbo].[Menu] ([ID], [Title], [Description], [Position], [Links], [Location], [URL]) VALUES (2, N'Thông Tin Cá Nhân', NULL, NULL, N'https://localhost:7032/Account/Profile', NULL, NULL)
INSERT [dbo].[Menu] ([ID], [Title], [Description], [Position], [Links], [Location], [URL]) VALUES (3, N'Giỏ Hàng', NULL, NULL, N'https://localhost:7032/Cart/Index', NULL, NULL)
INSERT [dbo].[Menu] ([ID], [Title], [Description], [Position], [Links], [Location], [URL]) VALUES (4, N'Sản Phẩm', NULL, NULL, N'https://localhost:7032/product/search?key=', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [Quantity], [ProductID], [VoucherID]) VALUES (12, 3, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (1, 1, 1, CAST(N'2024-07-27T02:04:19.290' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (2, 1, 1, CAST(N'2024-07-27T12:57:59.677' AS DateTime), 2, CAST(200.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (3, 1, 2, CAST(N'2024-07-27T12:57:59.797' AS DateTime), 1, CAST(200.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (4, 1, 1, CAST(N'2024-07-27T12:58:56.533' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (5, 1, 1, CAST(N'2024-07-27T12:59:27.237' AS DateTime), 3, CAST(150.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (6, 1, 1, CAST(N'2024-07-27T12:59:47.917' AS DateTime), 1, CAST(150.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (7, 1, 2, CAST(N'2024-07-27T12:59:47.920' AS DateTime), 1, CAST(150.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (8, 1, 5, CAST(N'2024-07-27T13:13:33.810' AS DateTime), 1, CAST(100.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (9, 1, 1, CAST(N'2024-07-27T14:07:37.403' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (10, 1, 2, CAST(N'2024-07-27T14:08:38.147' AS DateTime), 1, CAST(100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (11, 3, 1, CAST(N'2024-07-27T20:37:14.587' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (12, 1, 2, CAST(N'2024-07-27T20:48:47.123' AS DateTime), 1, CAST(150.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (13, 1, 1, CAST(N'2024-07-27T20:48:47.407' AS DateTime), 1, CAST(150.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (14, 1, 1, CAST(N'2024-07-27T20:49:21.157' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (15, 1, 1, CAST(N'2024-07-27T20:49:55.287' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (16, 5, 1, CAST(N'2024-07-28T07:53:49.863' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (17, 1, 1, CAST(N'2024-07-28T09:00:16.537' AS DateTime), 5, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (18, 1, 2, CAST(N'2024-07-28T09:00:16.610' AS DateTime), 1, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (19, 1, 10, CAST(N'2024-07-28T09:00:16.627' AS DateTime), 2, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 500k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (20, 1, 11, CAST(N'2024-07-28T09:00:16.637' AS DateTime), 1, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 500k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (21, 1, 12, CAST(N'2024-07-28T09:00:16.647' AS DateTime), 1, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Vinaphone 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (22, 1, 14, CAST(N'2024-07-28T09:00:16.647' AS DateTime), 1, CAST(2100.00 AS Decimal(10, 2)), N'Thẻ cào Vinaphone 200k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (23, 6, 1, CAST(N'2024-07-28T09:08:37.043' AS DateTime), 1, CAST(50.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (24, 1, 1, CAST(N'2024-07-28T09:33:01.620' AS DateTime), 2, CAST(100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (25, 7, 4, CAST(N'2024-07-28T13:58:37.163' AS DateTime), 6, CAST(1660.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (26, 7, 8, CAST(N'2024-07-28T13:58:37.260' AS DateTime), 1, CAST(1660.00 AS Decimal(10, 2)), N'Tài khoản Netflix 6 tháng')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (27, 7, 9, CAST(N'2024-07-28T13:58:37.280' AS DateTime), 1, CAST(1660.00 AS Decimal(10, 2)), N'Netflix Premium 1 Năm')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (28, 7, 6, CAST(N'2024-07-28T13:58:37.283' AS DateTime), 2, CAST(1660.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 200k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (29, 7, 5, CAST(N'2024-07-28T13:58:37.287' AS DateTime), 3, CAST(1660.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (30, 7, 7, CAST(N'2024-07-28T13:58:37.290' AS DateTime), 1, CAST(1660.00 AS Decimal(10, 2)), N'Tài khoản Netflix 1 tháng')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (31, 2, 1, CAST(N'2024-07-28T14:02:14.137' AS DateTime), 2, CAST(1100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 50k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (32, 2, 2, CAST(N'2024-07-28T14:02:14.143' AS DateTime), 3, CAST(1100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (33, 2, 3, CAST(N'2024-07-28T14:02:14.153' AS DateTime), 1, CAST(1100.00 AS Decimal(10, 2)), N'Thẻ cào Viettel 200k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (34, 2, 5, CAST(N'2024-07-28T14:02:14.157' AS DateTime), 3, CAST(1100.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 100k')
INSERT [dbo].[OrderHistory] ([ID], [UserID], [ProductID], [Date], [Quantity], [TotalPrice], [ProductName]) VALUES (35, 2, 6, CAST(N'2024-07-28T14:02:14.157' AS DateTime), 1, CAST(1100.00 AS Decimal(10, 2)), N'Thẻ cào Mobifone 200k')
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHistoryDetail] ON 

INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (1, 1, 1, 1, N'Thẻ cào Viettel 50k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (2, 2, 2, 1, N'Thẻ cào Viettel 50k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (3, 3, 2, 1, N'Thẻ cào Viettel 50k', N'Serial177FUOXYV', N'Code1FOQ4K8W4')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (4, 101, 3, 1, N'Thẻ cào Viettel 100k', N'Serial26ZO320KW', N'Code2C0XF6TC8')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (5, 4, 4, 1, N'Thẻ cào Viettel 50k', N'Serial1H20HZ922', N'Code1X3OOV6R8')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (6, 5, 5, 1, N'Thẻ cào Viettel 50k', N'Serial1S1Z2KMVJ', N'Code1J0GLMDUT')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (7, 6, 5, 1, N'Thẻ cào Viettel 50k', N'Serial15R2E2HOZ', N'Code1YVLQEYDU')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (8, 7, 5, 1, N'Thẻ cào Viettel 50k', N'Serial1IDFYRUS7', N'Code13X374GQN')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (9, 8, 6, 1, N'Thẻ cào Viettel 50k', N'Serial1T4BATUBX', N'Code1SZPRQ8EX')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (10, 102, 7, 1, N'Thẻ cào Viettel 100k', N'Serial2ZQKPEPSR', N'Code2WLABRAUF')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (11, 401, 8, 1, N'Thẻ cào Mobifone 100k', N'Serial5K80B73SR', N'Code5NHQ3OU0N')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (12, 9, 9, 1, N'Thẻ cào Viettel 50k', N'Serial12MLI00IT', N'Code1GITCVFOJ')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (13, 103, 10, 1, N'Thẻ cào Viettel 100k', N'Serial2U5W3653B', N'Code20UXXCNAE')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (14, 10, 11, 1, N'Thẻ cào Viettel 50k', N'Serial1DX021G6U', N'Code1VFPT5DQN')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (15, 104, 12, 1, N'Thẻ cào Viettel 100k', N'Serial2WO3OUXHK', N'Code2CY93XITQ')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (16, 11, 13, 1, N'Thẻ cào Viettel 50k', N'Serial1QUK4NB7P', N'Code1TDDCL9K5')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (17, 12, 14, 1, N'Thẻ cào Viettel 50k', N'Serial1UH2W4PB7', N'Code120IF8WYH')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (18, 13, 15, 1, N'Thẻ cào Viettel 50k', N'Serial1DU7J5CYZ', N'Code1A75YO730')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (19, 14, 16, 1, N'Thẻ cào Viettel 50k', N'Serial1J9J2WIN0', N'Code1L93L02MQ')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (20, 15, 17, 1, N'Thẻ cào Viettel 50k', N'Serial1VD8CEV1L', N'Code10F4OSY7C')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (21, 16, 17, 1, N'Thẻ cào Viettel 50k', N'Serial131YQOAEF', N'Code1ITDZYQ5Z')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (22, 17, 17, 1, N'Thẻ cào Viettel 50k', N'Serial11NNS2KE8', N'Code1UCSM4KRE')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (23, 18, 17, 1, N'Thẻ cào Viettel 50k', N'Serial19K5ADCKQ', N'Code1PTOCGVMP')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (24, 19, 17, 1, N'Thẻ cào Viettel 50k', N'Serial1YRMIO52K', N'Code140HLACHR')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (25, 105, 18, 1, N'Thẻ cào Viettel 100k', N'Serial23ZRSOCFY', N'Code2XZG9UPT1')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (26, 901, 19, 1, N'Thẻ cào Viettel 500k', N'Serial10CSIV3CIQ', N'Code10PX41DU1B')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (27, 902, 19, 1, N'Thẻ cào Viettel 500k', N'Serial10C2LWY0W4', N'Code10AG222HUN')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (28, 1001, 20, 1, N'Thẻ cào Mobifone 500k', N'Serial11YOBT6ACU', N'Code11PQ67MCNU')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (29, 1101, 21, 1, N'Thẻ cào Vinaphone 50k', N'Serial12IIL30L7B', N'Code12JVOW7XRZ')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (30, 1301, 22, 1, N'Thẻ cào Vinaphone 200k', N'Serial14YKTF04EA', N'Code14U4Y1ECW3')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (31, 20, 23, 1, N'Thẻ cào Viettel 50k', N'Serial1OGKKJN6L', N'Code12DYHQ6PQ')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (32, 1, 24, 1, N'Thẻ cào Viettel 50k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (33, 2, 24, 1, N'Thẻ cào Viettel 50k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (34, 1, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (35, 2, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (36, 3, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial177FUOXYV', N'Code1FOQ4K8W4')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (37, 4, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial1H20HZ922', N'Code1X3OOV6R8')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (38, 5, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial1S1Z2KMVJ', N'Code1J0GLMDUT')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (39, 6, 25, 1, N'Thẻ cào Mobifone 50k', N'Serial15R2E2HOZ', N'Code1YVLQEYDU')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (40, 1, 26, 2, N'Tài khoản Netflix 6 tháng', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (41, 1, 27, 2, N'Netflix Premium 1 Năm', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (42, 1, 28, 1, N'Thẻ cào Mobifone 200k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (43, 2, 28, 1, N'Thẻ cào Mobifone 200k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (44, 1, 29, 1, N'Thẻ cào Mobifone 100k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (45, 2, 29, 1, N'Thẻ cào Mobifone 100k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (46, 3, 29, 1, N'Thẻ cào Mobifone 100k', N'Serial177FUOXYV', N'Code1FOQ4K8W4')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (47, 1, 30, 2, N'Tài khoản Netflix 1 tháng', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (48, 1, 31, 1, N'Thẻ cào Viettel 50k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (49, 2, 31, 1, N'Thẻ cào Viettel 50k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (50, 1, 32, 1, N'Thẻ cào Viettel 100k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (51, 2, 32, 1, N'Thẻ cào Viettel 100k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (52, 3, 32, 1, N'Thẻ cào Viettel 100k', N'Serial177FUOXYV', N'Code1FOQ4K8W4')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (53, 1, 33, 1, N'Thẻ cào Viettel 200k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (54, 1, 34, 1, N'Thẻ cào Mobifone 100k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (55, 2, 34, 1, N'Thẻ cào Mobifone 100k', N'Serial1R6LGI4XN', N'Code1HN5INLYG')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (56, 3, 34, 1, N'Thẻ cào Mobifone 100k', N'Serial177FUOXYV', N'Code1FOQ4K8W4')
INSERT [dbo].[OrderHistoryDetail] ([ID], [ProductDetailID], [OrderHistoryID], [CategoryID], [ProductName], [Serial], [Code]) VALUES (57, 1, 35, 1, N'Thẻ cào Mobifone 200k', N'Serial14SSI7BUU', N'Code1W4ERD1N6')
SET IDENTITY_INSERT [dbo].[OrderHistoryDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderReport] ON 

INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (1, 1, N'1', CAST(N'2024-07-28T00:05:09.223' AS DateTime), N'loi', 1)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (2, 16, N'5', CAST(N'2024-07-28T07:54:07.943' AS DateTime), N'loi', 1)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (3, 16, N'5', CAST(N'2024-07-28T07:54:15.033' AS DateTime), N'loi', 1)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (4, 16, N'5', CAST(N'2024-07-28T07:56:57.127' AS DateTime), N'hta', 1)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (5, 22, N'1', CAST(N'2024-07-28T09:00:35.967' AS DateTime), N'khong dung duoc', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (6, 25, N'7', CAST(N'2024-07-28T13:59:18.933' AS DateTime), N'không thể sử dụng thẻ', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (7, 25, N'7', CAST(N'2024-07-28T13:59:39.490' AS DateTime), N'thẻ bị lỗi', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (8, 29, N'7', CAST(N'2024-07-28T13:59:52.707' AS DateTime), N'thẻ này không dùng được', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (9, 27, N'7', CAST(N'2024-07-28T14:00:11.560' AS DateTime), N'mật khẩu không đúng', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (10, 31, N'2', CAST(N'2024-07-28T14:02:51.447' AS DateTime), N'sao code không đúng', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (11, 33, N'2', CAST(N'2024-07-28T14:03:02.793' AS DateTime), N'mã thẻ cào sai rồi', 0)
INSERT [dbo].[OrderReport] ([Id], [OrderHistoryId], [ReportedBy], [ReportDate], [Issue], [IsResolved]) VALUES (12, 35, N'2', CAST(N'2024-07-28T14:03:14.123' AS DateTime), N'thẻ đã quá hạn sử dụng', 0)
SET IDENTITY_INSERT [dbo].[OrderReport] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (1, N'Thẻ cào Viettel 50k', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltyuyak4sv8131', NULL, N'Thẻ cào Viettel mệnh giá 50,000 VND', CAST(50.00 AS Decimal(10, 2)), 74, 1, 1, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'Thẻ cào Viettel 100k', N'https://down-vn.img.susercontent.com/file/6fb91b32e05000e7dcc82b7f32c718c7', NULL, N'Thẻ cào Viettel mệnh giá 100,000 VND', CAST(100.00 AS Decimal(10, 2)), 92, 1, 1, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'Thẻ cào Viettel 200k', N'https://down-vn.img.susercontent.com/file/471c9818e6a57437024bdeeef0a5cb3f', NULL, N'Thẻ cào Viettel mệnh giá 200,000 VND', CAST(200.00 AS Decimal(10, 2)), 99, 1, 1, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (4, N'Thẻ cào Mobifone 50k', N'https://down-vn.img.susercontent.com/file/d91213cf6fb27bed32ce02f0be8b105c', NULL, N'Thẻ cào Mobifone mệnh giá 50,000 VND', CAST(50.00 AS Decimal(10, 2)), 94, 1, 2, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (5, N'Thẻ cào Mobifone 100k', N'https://down-vn.img.susercontent.com/file/4ec6fb6d50ceda143b334b3492b75a03', NULL, N'Thẻ cào Mobifone mệnh giá 100,000 VND', CAST(100.00 AS Decimal(10, 2)), 93, 1, 2, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (6, N'Thẻ cào Mobifone 200k', N'https://down-vn.img.susercontent.com/file/823b8344a20647491b89ac4f7b81e18d', NULL, N'Thẻ cào Mobifone mệnh giá 200,000 VND', CAST(200.00 AS Decimal(10, 2)), 97, 1, 2, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (7, N'Tài khoản Netflix 1 tháng', N'https://quantraai.com/wp-content/uploads/2023/11/anh-san-pham-Tai-khoan-netflix-premium-1-thang.jpg', NULL, N'Tài khoản Netflix gói Basic', CAST(180.00 AS Decimal(10, 2)), 99, 2, 4, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (8, N'Tài khoản Netflix 6 tháng', N'https://quantraai.com/wp-content/uploads/2023/11/anh-san-pham-tai-khoan-Netflix-premium-6-thang.jpg', NULL, N'Tài khoản Netflix gói Standard', CAST(220.00 AS Decimal(10, 2)), 99, 2, 4, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (9, N'Netflix Premium 1 Năm', N'https://quantraai.com/wp-content/uploads/2023/11/anh-san-pham-Tai-khoan-Netflix-premium-1-nam.jpg', NULL, N'Tài khoản Netflix gói Premium', CAST(260.00 AS Decimal(10, 2)), 99, 2, 4, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (10, N'Thẻ cào Viettel 500k', N'https://down-vn.img.susercontent.com/file/6cf326a037069f6e18058f30f9663951', NULL, N'Thẻ cào Viettel mệnh giá 500,000 VND', CAST(500.00 AS Decimal(10, 2)), 98, 1, 1, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (11, N'Thẻ cào Mobifone 500k', N'https://down-vn.img.susercontent.com/file/0b354e37ea7e277e01ee9623a049d103', NULL, N'Thẻ cào Mobifone mệnh giá 500,000 VND', CAST(500.00 AS Decimal(10, 2)), 99, 1, 2, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (12, N'Thẻ cào Vinaphone 50k', N'https://down-vn.img.susercontent.com/file/e440f4de976bb837a1dc6cd1294188a8', NULL, N'Thẻ cào Vinaphone mệnh giá 50,000 VND', CAST(50.00 AS Decimal(10, 2)), 99, 1, 3, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (13, N'Thẻ cào Vinaphone 100k', N'https://down-vn.img.susercontent.com/file/fd429e404f03e33a9869ac249c526ffc', NULL, N'Thẻ cào Vinaphone mệnh giá 100,000 VND', CAST(100.00 AS Decimal(10, 2)), 100, 1, 3, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (14, N'Thẻ cào Vinaphone 200k', N'https://down-vn.img.susercontent.com/file/388a32d00bf389cc49482b792720a963', NULL, N'Thẻ cào Vinaphone mệnh giá 200,000 VND', CAST(200.00 AS Decimal(10, 2)), 99, 1, 3, CAST(N'2024-06-06T21:34:06.073' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (15, N'Thắng pass', N'https://bochickenstore.com/storage/large/tai-khoan-quizlet-pl_1672635955.png', NULL, N'123', CAST(108.00 AS Decimal(10, 2)), 0, 3, 1, CAST(N'2024-07-27T20:52:21.983' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (16, N'Thẻ cào Viettel Test', N'áđấ', NULL, N'Thẻ cào Viettel mệnh giá 50,000 VND', CAST(200.00 AS Decimal(10, 2)), 78, 1, 1, NULL, NULL, CAST(N'2024-07-28T09:35:26.310' AS DateTime), N'admin', CAST(N'2024-07-28T09:43:28.780' AS DateTime), 1, N'admin')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (17, N'Le Thi Banh', N'áas', NULL, N'avc', CAST(100.00 AS Decimal(10, 2)), 0, 1, 1, CAST(N'2024-07-28T09:43:04.133' AS DateTime), N'admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Image], [Expiry], [Description], [Price], [Quantity], [CategoryID], [BrandID], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (18, N'thanh842', N'áas', NULL, N'avc', CAST(300.00 AS Decimal(10, 2)), 0, 2, 1, CAST(N'2024-07-28T09:56:10.380' AS DateTime), N'admin', CAST(N'2024-07-28T09:56:47.223' AS DateTime), N'admin', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1, N'Serial14SSI7BUU', N'Code1W4ERD1N6', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (2, N'Serial1R6LGI4XN', N'Code1HN5INLYG', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (3, N'Serial177FUOXYV', N'Code1FOQ4K8W4', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (4, N'Serial1H20HZ922', N'Code1X3OOV6R8', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (5, N'Serial1S1Z2KMVJ', N'Code1J0GLMDUT', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (6, N'Serial15R2E2HOZ', N'Code1YVLQEYDU', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (7, N'Serial1IDFYRUS7', N'Code13X374GQN', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (8, N'Serial1T4BATUBX', N'Code1SZPRQ8EX', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (9, N'Serial12MLI00IT', N'Code1GITCVFOJ', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (10, N'Serial1DX021G6U', N'Code1VFPT5DQN', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (11, N'Serial1QUK4NB7P', N'Code1TDDCL9K5', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (12, N'Serial1UH2W4PB7', N'Code120IF8WYH', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (13, N'Serial1DU7J5CYZ', N'Code1A75YO730', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (14, N'Serial1J9J2WIN0', N'Code1L93L02MQ', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (15, N'Serial1VD8CEV1L', N'Code10F4OSY7C', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (16, N'Serial131YQOAEF', N'Code1ITDZYQ5Z', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (17, N'Serial11NNS2KE8', N'Code1UCSM4KRE', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (18, N'Serial19K5ADCKQ', N'Code1PTOCGVMP', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (19, N'Serial1YRMIO52K', N'Code140HLACHR', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (20, N'Serial1OGKKJN6L', N'Code12DYHQ6PQ', 1, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (21, N'Serial10MAPODDR', N'Code1K021QRK4', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (22, N'Serial17TXT8REO', N'Code1QZLYP0FM', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (23, N'Serial1AY35PSUT', N'Code165NJ8F3C', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (24, N'Serial151PVL74D', N'Code1OAXICQ5S', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (25, N'Serial15PY7526H', N'Code15CRF9QYH', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (26, N'Serial1QSWO87WT', N'Code1NXGF9C1W', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (27, N'Serial1PD67M66U', N'Code1YJNZ6Z5B', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (28, N'Serial12YS64GJA', N'Code1LQB3O3IU', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (29, N'Serial1MDQXZUAA', N'Code1AZ8OZ8S7', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (30, N'Serial1HBC9HD49', N'Code18JW6QCRP', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (31, N'Serial10WMF35FQ', N'Code19DPGBKYG', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (32, N'Serial1T34RUH0L', N'Code1Z7EFOUF7', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (33, N'Serial14VAUG9ZP', N'Code1XW1OHPP8', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (34, N'Serial1ADPXTNJZ', N'Code1VNS7ZXC5', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (35, N'Serial1JQ4ETD3E', N'Code100OF2XX3', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (36, N'Serial10DDWUTMP', N'Code1JNNTDDYD', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (37, N'Serial187UIIQEQ', N'Code1H7A542N4', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (38, N'Serial1H3JLORZ2', N'Code1V456XN3X', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (39, N'Serial1HC3UDZJW', N'Code1LRCVOWFW', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (40, N'Serial1CG9WUNIF', N'Code1ZJ48I1PO', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (41, N'Serial169WPA80F', N'Code1D38B8PO3', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (42, N'Serial1ABZ9I8DI', N'Code1B3OGZ5KW', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (43, N'Serial17HA5DQAG', N'Code1D7OW8NAS', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (44, N'Serial1EXVAAYI8', N'Code1FUR6UFOD', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (45, N'Serial12U9TJUAT', N'Code1O1QA1UY2', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (46, N'Serial127G76F2R', N'Code16SBMULAU', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (47, N'Serial1FE6NESY7', N'Code1N2T8FXE7', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (48, N'Serial1NS3PPL7Q', N'Code1ASA5K456', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (49, N'Serial13IQCKOUK', N'Code1AMSG188N', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (50, N'Serial1BYGIAQ74', N'Code1FM78Q6XL', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (51, N'Serial1YTSXHN5D', N'Code1VJDPWQCN', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (52, N'Serial1DXJQLJ59', N'Code1DBU2WKBE', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (53, N'Serial1F3IMQ33S', N'Code1U0X01RJB', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (54, N'Serial1DBQVJJTN', N'Code1JVC70M8V', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (55, N'Serial16PAJAIZ8', N'Code190I8OS48', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (56, N'Serial1VRXJQUJ8', N'Code1G21J3MH7', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (57, N'Serial1INR9ASW0', N'Code1TLKZKM6W', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (58, N'Serial1ER0OB29W', N'Code1MB6GFD2P', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (59, N'Serial1UC7GN1K1', N'Code1RUUTPYB9', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (60, N'Serial1KVVSU3PW', N'Code1T9JDBWD3', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (61, N'Serial1263OWYKX', N'Code1ERDZJJO1', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (62, N'Serial16PM8GYUW', N'Code136BCQJVJ', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (63, N'Serial1DOME4HE0', N'Code1FOTLM9C6', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (64, N'Serial17AF6NLAR', N'Code1VOU1X6YL', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (65, N'Serial19HRO93IZ', N'Code1RH2KK9TQ', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (66, N'Serial1O1TG336P', N'Code1BA6VG92A', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (67, N'Serial111762J3L', N'Code1STKGH2PI', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (68, N'Serial1RL2WGNYD', N'Code10QI74UMJ', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (69, N'Serial1L6VU6VSZ', N'Code1IBEZSZV3', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (70, N'Serial1NTTTYM3L', N'Code14DK2CHPV', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (71, N'Serial181VB31E1', N'Code1NHJBZ7J4', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (72, N'Serial1RVWKVVI7', N'Code1EY5T5JV5', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (73, N'Serial1EB5QRCX4', N'Code1RRZJKQI0', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (74, N'Serial1Y5TOISVN', N'Code15U0GKLYE', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (75, N'Serial1QCBWO0C6', N'Code1JGXKZ0BC', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (76, N'Serial1MNE4PLU0', N'Code1E6TLPTZB', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (77, N'Serial12VB2ISH3', N'Code1Y2F6MI3C', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (78, N'Serial1KPEXMK44', N'Code17AEB9Q83', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (79, N'Serial1T15H5C7T', N'Code1FPWVCFXU', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (80, N'Serial1X7R1B6H0', N'Code164UDPRTM', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (81, N'Serial1B1NLGEGA', N'Code15CX63Z6Z', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (82, N'Serial1O6EKL1SQ', N'Code1XJUB4ZFK', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (83, N'Serial1MCKUKVSC', N'Code1SK9GKKGT', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (84, N'Serial14SBR24Q0', N'Code1IXX566F7', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (85, N'Serial1EOKLRSUC', N'Code17HND2709', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (86, N'Serial1CRY63YBI', N'Code1MPA2N2S5', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (87, N'Serial1QCN95IF0', N'Code1AR3HTCSP', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (88, N'Serial1Q3S0W8A0', N'Code1X1EXUEI8', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (89, N'Serial11LPVTBW6', N'Code1J93S815I', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (90, N'Serial1EQ42IF2R', N'Code1S2DOVFR5', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (91, N'Serial1J6EDB870', N'Code1UBVDR2PF', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (92, N'Serial1KGGB39QS', N'Code16XYAINET', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (93, N'Serial1KUSI9ZWZ', N'Code1VHMDAC59', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (94, N'Serial1UHVKZBZM', N'Code1RO9H790V', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (95, N'Serial1JSITLASK', N'Code1XFFGQI4B', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (96, N'Serial16ZD9ACT0', N'Code1UCANMYL1', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (97, N'Serial1V7VJ8SRT', N'Code19LG7LU1C', 1, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (101, N'Serial26ZO320KW', N'Code2C0XF6TC8', 2, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (102, N'Serial2ZQKPEPSR', N'Code2WLABRAUF', 2, 1)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (103, N'Serial2U5W3653B', N'Code20UXXCNAE', 2, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (104, N'Serial2WO3OUXHK', N'Code2CY93XITQ', 2, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (105, N'Serial23ZRSOCFY', N'Code2XZG9UPT1', 2, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (106, N'Serial2UQI28V7N', N'Code2VY9E6DUB', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (107, N'Serial2SVLB63FZ', N'Code2R36ZDM2P', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (108, N'Serial2C5RG2S1V', N'Code22SJV4K15', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (109, N'Serial2RDB0PPPR', N'Code2QZOLJUB7', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (110, N'Serial29VMT3O4L', N'Code25GK40JHJ', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (111, N'Serial2436SPCW3', N'Code2KX5784LO', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (112, N'Serial205RUJ23T', N'Code2HLCJ0JT7', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (113, N'Serial2VRKHSJVS', N'Code27FUWPHBI', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (114, N'Serial20YT8I73S', N'Code2KM1DQOND', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (115, N'Serial2284VMLC4', N'Code2T4MRSU53', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (116, N'Serial2N4BEEX7M', N'Code2Q2OECK60', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (117, N'Serial2L6GA68R6', N'Code24RAC6AXV', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (118, N'Serial2VV102LD4', N'Code28DZ9GWZ6', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (119, N'Serial25W07YSRI', N'Code28RYD9CHO', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (120, N'Serial2K46TSZ23', N'Code246CIHTWH', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (121, N'Serial2E49IWMG1', N'Code20E0SZWI8', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (122, N'Serial2P2GLA52G', N'Code2JHQ1XF3V', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (123, N'Serial2XRD7U1BI', N'Code2TR1AUKXS', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (124, N'Serial2RQ5LYF7A', N'Code2RZNC8HVT', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (125, N'Serial21FADZPIK', N'Code2JFY2JDW2', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (126, N'Serial2F8404VC5', N'Code2PD4ZEWJY', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (127, N'Serial2UKA4ZK1B', N'Code2ZWFNGMMD', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (128, N'Serial2T36R0XVO', N'Code2EIE2ELPZ', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (129, N'Serial2P2GFI0B7', N'Code2U7J383A2', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (130, N'Serial2Z3QDXO90', N'Code2Z48ROH98', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (131, N'Serial2EJ14G7F8', N'Code2WZS8IK3F', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (132, N'Serial2GEVISXOD', N'Code24TI4N8SR', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (133, N'Serial25C5UDBFL', N'Code2QGPRNOXJ', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (134, N'Serial2JCHQ3RBA', N'Code2ABI8QCHI', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (135, N'Serial2WY74Y0H5', N'Code2D2EDBL51', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (136, N'Serial26IQGE39I', N'Code23CRKSY5A', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (137, N'Serial2LAQ2KLJU', N'Code2KDL3PQDE', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (138, N'Serial29MZJ7M5T', N'Code2IODEU99U', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (139, N'Serial2CO1IFYZR', N'Code2AB3D2EKB', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (140, N'Serial286COKYFW', N'Code23KMHVSVB', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (141, N'Serial2B3831OG6', N'Code2TJU781TO', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (142, N'Serial2JYFTWDJP', N'Code2JIYTNRZ4', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (143, N'Serial281YW5WIQ', N'Code210IRST1U', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (144, N'Serial2XTR1AFJ1', N'Code2EP5Z3PIW', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (145, N'Serial27IQVRYYZ', N'Code20SOJ2K0H', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (146, N'Serial2LFT6J9TB', N'Code2P9YNV1A2', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (147, N'Serial2FCM03DBU', N'Code20FJETM07', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (148, N'Serial2D1YBN0MR', N'Code2FXZQOAC8', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (149, N'Serial2BT5WDFXB', N'Code2TELDAZOX', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (150, N'Serial2GT03M4FN', N'Code2P85RBMIG', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (151, N'Serial2VYJNQ8PK', N'Code2Z1Y91QMB', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (152, N'Serial2HBFIF51G', N'Code27RR8W0PK', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (153, N'Serial2OMW4X3A6', N'Code2NHFTCISH', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (154, N'Serial2N52FF00O', N'Code26U4BC43B', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (155, N'Serial2WWEU1MQJ', N'Code287UQ4GHY', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (156, N'Serial269CWKYBM', N'Code2RRH2FX4A', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (157, N'Serial2I2C7BVAU', N'Code2LVQ97WGS', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (158, N'Serial2OZUDRKBW', N'Code2JTIGG5EL', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (159, N'Serial2CD8WY3J0', N'Code26S9U0P74', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (160, N'Serial2B01N2MGW', N'Code26NXNJG6J', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (161, N'Serial2UH3LVI1C', N'Code20IW5EQHN', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (162, N'Serial2VPGQW7PT', N'Code2QT7WXOL4', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (163, N'Serial29NFJNI4H', N'Code22G5JR0K4', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (164, N'Serial2E8V3L0MY', N'Code2FAP87DFT', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (165, N'Serial26X2NJNRI', N'Code2QV38X9HA', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (166, N'Serial2XQKMVJ0O', N'Code2WSLC2BY3', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (167, N'Serial20PQFNTMP', N'Code2OKYIZ1UV', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (168, N'Serial2TFVTCZQK', N'Code2J0R9HU6A', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (169, N'Serial2J2H6I3XF', N'Code2X2J050RC', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (170, N'Serial275YO8OO7', N'Code2DKSZWDLA', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (171, N'Serial23WHPT1A1', N'Code26T2VG0YW', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (172, N'Serial2K7PLNZD7', N'Code2GYGN46FS', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (173, N'Serial2RNMXW3GL', N'Code27TT2KU0Q', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (174, N'Serial2BS7CQNB7', N'Code2GDXS7SNV', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (175, N'Serial2BCJHNWYD', N'Code2U7EHRGG1', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (176, N'Serial25Q7C8T46', N'Code26Q332SKO', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (177, N'Serial2YF921A51', N'Code290MNP97A', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (178, N'Serial2LS6SE6VH', N'Code23D9CEZKY', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (179, N'Serial2AFA37R7H', N'Code2NIBY7L1P', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (180, N'Serial2ALTDBJLA', N'Code2HK8OQIFM', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (181, N'Serial2TVV5I42D', N'Code2BSHRN7B6', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (182, N'Serial2I2SS9Q6V', N'Code2KEZO9RAY', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (183, N'Serial2FHB21TBX', N'Code2BVMZOAD0', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (184, N'Serial2W95K844V', N'Code2DQBX0OV9', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (185, N'Serial2UBCLPNPM', N'Code285Q3UQAM', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (186, N'Serial2L5C5OLP0', N'Code2DV2Y0EP0', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (187, N'Serial2BFYYULO4', N'Code2YLCI5QMS', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (188, N'Serial2G5V2VSCQ', N'Code252PW56NT', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (189, N'Serial2Y9AJ42LN', N'Code22VV4DNBP', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (190, N'Serial2MC5VTG6E', N'Code2ZN32356M', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (191, N'Serial2162SH3FF', N'Code2IF7352U1', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (192, N'Serial2KF0398EE', N'Code2NCDCHOBP', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (193, N'Serial2VR0XX3E2', N'Code2DSUTFFV4', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (194, N'Serial20ZRPF6I8', N'Code2MZF38EU5', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (195, N'Serial2A52CI342', N'Code2FNJHTQV1', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (196, N'Serial2W2MS8KY9', N'Code214FPUOXO', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (197, N'Serial2AJVYTPCA', N'Code2YRG4WI79', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (198, N'Serial2KLT9TNZN', N'Code2UPNP7KJY', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (199, N'Serial2AHEUDIR5', N'Code2P9XJ8E1U', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (200, N'Serial20MATONS2', N'Code2XOTYONQ6', 2, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (201, N'Serial3UD3Y1CV5', N'Code3CGK88QMZ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (202, N'Serial3HCTXXKPC', N'Code3K6FNHTIY', 3, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (203, N'Serial3DPADOC5U', N'Code3WAYJ2RZV', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (204, N'Serial35NW7E2A3', N'Code37FUZRBGX', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (205, N'Serial3JGESA0ID', N'Code3HF86QQGY', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (206, N'Serial3CFT67VKS', N'Code3LI62ED4P', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (207, N'Serial3LYAU3LDU', N'Code39Q60SN6R', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (208, N'Serial3DSCQAJ9N', N'Code3Y7NT0D76', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (209, N'Serial3WGCCNWFV', N'Code3IXM1C897', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (210, N'Serial33W9I2W4S', N'Code39WXR5J1P', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (211, N'Serial302GGEVKV', N'Code3YDQ32R5C', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (212, N'Serial3H4RLY7R4', N'Code3QA1O6HMM', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (213, N'Serial3ARDH3BEP', N'Code3FODZ12VD', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (214, N'Serial3ATP5ADQG', N'Code3GU21O9SO', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (215, N'Serial3HC0PKEOB', N'Code345EEA3L6', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (216, N'Serial3I684U2SD', N'Code31QG494J7', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (217, N'Serial3NQNK8QJL', N'Code384OH76WK', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (218, N'Serial3S20RU7NH', N'Code3UPRV87DJ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (219, N'Serial3XII4YH2M', N'Code3BSBTFRZN', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (220, N'Serial3N0DK9UAP', N'Code3AVSAI878', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (221, N'Serial3P4YH69CV', N'Code37M3B74HF', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (222, N'Serial37E0YQ1L9', N'Code3LBMNSYIX', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (223, N'Serial3E75GW899', N'Code3HDJEIH37', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (224, N'Serial3BWNI7247', N'Code3YEF2OY26', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (225, N'Serial3FH1VZBPB', N'Code3KQLGKCA1', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (226, N'Serial36MNJ9YME', N'Code3LUBH38VK', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (227, N'Serial3NWN575XV', N'Code3IOMIRYLU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (228, N'Serial3HCPH2YR9', N'Code3FC2GAAPT', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (229, N'Serial3HU2NREIZ', N'Code3OMW9NX9F', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (230, N'Serial3E5EVPGU0', N'Code3GR8FIONW', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (231, N'Serial3FKWACIY4', N'Code3MLLGIO3Q', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (232, N'Serial3TY9PY3GU', N'Code3KTSOAGMG', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (233, N'Serial3GAEKOP19', N'Code3GOVL851X', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (234, N'Serial3N5Z94Z1V', N'Code3A9ME1PZW', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (235, N'Serial34ZMDJNHX', N'Code3HM9H2LT4', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (236, N'Serial3Z6SRQFQJ', N'Code3AEJG6IUB', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (237, N'Serial3BFJCPV63', N'Code31JLET8QG', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (238, N'Serial3RHW41QF1', N'Code3L0HN421K', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (239, N'Serial3D9YHG3FA', N'Code3DLOHXPWK', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (240, N'Serial3NCHQ2VIV', N'Code3LC8DV9F8', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (241, N'Serial3XAE7ODC9', N'Code37FJ3PU4J', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (242, N'Serial3G2LTXGB4', N'Code3V1NCTCOR', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (243, N'Serial3PXLY37WN', N'Code302C2ERPI', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (244, N'Serial3DHCU20BO', N'Code383K9SBQB', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (245, N'Serial3SOQV9WYS', N'Code3QNGGQO9N', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (246, N'Serial3NSE3GMB6', N'Code38JOR9P5J', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (247, N'Serial3DDFT6Q6J', N'Code3O20U2RWM', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (248, N'Serial31MEH42ER', N'Code3AXWBZZT1', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (249, N'Serial341RD7I6F', N'Code3CCDX3QWL', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (250, N'Serial36ME47SM3', N'Code3VGWWIRGE', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (251, N'Serial3CDH2B3YY', N'Code3XQ6JTIM3', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (252, N'Serial3F77Y9GXN', N'Code3QS1RZRGT', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (253, N'Serial3S70ANKLI', N'Code3413Z5JUQ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (254, N'Serial3CFHSOUTF', N'Code3PANFJTN5', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (255, N'Serial3JU27L5LE', N'Code3YT4LQ604', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (256, N'Serial309BDYPBW', N'Code3VVGA7ZAO', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (257, N'Serial3EDT22J79', N'Code3XCHL1EZO', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (258, N'Serial3XMWYJVNC', N'Code36R8WDUQF', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (259, N'Serial31EODHZG8', N'Code3SDJ1IB6I', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (260, N'Serial3LKNI3A55', N'Code34SBY668W', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (261, N'Serial30VQ43LNS', N'Code3DXY5IKAZ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (262, N'Serial3J7POOGJA', N'Code37I9NNUED', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (263, N'Serial3NW3YDFQU', N'Code3MKX2O5JB', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (264, N'Serial3DT6LFY83', N'Code3OXBMD7ZM', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (265, N'Serial3ZAWEG8QN', N'Code3XFX3JCYP', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (266, N'Serial3KECLA0BL', N'Code3R1LFBWDU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (267, N'Serial38ND1O1PY', N'Code3DNCFJSWX', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (268, N'Serial3MDQ6G0V1', N'Code3L70B4U13', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (269, N'Serial3R5IF2C98', N'Code3Q2N8VU1W', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (270, N'Serial3F31L0QNK', N'Code3YK6PIQPG', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (271, N'Serial3JDXP3FB9', N'Code3DDTWPWS4', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (272, N'Serial3IX1TA5HY', N'Code3G0SK5ATL', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (273, N'Serial3OYIYYU2Y', N'Code3FGR15GA4', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (274, N'Serial3G6UNR5QG', N'Code3PPB1YJ4H', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (275, N'Serial38DYNX750', N'Code3X9S5BSH6', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (276, N'Serial32YA8W0JA', N'Code3KFJN4SM7', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (277, N'Serial3NK5G75QH', N'Code3533DELLS', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (278, N'Serial3KPI6I9FY', N'Code3J0H5NZMG', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (279, N'Serial3L1B8T4FQ', N'Code35D3YI8AU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (280, N'Serial3GNYYV1KN', N'Code3Q1YM1ZCM', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (281, N'Serial3MCSANGGY', N'Code3EP0A307U', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (282, N'Serial333FCW5EG', N'Code3HDNXHHCA', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (283, N'Serial3BWP5X0EB', N'Code3EPMHOND4', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (284, N'Serial38MY5O3DE', N'Code3KGHJ7A95', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (285, N'Serial3O7YKOKJ6', N'Code3WHJEIOAU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (286, N'Serial35CU890CF', N'Code356VMPVUR', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (287, N'Serial33JX3RIPL', N'Code32CSHH2WA', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (288, N'Serial31JGURXSV', N'Code3JSODYG55', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (289, N'Serial3CW1PO3ID', N'Code3A05SACUQ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (290, N'Serial3KJWANM6J', N'Code3E7DBFZCI', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (291, N'Serial3O5AW2OO1', N'Code39SF4O7GB', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (292, N'Serial385P3SWF6', N'Code3HRF7C3MU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (293, N'Serial3NN8JHFB1', N'Code3A0115YLU', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (294, N'Serial30EEHS3MP', N'Code33YFLUA25', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (295, N'Serial3KTORP8HN', N'Code3J5BV6KKG', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (296, N'Serial3W76407F8', N'Code395PRRFKO', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (297, N'Serial3MTZH00JY', N'Code310M2V3TZ', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (298, N'Serial373TV0ZMT', N'Code315QZB76T', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (299, N'Serial3MWLJFKC4', N'Code3QRP2NJUE', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (300, N'Serial3R2JJPSBJ', N'Code3IUSK2I3R', 3, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (301, N'Serial45SN07MEH', N'Code4IIG4DCRP', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (302, N'Serial4ZZXEG9FJ', N'Code40WG65IDC', 4, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (303, N'Serial4ACHH3J6C', N'Code4HG5RYS0P', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (304, N'Serial4DBFAOWN7', N'Code4PNZ96DX9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (305, N'Serial49JLF3WLD', N'Code4IN2YG28P', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (306, N'Serial4X2RZGUOA', N'Code4RZ75LRRL', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (307, N'Serial4BGJKVQ98', N'Code48145WIWI', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (308, N'Serial480N2PECR', N'Code40P2P1K5W', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (309, N'Serial4JG5XO1NH', N'Code4AVAJLB4L', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (310, N'Serial45K5QEIZA', N'Code4LVS63GK9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (311, N'Serial4YUE5FCZ3', N'Code4LIQWGCGK', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (312, N'Serial4XXNBCWY3', N'Code4VEF87FHG', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (313, N'Serial4MC4BVDN0', N'Code40K371F7J', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (314, N'Serial49AH54GFC', N'Code42DZ1QBUA', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (315, N'Serial4I344OXJD', N'Code4M90SJG2U', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (316, N'Serial4572N1QM3', N'Code4CES3LNS9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (317, N'Serial4XS974KTF', N'Code4QC83BVDV', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (318, N'Serial4N4PYWOQ1', N'Code4W8ZQCAPD', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (319, N'Serial4GO58U58M', N'Code4UGQEA8D6', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (320, N'Serial4QQWQT7PB', N'Code4VWZLY0NL', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (321, N'Serial4VJQTI9E9', N'Code49SEZ15G9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (322, N'Serial4HJGTBMTL', N'Code4AQCW7OJC', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (323, N'Serial44LK0N9AU', N'Code4P5DHZA64', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (324, N'Serial4JDF60UQC', N'Code4XGT3MSCV', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (325, N'Serial49MDJ52TY', N'Code4T4H0Y5BN', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (326, N'Serial4YDR7DMM3', N'Code4922KM80T', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (327, N'Serial4Z4ZX7AWG', N'Code4PVOA1U94', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (328, N'Serial4VRZNJ59S', N'Code4D1YL47EN', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (329, N'Serial4MADHM5SK', N'Code4J0MS5Q91', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (330, N'Serial4ZGC9AG51', N'Code4GUYEOMUH', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (331, N'Serial4NRYRGOCH', N'Code472RDBCZA', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (332, N'Serial4JC7A2SP1', N'Code484139QJP', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (333, N'Serial44SC21N81', N'Code4PXCO8FOZ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (334, N'Serial4MRAH4PX8', N'Code4W7ZSDBDR', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (335, N'Serial40U7RB9RR', N'Code4RYRXL9UP', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (336, N'Serial4X7LGDE8I', N'Code4SGRW06NC', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (337, N'Serial4DRYXYLVX', N'Code41J0VYXOD', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (338, N'Serial4SPR6XKDS', N'Code4105SL6DM', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (339, N'Serial4HP8IAPXA', N'Code4EDO6Q4BR', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (340, N'Serial42EDP8ZRE', N'Code4LTTK593N', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (341, N'Serial4X0WI6ZFL', N'Code4PULR3Z68', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (342, N'Serial489WYIHBF', N'Code41QHI87YM', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (343, N'Serial42T0LQCY6', N'Code4CMRC4QVQ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (344, N'Serial4T7RZSUHO', N'Code4317HSVT3', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (345, N'Serial4E1TDKVZX', N'Code4L40MNFRU', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (346, N'Serial4E0RDCP5C', N'Code4ZFUY8RVJ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (347, N'Serial41H72M2LL', N'Code4XVK10FFM', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (348, N'Serial4LTJXUGFN', N'Code4USVW8648', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (349, N'Serial4LEWZODMM', N'Code4VYD31TVO', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (350, N'Serial4DDBIGAZJ', N'Code4EZB0C2CO', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (351, N'Serial4RPW5BJ1J', N'Code4P04LGGDZ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (352, N'Serial4W7HCPBWA', N'Code45Q98KGQH', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (353, N'Serial4TFF692YJ', N'Code4K1YB1KH9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (354, N'Serial483Z61LGQ', N'Code4UXMCS65M', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (355, N'Serial4NDBZD5P7', N'Code4869CGLNH', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (356, N'Serial4WRGJEA94', N'Code4RM1TJPKV', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (357, N'Serial4D3ETY7NU', N'Code4JTO7I8GD', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (358, N'Serial4HZ77Q8XJ', N'Code4QMT03OG4', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (359, N'Serial4XNBK95YQ', N'Code4ITDRIYGR', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (360, N'Serial4OQF12TUB', N'Code4ML6NOGDG', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (361, N'Serial4IFHPETPY', N'Code4W0YHYR5W', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (362, N'Serial4CPDI8DZ5', N'Code4X0PMEPM1', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (363, N'Serial4U6LWVDEH', N'Code4DYBFUWUN', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (364, N'Serial4MBWR344B', N'Code431JWXOUT', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (365, N'Serial43JURYDO5', N'Code4NWB7I5V3', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (366, N'Serial47HGEXGL2', N'Code4L7Z9QA7U', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (367, N'Serial41645VYDS', N'Code4KWFEE7A5', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (368, N'Serial4CA0S6ZJR', N'Code418CK1OCN', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (369, N'Serial4Q1MRB70O', N'Code4BSLQHFA3', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (370, N'Serial4ZE017IKD', N'Code4HA25G1KU', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (371, N'Serial46K0A0VZT', N'Code4SAL07S3G', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (372, N'Serial4XDTQT0T5', N'Code4LCM0IHS4', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (373, N'Serial4VPOX2ET2', N'Code4VJ6PS44F', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (374, N'Serial464QYY4TO', N'Code4798TLGQX', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (375, N'Serial4B8A5WL4T', N'Code4AXRY3MD0', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (376, N'Serial444O4N6QB', N'Code48M9O37KA', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (377, N'Serial4V4C85HWJ', N'Code4JS2V8FDT', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (378, N'Serial4GLDMKD9P', N'Code4VIFA8AB7', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (379, N'Serial4WWMSABGU', N'Code4DCTEC5R4', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (380, N'Serial4754S5GV5', N'Code4WOR7QXUO', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (381, N'Serial4R412D30F', N'Code42JXNZH18', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (382, N'Serial4W45SQS6T', N'Code4H9A6INNQ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (383, N'Serial47IZVLT81', N'Code48HFTBOT9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (384, N'Serial4U7WX59ZW', N'Code4C2NAM12E', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (385, N'Serial41HRPZ59B', N'Code4N3JVREXR', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (386, N'Serial4TKJMZ2XV', N'Code490O6NRGJ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (387, N'Serial4OAMHJV10', N'Code4EMG8F5TQ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (388, N'Serial4NX2J6HBH', N'Code4EMGZYQLS', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (389, N'Serial4X2FCWZ3C', N'Code4EKMFAWXM', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (390, N'Serial421TPMQWE', N'Code4XP0SGOX0', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (391, N'Serial4EABY72DZ', N'Code4QPU8TC8I', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (392, N'Serial4FA1IQNH9', N'Code4QICKUPSO', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (393, N'Serial43E61XGON', N'Code4Y95Z4EEB', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (394, N'Serial4V4RCJDXC', N'Code4QC0EE4U0', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (395, N'Serial47OVFMUOH', N'Code48O8YUNZ5', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (396, N'Serial44RIGTA71', N'Code4ASNVCFB0', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (397, N'Serial46438FU3E', N'Code4N9EJZU55', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (398, N'Serial42EUOKU2M', N'Code4I85LRZOV', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (399, N'Serial4TLH0HHIB', N'Code4B2WA2ORZ', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (400, N'Serial4IJ3APRXT', N'Code4N3MJPOY9', 4, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (401, N'Serial5K80B73SR', N'Code5NHQ3OU0N', 5, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (402, N'Serial5FG45AT51', N'Code5L4RB2FXZ', 5, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (403, N'Serial59EOPZ9YJ', N'Code5G3J3T0OR', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (404, N'Serial5RLK5D6AQ', N'Code5KZOCY3JL', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (405, N'Serial5MEZP9DMB', N'Code5PWDSOQNH', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (406, N'Serial5CE7WLM35', N'Code5WH6NB7D4', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (407, N'Serial566TNTU3A', N'Code5TV10POT9', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (408, N'Serial5BUW9D2I4', N'Code5QEP7WYC2', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (409, N'Serial5EHL8XHBI', N'Code50VNML0B3', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (410, N'Serial5DCLMVBI7', N'Code542E4PIYN', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (411, N'Serial5P6X469GB', N'Code559U76FKW', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (412, N'Serial56324L5TJ', N'Code5UVNQ4EM5', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (413, N'Serial5BO8SO9IN', N'Code5LZ8YMWQO', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (414, N'Serial5M7H6YR4Y', N'Code5RX8W0PJC', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (415, N'Serial527YCIXKG', N'Code5P99TL6K1', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (416, N'Serial5LX2XLOJO', N'Code5FTXQIFGD', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (417, N'Serial51B6QLT5W', N'Code5A4TBUV2Y', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (418, N'Serial5LKIXTUWZ', N'Code561PABLKN', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (419, N'Serial5EIKV3A0U', N'Code5FG29POIZ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (420, N'Serial5J4GNW7KO', N'Code5P89YFA9S', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (421, N'Serial5016T9G2Q', N'Code5JCQGF2Y7', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (422, N'Serial53WFKFX07', N'Code5IKEX285M', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (423, N'Serial5FQCUNEJ3', N'Code5L8R7FBAD', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (424, N'Serial5UND8V492', N'Code5XWKKWMNE', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (425, N'Serial5YSTG3TUJ', N'Code57FTHMJ6O', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (426, N'Serial5S88X8KE1', N'Code5GU4ES2CJ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (427, N'Serial5GFJ6ZG32', N'Code5I74JP4JK', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (428, N'Serial5LMVJUAO6', N'Code5E2SJSPZU', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (429, N'Serial54AIBWQXR', N'Code5HBK0MZB7', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (430, N'Serial53PJMT1T3', N'Code59R95G2DZ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (431, N'Serial5JCAVZ5FE', N'Code53J0TO8L9', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (432, N'Serial5V7WL1PY3', N'Code5LI8RCNBJ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (433, N'Serial5EL6K89I2', N'Code51EKOLLO2', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (434, N'Serial50K9ZACW6', N'Code5PZNVLG24', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (435, N'Serial51DXN962O', N'Code5QEV79F0D', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (436, N'Serial5XE7WDQUE', N'Code546Z9KQ9F', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (437, N'Serial555SIQNDY', N'Code5TWVQCJ0A', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (438, N'Serial5NHUYOQAM', N'Code51HZ1AJ0C', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (439, N'Serial5S9K8S8NU', N'Code5UJRRZZ3D', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (440, N'Serial5PXAN27PS', N'Code57NEJEN8L', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (441, N'Serial56S9RD8ER', N'Code5167XF7S3', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (442, N'Serial5VUOZ4XNJ', N'Code54AANJZC6', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (443, N'Serial5Q89Z18L0', N'Code5AKIXWK0W', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (444, N'Serial5RGE7VQRL', N'Code53F3K039R', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (445, N'Serial5H3S2RBD2', N'Code5YZA69AHZ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (446, N'Serial5EWZWQGLN', N'Code5YM79UQCM', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (447, N'Serial5LQLTPL2F', N'Code5DPM8UDID', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (448, N'Serial5AJW4PSFJ', N'Code5ERCVPZVD', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (449, N'Serial5OXI8SJOZ', N'Code5VJR4WD2H', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (450, N'Serial5HYVFOIYZ', N'Code5YGMHVZIF', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (451, N'Serial5EBGT9G2E', N'Code527H20T47', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (452, N'Serial5G22JU89W', N'Code562ZZ9HXO', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (453, N'Serial5D9RDAGT1', N'Code5SWJB4ZOA', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (454, N'Serial5BV648TGA', N'Code5JT17PAL3', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (455, N'Serial5399N1PJ1', N'Code5I012NNF0', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (456, N'Serial5NLJD0VWK', N'Code5FJ4Y4XWV', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (457, N'Serial5C1WD4CFM', N'Code5C0MV6SKG', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (458, N'Serial53CALB02V', N'Code5P6NFH74Y', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (459, N'Serial5V1GMD6DK', N'Code5VXL8JZCP', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (460, N'Serial5V384EX8H', N'Code5BWAAWMVJ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (461, N'Serial58ORHV9MZ', N'Code5WFILV1IK', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (462, N'Serial5N405EEA8', N'Code5IP6OUNF0', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (463, N'Serial5DWSG5U8Q', N'Code59PWDCU9N', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (464, N'Serial5FR5Q5NQT', N'Code5WACJ6MT2', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (465, N'Serial57FJU1PB5', N'Code5YUL6EPO0', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (466, N'Serial5R5HCFV6Q', N'Code5P78G1KW8', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (467, N'Serial5R02PQI48', N'Code5R83G1YM9', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (468, N'Serial5COCVWS55', N'Code5M8D9VW4M', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (469, N'Serial53Z7IY94V', N'Code5XZ80FX5M', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (470, N'Serial53O5M5PWW', N'Code5WL5OCCF8', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (471, N'Serial53WV9B5MO', N'Code5F8I092QX', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (472, N'Serial5KCM40LUX', N'Code5KZRTEGBP', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (473, N'Serial56FM9FHRB', N'Code5KU1D5DPC', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (474, N'Serial5LYJD3IRH', N'Code5QU4RDSEF', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (475, N'Serial53TOG2CGW', N'Code5IZR8Q802', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (476, N'Serial5DWOZ5CXC', N'Code51TPNXYQD', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (477, N'Serial57522A6L1', N'Code5LY8N7EF9', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (478, N'Serial5WWVWAJOL', N'Code51ILGWEEV', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (479, N'Serial5MZJISZZD', N'Code5XI95K6EO', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (480, N'Serial5CD3FTI5Q', N'Code58PJTACJT', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (481, N'Serial5S5CBG2NC', N'Code5OG2QTLDJ', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (482, N'Serial51EVG4WWV', N'Code5PLLKGQJ5', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (483, N'Serial56LBS3VIF', N'Code5NDB5DI2M', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (484, N'Serial58LPSMFXB', N'Code5B9RPPRLY', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (485, N'Serial5QJGL16O4', N'Code5YQ96QZT3', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (486, N'Serial5Z73RRVSA', N'Code5G972ZUZS', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (487, N'Serial5W5HPUGAQ', N'Code5YYVK53C9', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (488, N'Serial5SV36EUFH', N'Code5PZT95XM7', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (489, N'Serial5LFZH1RX3', N'Code5J0RHVONG', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (490, N'Serial55LAO145R', N'Code56OMUQU0N', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (491, N'Serial52AJ3Q5JO', N'Code5FJUV8L2E', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (492, N'Serial5P52AMQSR', N'Code5QKVBUODX', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (493, N'Serial5HY4UQRZT', N'Code5L1V4FU1E', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (494, N'Serial58AAPQ237', N'Code5KOIV5X6X', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (495, N'Serial50EA147WB', N'Code5UYGKTG06', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (496, N'Serial5KETY1Q17', N'Code577JT5TTH', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (497, N'Serial59ZLLSSH0', N'Code55LJAWOOE', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (498, N'Serial5D4AWP1E1', N'Code51Y8A21H3', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (499, N'Serial5YL7ZJY4G', N'Code5BSPBD0OD', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (500, N'Serial5UTD26GVW', N'Code56KTO7FSY', 5, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (501, N'Serial64QQB952U', N'Code6GDVM0S8D', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (502, N'Serial6UPFSKY8E', N'Code6HUQDKNCG', 6, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (503, N'Serial6ZRC4HUO3', N'Code62TRZ9LV3', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (504, N'Serial6RR89IFHQ', N'Code6YYBDD7BY', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (505, N'Serial6PQDJO7NN', N'Code63Y3SHI8W', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (506, N'Serial6Q5AKFNL7', N'Code6GNC9CJ5U', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (507, N'Serial6MGIWW2YL', N'Code6K2N16AZN', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (508, N'Serial6BFMLFUQ8', N'Code6R04DY5OL', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (509, N'Serial634SOFKNS', N'Code6CTTQL24Z', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (510, N'Serial6OBY5Q8UK', N'Code6AT8X9TJG', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (511, N'Serial6XJPWKUXR', N'Code6W7KCODID', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (512, N'Serial60LC6QUW3', N'Code6J3TFRPIN', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (513, N'Serial65HEDKS5M', N'Code6KOMLT7AQ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (514, N'Serial622WFYMVM', N'Code6TKE16VYZ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (515, N'Serial66GG99LNS', N'Code6GD45MITX', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (516, N'Serial64VUH6JFH', N'Code6Z5NXCX5B', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (517, N'Serial6LX1FG8XJ', N'Code6H9UY0XH1', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (518, N'Serial67AJFXWOT', N'Code6GK6GSB6A', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (519, N'Serial60DN0KY8K', N'Code6F5NHZ0M4', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (520, N'Serial6V15WCFKR', N'Code6H697DDV5', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (521, N'Serial695GZB12E', N'Code6E7IIFFB4', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (522, N'Serial6R98D7BP5', N'Code6360UQB33', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (523, N'Serial6VOZJDMIF', N'Code6LNTSRVUW', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (524, N'Serial6FALH3LDH', N'Code6ZO9WCIEI', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (525, N'Serial6NBZIMU4J', N'Code6AUIPBSOM', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (526, N'Serial6POJ4DHTD', N'Code63F80HOUA', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (527, N'Serial6JE7CILJ9', N'Code639C2UP0G', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (528, N'Serial60S7HSSWD', N'Code6L8I3WPEA', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (529, N'Serial6RO90KJ4N', N'Code62AF7FS2O', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (530, N'Serial62QRQ09GK', N'Code6ZIPQPN5H', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (531, N'Serial6346SBV4T', N'Code6CG3ENE2V', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (532, N'Serial658Q30361', N'Code6EUHNLO9S', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (533, N'Serial68GTVDY2O', N'Code6MLZAFUYI', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (534, N'Serial62N0ST0YU', N'Code66DLMUE43', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (535, N'Serial62EOQWDVJ', N'Code6L09TTBHF', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (536, N'Serial6A4X0KO3K', N'Code6Z2982IYV', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (537, N'Serial6ZB2RMVNY', N'Code6S60P55PN', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (538, N'Serial6F4LYH4B1', N'Code699ARIDDF', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (539, N'Serial69531R28Z', N'Code6MBVSX15L', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (540, N'Serial6SGMPSOHE', N'Code68HSC9865', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (541, N'Serial6GGR3GLGQ', N'Code6NIWESXZD', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (542, N'Serial6BQZ4JF0O', N'Code6XWUU0EPN', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (543, N'Serial6GLAG96IT', N'Code6GET0ML0C', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (544, N'Serial6S41LHQK5', N'Code6BP9IZ8SZ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (545, N'Serial6PXHXRZNL', N'Code6JI32XOV7', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (546, N'Serial6PL3IGRHX', N'Code67O9SVKBZ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (547, N'Serial6D8E3JMAX', N'Code69T78ZDSL', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (548, N'Serial66NLLHVC7', N'Code6XQQWY414', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (549, N'Serial680J8GEPE', N'Code636BRRMEB', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (550, N'Serial6NFFQXA2Z', N'Code6I4XLAFY1', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (551, N'Serial6UGL2P85A', N'Code6GF56M3C2', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (552, N'Serial64C8CQ2BT', N'Code6XOXD5FNS', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (553, N'Serial66EJ8S5OT', N'Code66Z9IOBG0', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (554, N'Serial6SZI5EBN7', N'Code6GJF8IWCY', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (555, N'Serial6BYORZS6Q', N'Code6W4BK3O27', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (556, N'Serial6Q6ZNTJ7Y', N'Code6BXUVXY61', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (557, N'Serial6N6EAHXVA', N'Code6EC7I92FT', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (558, N'Serial603AQQDMH', N'Code6QE5C0VV5', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (559, N'Serial653JL4163', N'Code6CUA4RGTA', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (560, N'Serial6UMFY0ELR', N'Code69ZOZ1HM2', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (561, N'Serial63AUYSHT9', N'Code64SL7PRLV', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (562, N'Serial6IOZ84PD7', N'Code6EMHJR12K', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (563, N'Serial6Q8ZL0DMQ', N'Code68J6K7GR2', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (564, N'Serial68XYFXCR0', N'Code6B0574ZVV', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (565, N'Serial6SP9A28EP', N'Code60HC3YT8J', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (566, N'Serial65N7ZOWMN', N'Code61W41U7X5', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (567, N'Serial6QPN9HD3Y', N'Code6DL1AEIAN', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (568, N'Serial68EO2WNLG', N'Code6DUJD91IB', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (569, N'Serial6V7MFG9K0', N'Code6PR91IH7T', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (570, N'Serial6U0IZYH89', N'Code6JZKAHG8E', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (571, N'Serial6DPK9M7F5', N'Code6D4YHS49L', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (572, N'Serial65PWR2061', N'Code6LHNIYAF9', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (573, N'Serial6RMP2ZVGC', N'Code6NRIPXRVX', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (574, N'Serial6YX5LQZSV', N'Code6JAP2FRLW', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (575, N'Serial67J6X7BHU', N'Code6NWUR4ZPA', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (576, N'Serial6NXOO6W5M', N'Code6PNN8FVPW', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (577, N'Serial6ETS8ZAFB', N'Code6BK9Z18V6', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (578, N'Serial6BUPTL3U5', N'Code6N48IL83P', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (579, N'Serial6VBLG984I', N'Code6Z276OG5H', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (580, N'Serial6IB4J8A31', N'Code6ONAS5F3H', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (581, N'Serial6OUD8ZTKW', N'Code6F3X7UERF', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (582, N'Serial65P9TU34P', N'Code6APGPVX26', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (583, N'Serial66QWBYPM6', N'Code65HTVTNG8', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (584, N'Serial6SFJJT3YF', N'Code6CVK1C69C', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (585, N'Serial6W82BLCUQ', N'Code6VWQ19S36', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (586, N'Serial69VUEC2BP', N'Code6YTD5XH9M', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (587, N'Serial6M1G9Q4A1', N'Code6YPEB9I8B', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (588, N'Serial6VJODA2MI', N'Code6V0TLAMHJ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (589, N'Serial6NKMEM6TJ', N'Code6P44AQQR9', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (590, N'Serial6F5SCYMLH', N'Code6LX4Y9SFQ', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (591, N'Serial6SJ0TR99B', N'Code6KTTLRUDH', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (592, N'Serial66MJPNUMH', N'Code6XBTT9NCF', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (593, N'Serial6GF0BP218', N'Code6H937E8PL', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (594, N'Serial6CRTTFMNG', N'Code644BDNOC6', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (595, N'Serial6Z3U24UAS', N'Code6ZSSVLWEH', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (596, N'Serial6D2NG05XL', N'Code6U7MPY49U', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (597, N'Serial64HQP4BQP', N'Code6VMCT3JX1', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (598, N'Serial6ULINKLIT', N'Code6ZPEG2112', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (599, N'Serial6RUNBPUWP', N'Code6IC6IPCW4', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (600, N'Serial652VJ8YWG', N'Code61OZVYZ1E', 6, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (601, N'Serial7JSA26788', N'Code7OQIH6950', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (602, N'Serial7PBNPG4HC', N'Code7U0XSBQAH', 7, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (603, N'Serial79ONOK8TA', N'Code7I9MMH743', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (604, N'Serial75WFL8DGI', N'Code7AHMT8F0C', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (605, N'Serial7AH91GQ5H', N'Code7NHZYE1PM', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (606, N'Serial79GEGICO1', N'Code7R3TWE8RD', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (607, N'Serial74LZD9V3T', N'Code7E2L28AVK', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (608, N'Serial7AISCRYRC', N'Code7HCPHXXB8', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (609, N'Serial7SKLE4CE8', N'Code7DV1BFFTT', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (610, N'Serial70S8XCOXK', N'Code7DP65VTC4', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (611, N'Serial7UJ8TQQLV', N'Code74DQBLSGT', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (612, N'Serial7T51ILPUX', N'Code7HWUM8FQ5', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (613, N'Serial7ZDY83QAQ', N'Code7MU71EWCW', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (614, N'Serial7UVKZCD2G', N'Code7YTLKE23D', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (615, N'Serial7P0EDS9OF', N'Code7PEXSNY5Q', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (616, N'Serial72VJJUMMH', N'Code7WQ50VIL2', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (617, N'Serial7SCZX975C', N'Code7M8WG2CK0', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (618, N'Serial755K1LKTM', N'Code7PUBUA00F', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (619, N'Serial7FSF9HFEY', N'Code79B6N88JT', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (620, N'Serial7EUI38QJ6', N'Code7XTGCC4YD', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (621, N'Serial7ZTVBE0JL', N'Code7GRK7QN3N', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (622, N'Serial7L3N66QIQ', N'Code71L38SE1O', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (623, N'Serial7X1X48B4Y', N'Code7NQ7DMYWX', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (624, N'Serial757UESPP1', N'Code7V6V8XOH5', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (625, N'Serial73IW0N6K1', N'Code7SFYECG5R', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (626, N'Serial7NSQHAILX', N'Code7GYIRXSZ7', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (627, N'Serial71SDB0LKV', N'Code7S7TUK5UA', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (628, N'Serial7N2VHIVMU', N'Code7XGPUNLY9', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (629, N'Serial7JOXVXQC4', N'Code7HUR2I12H', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (630, N'Serial75FI26BIX', N'Code7J24MNAOB', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (631, N'Serial7UKFN72MH', N'Code7VB7BU59M', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (632, N'Serial70PI3IB63', N'Code728H42722', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (633, N'Serial71ILMHXJ3', N'Code7I3DE2FBB', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (634, N'Serial7YPDTNBSJ', N'Code7E15F7X9O', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (635, N'Serial7074J621M', N'Code7GFOYDHOM', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (636, N'Serial7EH8JY5F2', N'Code7U4MV6UCI', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (637, N'Serial776089A81', N'Code763AE08IS', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (638, N'Serial7V7GVY0WW', N'Code74G5YDN2W', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (639, N'Serial7JCPQNB9V', N'Code7XWMZG5AP', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (640, N'Serial7N9C5R7MD', N'Code7JB0VW908', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (641, N'Serial7QZP33NP5', N'Code7XH8AE7D8', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (642, N'Serial7FDQVRR83', N'Code7W1T1TUU5', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (643, N'Serial7JZHTT32C', N'Code7N2D52K00', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (644, N'Serial7SQMWJGD3', N'Code725N6NGJP', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (645, N'Serial74HFYDNLL', N'Code7RHRHCB7K', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (646, N'Serial72N5O5Z9Y', N'Code7MDMJ73XU', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (647, N'Serial7OZNN35NP', N'Code70N738RW2', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (648, N'Serial74XRTGDZH', N'Code7L8M3E6TR', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (649, N'Serial7ZOYZL504', N'Code706P4SPDS', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (650, N'Serial7NCRLXGAM', N'Code71NSQ663O', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (651, N'Serial7EKBRDA2G', N'Code7XIUN3N5D', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (652, N'Serial7BYE7URHJ', N'Code76C8X4344', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (653, N'Serial7W54NQVUN', N'Code714IZHPGS', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (654, N'Serial7JW0194U3', N'Code7WONMI8FF', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (655, N'Serial7N5IUYW68', N'Code76UQH4VOY', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (656, N'Serial7JQ5JG2YB', N'Code7VX6XMXWW', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (657, N'Serial706ACJK3G', N'Code7DASG3HZ6', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (658, N'Serial791M981KB', N'Code7MNNRZX11', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (659, N'Serial7W4MEJ1K5', N'Code73KWMJZDL', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (660, N'Serial7Z143JKCM', N'Code7OA7AA6PH', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (661, N'Serial75Y7MR4N5', N'Code7XBOQOOE5', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (662, N'Serial773NXL2V9', N'Code7L98SHK4D', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (663, N'Serial7NBVP0MJV', N'Code7E5ZNRSO7', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (664, N'Serial78WS4L078', N'Code7KJWL8PSJ', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (665, N'Serial7MH2Y1KGB', N'Code7A40OHVJT', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (666, N'Serial75NDJC7A5', N'Code7E7CTJECV', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (667, N'Serial7Q500RLCW', N'Code77OYKROV8', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (668, N'Serial7AH5KCZXO', N'Code7DPXV5DKY', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (669, N'Serial7XTUFXFR3', N'Code7LHQJ7JDM', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (670, N'Serial774TIM04Y', N'Code75EHS5PBC', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (671, N'Serial7BP9PBSSQ', N'Code71I0KMCCY', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (672, N'Serial7JYV7TABH', N'Code7PO6TD2NQ', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (673, N'Serial7AYHU52DD', N'Code7JFAZ9B04', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (674, N'Serial7I2MCZVF9', N'Code7ROI9NKZM', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (675, N'Serial75X31PO0N', N'Code7H97JRD3Z', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (676, N'Serial7C9EEVIP5', N'Code73NERLP8I', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (677, N'Serial7YK8CB7HX', N'Code7VRI1PKZO', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (678, N'Serial7LHPZH1W1', N'Code7SOAVCKUK', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (679, N'Serial7UZ8YHJH6', N'Code7TA2NEH4R', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (680, N'Serial7QPZFNAWY', N'Code7N1RFISXI', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (681, N'Serial71P05Q3O8', N'Code7THN86VF9', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (682, N'Serial78UNG3E62', N'Code7GR6THFCP', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (683, N'Serial77CSMS6OF', N'Code7SD6HWO25', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (684, N'Serial7XTPU1FTP', N'Code7WSDIAW3I', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (685, N'Serial7M99M0EVK', N'Code7TUK8EKZE', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (686, N'Serial7JPASZG5Y', N'Code78V53ADO4', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (687, N'Serial7XBC4FHJB', N'Code7S92N0DE2', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (688, N'Serial7FYQ0YCD6', N'Code7ONED722B', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (689, N'Serial7A8IXW4GX', N'Code7ZMQE6OGD', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (690, N'Serial7Z6PF6QNW', N'Code7PALL3COH', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (691, N'Serial717U8WIJZ', N'Code7ICIOB52V', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (692, N'Serial794PTCVYR', N'Code785C5TSXA', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (693, N'Serial72ZSO7HCP', N'Code77HDODOP7', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (694, N'Serial7JM7ZDOT8', N'Code7E8AY87EX', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (695, N'Serial7C6A36OKO', N'Code7DDP1YBL4', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (696, N'Serial7PTCLED3O', N'Code7737OAKXS', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (697, N'Serial7KAJHO51Y', N'Code7KSN4L7TA', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (698, N'Serial7IGTIPBCV', N'Code7VV8198IF', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (699, N'Serial7TQBKFQI6', N'Code7J51ITZSF', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (700, N'Serial73TJ82XTQ', N'Code79UB6MGBJ', 7, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (701, N'Serial8W25FCNQW', N'Code85GE5TUT0', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (702, N'Serial8TTCBWVZC', N'Code8DANRWRAB', 8, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (703, N'Serial8UAJ61A4G', N'Code8IWLK7KH9', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (704, N'Serial804DH6TSB', N'Code8N05IWYN1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (705, N'Serial8PPDTEFCU', N'Code82Q8IG3HA', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (706, N'Serial8TJRRII3P', N'Code8BEJTZU5X', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (707, N'Serial8YKSLKLNR', N'Code8LKM6T4D8', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (708, N'Serial8JYVQWR0E', N'Code81AHTMJKT', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (709, N'Serial80FH07LOZ', N'Code84SYR9FQ3', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (710, N'Serial81NRI7IRC', N'Code8MSRK2COQ', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (711, N'Serial85USKE8I8', N'Code8ZFCEQY33', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (712, N'Serial862SW1EBM', N'Code83P9CUNUW', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (713, N'Serial88FWUT6K6', N'Code8FV602FHM', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (714, N'Serial80HQC98G7', N'Code8U851TLR0', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (715, N'Serial8KV79K2Y3', N'Code8OO6LEI2Z', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (716, N'Serial8N75U7KZV', N'Code853UT19FP', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (717, N'Serial8DCGKI2P8', N'Code88ZE8JPWI', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (718, N'Serial85F65DA4K', N'Code82KIBDJEU', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (719, N'Serial8EJABK9I9', N'Code8WWNOWYNM', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (720, N'Serial8JKE77P99', N'Code80A9WLE6G', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (721, N'Serial8ABJ7H1YD', N'Code8TOHIXNHD', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (722, N'Serial8YC9MYDVU', N'Code8THEUAS1P', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (723, N'Serial8OMF54O1K', N'Code8HJRZSFPW', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (724, N'Serial8AD3H21TY', N'Code8AYRMOTXA', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (725, N'Serial871I50X9B', N'Code8ZMAL48HR', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (726, N'Serial8JNR85F74', N'Code80RQ9NZMQ', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (727, N'Serial8ZXRRW4CC', N'Code8XHC03Q4Q', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (728, N'Serial8ZL0PB5FB', N'Code8J3ZZMRTS', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (729, N'Serial8UJFKVF3R', N'Code86G6XP7WU', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (730, N'Serial8ML4HEY71', N'Code8K8B5DKCD', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (731, N'Serial8FKB0LJQY', N'Code8HEWF4Q4W', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (732, N'Serial8YCYLHFZD', N'Code8VT7D63Z7', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (733, N'Serial8MHD6BU80', N'Code8PNUARK67', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (734, N'Serial8YR5QZ9SK', N'Code8CPASHQX2', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (735, N'Serial8INW96YZB', N'Code8ZM90VDR7', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (736, N'Serial8GTOQ9EMR', N'Code81DDRRLN0', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (737, N'Serial86CAPJ0D7', N'Code81L499VST', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (738, N'Serial8G5QD9CD6', N'Code8ZGDA9YRM', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (739, N'Serial8UFEVDXKX', N'Code8WOX002J4', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (740, N'Serial8ZZNHFIJZ', N'Code8AM50V4PV', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (741, N'Serial858WW2BU1', N'Code82PRIEGLC', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (742, N'Serial855FYBJ75', N'Code8SFJH33LU', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (743, N'Serial85K5TW8MJ', N'Code83E4RMEI4', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (744, N'Serial8O58SWPCC', N'Code8G2O89MVO', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (745, N'Serial8SZ74F5XD', N'Code88XP31UM1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (746, N'Serial8O0FBI9SH', N'Code8TJTT4TOY', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (747, N'Serial8KA5YQHWC', N'Code84FF1L751', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (748, N'Serial8ICANE812', N'Code85IL4NMPE', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (749, N'Serial8AVU6VN59', N'Code8BH8052P1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (750, N'Serial8JOUH45FV', N'Code8EY8EBY0A', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (751, N'Serial8CKK1DG0O', N'Code8SDUOHI7Q', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (752, N'Serial8UG7H4JZ8', N'Code8HI7CJK82', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (753, N'Serial8S9C24LNL', N'Code85RN4R552', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (754, N'Serial8ZHOMEFJE', N'Code82S5D9UFI', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (755, N'Serial8H0OMOZGH', N'Code8HKSMVI2T', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (756, N'Serial8599D6AMH', N'Code8H37P66O2', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (757, N'Serial8D2O6TYDX', N'Code8QH5IYV85', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (758, N'Serial8IOIL5JKH', N'Code8T9WPMWY6', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (759, N'Serial8RON1VQO0', N'Code8G4PDW6PZ', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (760, N'Serial8LZVBFEC2', N'Code899QQL1TR', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (761, N'Serial8H2SQ8GAI', N'Code8TYUBQ45I', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (762, N'Serial86LPYBO5J', N'Code8672I68TY', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (763, N'Serial83OCOJFWF', N'Code8HCZRXA1R', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (764, N'Serial8F44YJC9M', N'Code8HT326LLE', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (765, N'Serial8EM2ZONUX', N'Code8KTKZDO2S', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (766, N'Serial80F2VWZ46', N'Code81VW8BBPZ', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (767, N'Serial84ADYI7L1', N'Code8B4Q82ICB', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (768, N'Serial8UBM7XXTM', N'Code8CPDG5ESH', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (769, N'Serial8BYR4683B', N'Code8CZ28SSUF', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (770, N'Serial8HZZBNCBY', N'Code8FQXMQLFM', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (771, N'Serial8AFO5L2YA', N'Code8LSTV63OC', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (772, N'Serial8HNOTBXJG', N'Code836FK33OC', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (773, N'Serial8OLBC2IN5', N'Code86B48GWI7', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (774, N'Serial85SJCKK99', N'Code8H5371FQU', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (775, N'Serial8E3G246FY', N'Code86E45E0PP', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (776, N'Serial8O3TY74AR', N'Code8JX7F96X1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (777, N'Serial8MASJYJUM', N'Code88UQFULYR', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (778, N'Serial81D7NQJ63', N'Code8GSCRT8BE', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (779, N'Serial8WM58O463', N'Code8FPJH2ATG', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (780, N'Serial8NS36FEIQ', N'Code8UZOS1OZY', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (781, N'Serial8Y98PJ0D5', N'Code8ZSIG5WQ0', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (782, N'Serial83PJ6Y3OD', N'Code8664U9C52', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (783, N'Serial8FZ99DX67', N'Code89JI3TWKF', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (784, N'Serial86JECMPSV', N'Code8VN5TI65W', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (785, N'Serial8D2CYYSWJ', N'Code8Q72J4BDL', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (786, N'Serial826PK1DC5', N'Code8B1RM0CXT', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (787, N'Serial8Q5OBEE61', N'Code8HDSPN38A', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (788, N'Serial8DU3WQAYW', N'Code8FGZTKGSR', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (789, N'Serial8KOQMTTRB', N'Code8S93H9IN4', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (790, N'Serial8TBYOQ16R', N'Code8Q1SKNELM', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (791, N'Serial856BCC094', N'Code82ZN1QYS1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (792, N'Serial837Z95AM4', N'Code89CCNTLQP', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (793, N'Serial8USR26EQ7', N'Code8ZLQTRC8N', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (794, N'Serial8S14FFEEC', N'Code8KAPMVIDR', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (795, N'Serial8WB13PT5X', N'Code86GKJUGL0', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (796, N'Serial8LDYT6GA2', N'Code8GI2INVX1', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (797, N'Serial8F4CTQG9S', N'Code8EVTXRA4K', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (798, N'Serial8I32KD47G', N'Code8YUHQ3H22', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (799, N'Serial8RXN5O1W2', N'Code8G3236NBW', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (800, N'Serial8VFVJSW5J', N'Code8HNDH2UDX', 8, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (801, N'Serial9FACY8TX2', N'Code9KK575GF2', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (802, N'Serial9OL134B88', N'Code9QL0JFFQT', 9, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (803, N'Serial9CFUW19N1', N'Code9C1YS662K', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (804, N'Serial91X056T1V', N'Code9QH8VMC0Y', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (805, N'Serial9YN9KNIS0', N'Code959BWZUV8', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (806, N'Serial9A6DFK2AL', N'Code9APN39Q3X', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (807, N'Serial9BB81D4MU', N'Code9RORV43T6', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (808, N'Serial9O05IIYU4', N'Code9E1SSS5HR', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (809, N'Serial9QUZRS4VT', N'Code9J6HDONVL', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (810, N'Serial9K8UD4S74', N'Code9RI2VPRAE', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (811, N'Serial9546RLG66', N'Code9HQSUVIPU', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (812, N'Serial9OQKHYNGL', N'Code92DNNUXGB', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (813, N'Serial95J8OXII4', N'Code9MG01XZMK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (814, N'Serial9URVNK3UE', N'Code9F9P28JEE', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (815, N'Serial9IZJ1G5O4', N'Code9WQ4H4RI0', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (816, N'Serial9KMMHXP1F', N'Code9TK7K542E', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (817, N'Serial9RE126ZOS', N'Code9DBFXWKUE', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (818, N'Serial96F8PCKZ6', N'Code9I0BIWDSP', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (819, N'Serial9H7QCDIXI', N'Code99RWH91F8', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (820, N'Serial9PDAQOVH0', N'Code9C7QUBGXU', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (821, N'Serial9GAQUV3UZ', N'Code9CEB5T5W6', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (822, N'Serial9EVJN6TNB', N'Code933T7GA5W', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (823, N'Serial9BUA5MXSX', N'Code92S70B9EC', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (824, N'Serial995LUF4PQ', N'Code9EDS495Z0', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (825, N'Serial9F4Y9BBUQ', N'Code9W1LKUSNL', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (826, N'Serial9ZSERP2QE', N'Code9QG18SIX9', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (827, N'Serial9NVFLE3L9', N'Code9OI5AIP1E', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (828, N'Serial9THRH831J', N'Code9W59LX7SF', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (829, N'Serial9FMNYGC2J', N'Code972A69XIL', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (830, N'Serial9R418Q5I5', N'Code9EOF04GBO', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (831, N'Serial9V3K9Z6N2', N'Code93IQJTTOA', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (832, N'Serial94NA2T0O0', N'Code9E38NYCDT', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (833, N'Serial9A14Z1R4T', N'Code9TEGJSZ8D', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (834, N'Serial98HBEI3VP', N'Code9VHQVLG6E', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (835, N'Serial9MPTGM7UM', N'Code9R1OWGB2O', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (836, N'Serial9F654LWRP', N'Code9YKBK4GW1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (837, N'Serial9WAQ8038N', N'Code9LT4IX1PC', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (838, N'Serial9054UY3GR', N'Code9D9JU6TMC', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (839, N'Serial94J0D20EX', N'Code9FGWCX1Z1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (840, N'Serial972AYRSVL', N'Code9FEJDL89X', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (841, N'Serial9TMCKTWS9', N'Code9CDZFZYFE', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (842, N'Serial9U2DD76VC', N'Code9EVGGHU6Z', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (843, N'Serial9ONZ3BM53', N'Code98I1JCULV', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (844, N'Serial9MR02HNCN', N'Code9PBNP0FEK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (845, N'Serial9BRSVYJ7Y', N'Code9EWOCEXDU', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (846, N'Serial9NDPHJ4I3', N'Code9GSAD7US2', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (847, N'Serial9G8AKXFSI', N'Code9PN85N1J1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (848, N'Serial9TDTNDD7D', N'Code95NY839GR', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (849, N'Serial96LQZQ0MN', N'Code92GKHTSN1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (850, N'Serial9DSIU10KW', N'Code9KCE7MRH1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (851, N'Serial94C2D45EJ', N'Code98Z2SL1JU', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (852, N'Serial953PZBKM7', N'Code91DK3985I', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (853, N'Serial94OF82RBJ', N'Code9OLUCDW6Y', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (854, N'Serial9U9C2LKR3', N'Code9ZMJQ6BJD', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (855, N'Serial915V7IKTJ', N'Code9NCNPKGG7', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (856, N'Serial9M0NHCQZ8', N'Code9NU9WZ9P4', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (857, N'Serial9OVKQ6DYB', N'Code9K1V0SZVQ', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (858, N'Serial9AR8LBTFY', N'Code9UC70IA5G', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (859, N'Serial95LJY8E11', N'Code91Z5BD1EM', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (860, N'Serial9CCTQKFG8', N'Code93C8QM7FK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (861, N'Serial9N561K31Y', N'Code9869ZS7F0', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (862, N'Serial9QJDE4RO7', N'Code9IWL8R1XK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (863, N'Serial93N2EM33S', N'Code968Y2FWSG', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (864, N'Serial9LCYQ6POZ', N'Code996U2ZLVE', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (865, N'Serial9Y1BZ62Y8', N'Code9BOI4FLGT', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (866, N'Serial9PMFO6IYG', N'Code9554XWVKK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (867, N'Serial9TE5UBOOA', N'Code9IMEY92Z4', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (868, N'Serial9QRWNYD9K', N'Code9IT8GZPZ8', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (869, N'Serial98GBIW1EF', N'Code9UU8HWM37', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (870, N'Serial9WBXYWTON', N'Code9FJA2W8UP', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (871, N'Serial9QY8GKZG5', N'Code9ORQWI9KZ', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (872, N'Serial9BM2N2NST', N'Code9L1LQG7DW', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (873, N'Serial99B4DSU3G', N'Code9XZXK6C7L', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (874, N'Serial9UZ42RP4H', N'Code964PS7DYS', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (875, N'Serial92ONSTR0Y', N'Code94CRDAE4Y', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (876, N'Serial973VIYSKG', N'Code9RQPP0NZV', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (877, N'Serial9UGCKF9IT', N'Code9P8XNL0MB', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (878, N'Serial99A687020', N'Code92HGFZVAW', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (879, N'Serial90EZ9D87R', N'Code9Q9X575PG', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (880, N'Serial9NKTRZYWA', N'Code9BSZ46DP7', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (881, N'Serial9D4EZRDKZ', N'Code94GZBEKDG', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (882, N'Serial90DKLZFR2', N'Code90G0QOEXD', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (883, N'Serial9ESUCPLBI', N'Code9OIHLRE24', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (884, N'Serial9V5JIOZ4I', N'Code9QVE9Y0P1', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (885, N'Serial90VI8CYHA', N'Code982OYJOYG', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (886, N'Serial9U6L5PHEO', N'Code9S38LH3SH', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (887, N'Serial9KYE5LGHZ', N'Code9GRP84D58', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (888, N'Serial9OL3TOV47', N'Code954SVLNIV', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (889, N'Serial9S0DJ4RXP', N'Code9LUI4PTHC', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (890, N'Serial90JOH7MQ2', N'Code9705NK3V8', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (891, N'Serial9C0GJRCDW', N'Code93847KQUD', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (892, N'Serial9PIEY4WD7', N'Code9FDR3O1UK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (893, N'Serial9Y8Q4RHFX', N'Code9DKGPGKA5', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (894, N'Serial9HAX1GDID', N'Code9126X4D2P', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (895, N'Serial98G2RQC5D', N'Code97HT6LNVZ', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (896, N'Serial9RJV3NM6W', N'Code90DG520DK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (897, N'Serial9P8KDI1NV', N'Code99B6KSZ91', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (898, N'Serial9YRPYX97R', N'Code9FP4NZM7O', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (899, N'Serial9FN8ND2HT', N'Code93QWLFNAK', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (900, N'Serial98O72VXAH', N'Code9FU9COYSY', 9, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (901, N'Serial10CSIV3CIQ', N'Code10PX41DU1B', 10, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (902, N'Serial10C2LWY0W4', N'Code10AG222HUN', 10, 1)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (903, N'Serial105GEADNX7', N'Code10HS2V8SLJ', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (904, N'Serial104UFU4VHZ', N'Code103GLJ5Z5V', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (905, N'Serial10KHBDOW6E', N'Code10FDM9VAD3', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (906, N'Serial10RHF8WLPA', N'Code102YLSADQT', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (907, N'Serial10Z7BQJ1AF', N'Code10VQLZI0Y9', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (908, N'Serial10HNLFZBZG', N'Code1090PQQ958', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (909, N'Serial10QW8WHHAO', N'Code10UMVJ7N8Y', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (910, N'Serial10LVWH16M7', N'Code10A9AFNTN5', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (911, N'Serial10QVYU9TCM', N'Code10H4GIXOKQ', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (912, N'Serial109PEFQHJM', N'Code10SGOEXKI1', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (913, N'Serial10XLLEE0IP', N'Code10H18TBEM9', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (914, N'Serial10OOA092WM', N'Code105RDNZ7AJ', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (915, N'Serial10ROA1L9E6', N'Code10WX0IIR2U', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (916, N'Serial10LUNFZ3FV', N'Code109TP4T8F8', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (917, N'Serial104HZS2XSC', N'Code101UH2EDVF', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (918, N'Serial10P5LHE8R1', N'Code10P48GW0HI', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (919, N'Serial101BU414MJ', N'Code10L4PG4SQ9', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (920, N'Serial10NRAK2NA1', N'Code10YV78LYCD', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (921, N'Serial10IWBASTR6', N'Code1090718OYZ', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (922, N'Serial10MO0ONNIU', N'Code10E7952W2O', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (923, N'Serial10C40MZSQI', N'Code10PBGM1B69', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (924, N'Serial107MP2M894', N'Code10K7LQ2U72', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (925, N'Serial10KGKH1XLP', N'Code10NL2Z1XUE', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (926, N'Serial104HQYCR73', N'Code100H6HYQHH', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (927, N'Serial10MFQOYFUO', N'Code1079G2BNTD', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (928, N'Serial10T9SFMVAI', N'Code1019KUPZIP', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (929, N'Serial10YVW650P3', N'Code10MVUVQW92', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (930, N'Serial10JFO4TFVJ', N'Code103Z1QWN0K', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (931, N'Serial10ZJHXHQ9E', N'Code10ZVSQ0UHM', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (932, N'Serial108YJ48BCX', N'Code10K7GER05Z', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (933, N'Serial10G3A4T8C2', N'Code10B5DAW8GT', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (934, N'Serial10R7IIPGFI', N'Code103BPRR02C', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (935, N'Serial10ESQ24GI8', N'Code101NCI7Q41', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (936, N'Serial10RH2H8O6X', N'Code106UD7OO3Q', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (937, N'Serial10U9LWYBIG', N'Code10IVSDZH3B', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (938, N'Serial10K7N77ALL', N'Code10PR5HVL5B', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (939, N'Serial103HEN5C4O', N'Code10YBVAU7VC', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (940, N'Serial101AFVCE46', N'Code10LXO2WHR7', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (941, N'Serial105L1K71OI', N'Code10GZWHJEFB', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (942, N'Serial10KGR5GTC6', N'Code10DO9HZX4K', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (943, N'Serial108MDDN8DY', N'Code10XIQJ8266', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (944, N'Serial10N5ZBBK8N', N'Code10U0M1IS53', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (945, N'Serial10TQDSZH2W', N'Code10WQMISFFD', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (946, N'Serial10MZZTEQU1', N'Code10BZLINMXK', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (947, N'Serial10M4O8UGX7', N'Code1098QA1ZFX', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (948, N'Serial10Z9CQZEPH', N'Code10QGRVNHGR', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (949, N'Serial10XGKMEUUR', N'Code100XHA7GES', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (950, N'Serial10NCC1Y3G8', N'Code1018BU32IH', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (951, N'Serial10ZCWCBNCN', N'Code10MS3JO4MT', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (952, N'Serial10IC7A3APJ', N'Code10MKPHGW6O', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (953, N'Serial10FEA2J452', N'Code10MJ7I3I6K', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (954, N'Serial10A3KIDGIQ', N'Code104ZCFR3JF', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (955, N'Serial10FFFXQ3GP', N'Code10PWKKKSQK', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (956, N'Serial10XVDDMVHM', N'Code10C6WYA1U2', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (957, N'Serial10JU0K93HM', N'Code10YN0RUVV1', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (958, N'Serial100XPF2OJI', N'Code10RR29B8MD', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (959, N'Serial10W4BYRVMK', N'Code102ETNIYRM', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (960, N'Serial104WZR4GT5', N'Code10OKNDNEZE', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (961, N'Serial10GSRPD27P', N'Code10KHOXWXMC', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (962, N'Serial10G7FQQFM5', N'Code10RZ93NSV6', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (963, N'Serial10FA6YMJ5B', N'Code10ILR2OD7O', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (964, N'Serial10BOKZ05KF', N'Code102RTH7B3P', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (965, N'Serial100OR30LO6', N'Code10Q4061YMT', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (966, N'Serial10JMS9UZS6', N'Code10WI15OGBN', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (967, N'Serial102OVNNY0X', N'Code10VXEVQF4D', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (968, N'Serial10RI0K8257', N'Code1026XOIIZK', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (969, N'Serial10OCBVR5F4', N'Code10W15T4TZM', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (970, N'Serial109M50HEL1', N'Code10F6FJE7PN', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (971, N'Serial10EQV1LS9C', N'Code100VLSCXLH', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (972, N'Serial10I5JR7R61', N'Code1090194Y47', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (973, N'Serial10IVZ4FP6A', N'Code10Y79PG5UH', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (974, N'Serial101M03A9TM', N'Code100XXS3GKG', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (975, N'Serial10A3085LMC', N'Code10KPF5BQK0', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (976, N'Serial10GVLGKGGQ', N'Code10SVNX0JDV', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (977, N'Serial109QZFF11F', N'Code10UE0YWU2J', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (978, N'Serial10UBDI0ALU', N'Code10190NSG92', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (979, N'Serial10AZZRMPRC', N'Code10NNV16QB5', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (980, N'Serial10934GMT25', N'Code109DA204DX', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (981, N'Serial1086LP2HLC', N'Code100A67U8H8', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (982, N'Serial10XMF31AYN', N'Code106QIDRJI7', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (983, N'Serial10JVIRUICM', N'Code10D9JRVN9B', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (984, N'Serial10QVR975CE', N'Code10205FU0A9', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (985, N'Serial10DGJCQM6R', N'Code10QLYCGXOI', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (986, N'Serial10R5RGXTLH', N'Code10IJ5VOJ6W', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (987, N'Serial10PWSO57U5', N'Code10N1I18BRZ', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (988, N'Serial106VOP4P0I', N'Code103A3RHE38', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (989, N'Serial10VYEUCMKW', N'Code1081PC0O4P', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (990, N'Serial109CSKIHD3', N'Code10CSNZPRVY', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (991, N'Serial10D22ZIKEE', N'Code1042IFJZ4T', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (992, N'Serial10VP5B3ZUH', N'Code10337JMDEB', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (993, N'Serial10K85KZPZ0', N'Code109PFN6Z60', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (994, N'Serial109K8Z9NRA', N'Code1001WBIEVK', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (995, N'Serial10B5OBEOD9', N'Code10HCRZJPMA', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (996, N'Serial10ON76AJCZ', N'Code10ZG0SWUEC', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (997, N'Serial109966V7ZX', N'Code10FNTKTP7H', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (998, N'Serial10Y54NMVSC', N'Code10MM1PFZQI', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (999, N'Serial1034CKSNKF', N'Code105DKJFNYN', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1000, N'Serial10836JXY2J', N'Code10XLUT37V0', 10, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1001, N'Serial11YOBT6ACU', N'Code11PQ67MCNU', 11, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1002, N'Serial11TOVH7ML1', N'Code1112GLK9CL', 11, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1003, N'Serial11CS5LYR5M', N'Code113K6WPT1F', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1004, N'Serial111UJQGPB3', N'Code110IKTMF5J', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1005, N'Serial11GH794QZ8', N'Code11BQA20QNO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1006, N'Serial1166YRWLSA', N'Code11CCUPGMZS', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1007, N'Serial11XTHGU1T3', N'Code11V40LPCP5', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1008, N'Serial11028YXDUM', N'Code11MQ8GM5JR', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1009, N'Serial11IJ4E3M6G', N'Code11UTM80SP4', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1010, N'Serial11J4D8LEML', N'Code11UUGG4AD4', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1011, N'Serial11O77XDAMR', N'Code11MDHYB49Y', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1012, N'Serial11QSE056RX', N'Code11OCY36Y3L', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1013, N'Serial11XQV1GYV3', N'Code112WU3YOPJ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1014, N'Serial113VMANCKM', N'Code11GDMLC7X5', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1015, N'Serial11INRZDM5A', N'Code119NZ6THJ2', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1016, N'Serial11W83ICRBI', N'Code119XZF5Y8N', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1017, N'Serial112ZV31BYS', N'Code11OD6UE4OO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1018, N'Serial11MDTIO3SA', N'Code11159V8IZO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1019, N'Serial11GE5AERO6', N'Code11WAPKEECA', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1020, N'Serial11DQGUX787', N'Code11DDXCRSGO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1021, N'Serial11UIIQO890', N'Code11LKU0VGSH', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1022, N'Serial11KG205Z0M', N'Code1177X9NXW1', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1023, N'Serial11RKBA2IME', N'Code1187VGIL78', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1024, N'Serial11OOS5GQLX', N'Code11HJKUO03P', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1025, N'Serial11EWDFEHW2', N'Code11SMI09FZJ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1026, N'Serial116A3B2A57', N'Code11UE2FUGHQ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1027, N'Serial11CWPOACF6', N'Code11LAO89PD1', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1028, N'Serial11UUX8PHF2', N'Code11GWPX4IE1', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1029, N'Serial11XEQVH0TJ', N'Code117JP00RJF', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1030, N'Serial11BT1E5XLR', N'Code11D8CEH537', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1031, N'Serial11IA1T7PNI', N'Code11MVZ07V6P', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1032, N'Serial11BT3V2JNZ', N'Code11B01E0B47', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1033, N'Serial11L6PYJQW4', N'Code11U2BBG2TB', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1034, N'Serial1199KWEPGF', N'Code11YXWADTTX', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1035, N'Serial11MBGJZYPE', N'Code11CYGL9SSI', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1036, N'Serial11LOA1JXLB', N'Code11Z1QJ03UK', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1037, N'Serial11XTYG59D8', N'Code11Z3MFNXBL', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1038, N'Serial113TC1GRN0', N'Code11O1EE1ID7', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1039, N'Serial11QJHYXAJ0', N'Code11IDF8VVI2', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1040, N'Serial11SE25FIPD', N'Code11HNBXD37O', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1041, N'Serial11UZEGLL8X', N'Code114AJCN7AO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1042, N'Serial11CMO5QQJX', N'Code110YFAT287', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1043, N'Serial11XN0J4ELK', N'Code11N58677SQ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1044, N'Serial11LOE7I3OW', N'Code11JD9QEMYO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1045, N'Serial1127AW1WMB', N'Code11FZE0VP7E', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1046, N'Serial11AN6TE8NH', N'Code11MMRZVG64', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1047, N'Serial112JAXLMOI', N'Code11V3J0E42D', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1048, N'Serial111XQTJS22', N'Code11UFWGC75H', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1049, N'Serial1163QLI204', N'Code11UO4BMSMD', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1050, N'Serial11A25I3CFE', N'Code11FH05V5K4', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1051, N'Serial11II0809GA', N'Code11Y5OJL347', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1052, N'Serial115KE42O23', N'Code11CFWP07TQ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1053, N'Serial117P66YIRE', N'Code11P7DBQUP5', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1054, N'Serial117IIVGL6D', N'Code11F7Y6GUVY', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1055, N'Serial11PFVFCTIV', N'Code11UU0YYW5W', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1056, N'Serial110IFLTNUO', N'Code1165ROSXOU', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1057, N'Serial11LV8IIFFT', N'Code11IANXF9Q4', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1058, N'Serial11Y03RNR3M', N'Code111K1GFWP3', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1059, N'Serial11GG8F5V83', N'Code11PMF7T7RS', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1060, N'Serial11TBCYU8NK', N'Code11RKLHW9XY', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1061, N'Serial11KH5UNFS0', N'Code11IXL9UNAC', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1062, N'Serial11RZAL3Y14', N'Code118IX28G06', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1063, N'Serial11VX3ZJB15', N'Code115OVNEYPF', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1064, N'Serial11KUQP8XSF', N'Code11AKYBTNAG', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1065, N'Serial11P02DB9G6', N'Code11JZI34UZC', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1066, N'Serial11XWEVFSF4', N'Code11S8D8PUXO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1067, N'Serial11GHG4KC2Z', N'Code11SLDZ3B5F', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1068, N'Serial11SRJ022PR', N'Code1122BIQDX2', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1069, N'Serial11RDQJ0OPD', N'Code11OFOC5HBO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1070, N'Serial119A8E1DRL', N'Code11LTMNUV9X', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1071, N'Serial11W3CYGN5K', N'Code11EAM57T15', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1072, N'Serial11ITB4RYN5', N'Code11I7S4EMBG', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1073, N'Serial110MMZ7NVC', N'Code11DO7JHUE6', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1074, N'Serial116N48L806', N'Code11HEHZ1FW8', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1075, N'Serial11K6B8SXD7', N'Code11XOR2VJK1', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1076, N'Serial11RBZEIIDE', N'Code11778XJWSS', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1077, N'Serial1110DJA6U9', N'Code11CBOXGLY5', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1078, N'Serial11EE4NXGKT', N'Code11VAHDFVUY', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1079, N'Serial113YKXFQ22', N'Code11AFUPEFQ2', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1080, N'Serial110X4QPDYW', N'Code1130ST4W9X', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1081, N'Serial111CC7FJF8', N'Code11CU0BH1JZ', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1082, N'Serial11V989U7YQ', N'Code11DXHGI1VX', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1083, N'Serial11KH69QGJD', N'Code11ARIVNZML', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1084, N'Serial116E0AS1OE', N'Code11FEW2AAT1', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1085, N'Serial1181RN8306', N'Code110ZYXDN13', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1086, N'Serial11513FVDIC', N'Code11NX5IJYUK', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1087, N'Serial114IIBUHRD', N'Code11O5EK6RKF', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1088, N'Serial11Z6LVNISH', N'Code11DMZC4SEV', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1089, N'Serial1110YCJ7BS', N'Code11AQMTVZ09', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1090, N'Serial11Q50CEO4Z', N'Code11CTC60C6C', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1091, N'Serial11JYHXNHN1', N'Code11RXXO4SFF', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1092, N'Serial115I8PD983', N'Code11546MG1IK', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1093, N'Serial112VIBV010', N'Code1106TI5EXB', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1094, N'Serial11MXBUXHA4', N'Code11WATAV1IR', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1095, N'Serial11EY3PUN3F', N'Code11TVIXUOKD', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1096, N'Serial116NUGT9MI', N'Code11H2SV5WO4', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1097, N'Serial11MGU6IAY2', N'Code11A7F6TO04', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1098, N'Serial11N2O3H0XU', N'Code1184NEVZMO', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1099, N'Serial11IBNHDA6S', N'Code11912V05DM', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1100, N'Serial11UQY47NP7', N'Code11RSH0WER3', 11, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1101, N'Serial12IIL30L7B', N'Code12JVOW7XRZ', 12, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1102, N'Serial12WOZP56TT', N'Code12DI3I406T', 12, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1103, N'Serial12H5T79UGM', N'Code12VIA6BZO0', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1104, N'Serial12M322YN9E', N'Code12TB7WPQL9', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1105, N'Serial126YGJQ2MP', N'Code1205OBSTMJ', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1106, N'Serial12OIW4LEUL', N'Code12KDWEXVRE', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1107, N'Serial12XMRMZTHK', N'Code12Y4QICGDQ', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1108, N'Serial12KTRLIA1G', N'Code12P0ZP3BAI', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1109, N'Serial12EIHSU98B', N'Code12M9LWGU3Q', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1110, N'Serial128NMNVBJD', N'Code12HVUVYWJZ', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1111, N'Serial12AUWPOYAG', N'Code129CUYWQD7', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1112, N'Serial12MES7QF70', N'Code12AAQLNGX4', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1113, N'Serial121KYCRLQP', N'Code12UEH29OYK', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1114, N'Serial1259VHCE7O', N'Code12PI4U5F1X', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1115, N'Serial1237MPERSS', N'Code127TBIF92T', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1116, N'Serial126OFA3T0V', N'Code1207ZNK08S', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1117, N'Serial12AIM88G44', N'Code12FTF4EDIV', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1118, N'Serial1245HUP41W', N'Code129500MP4E', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1119, N'Serial12GNAL31A6', N'Code12UNF4ODEK', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1120, N'Serial126PFFP3C9', N'Code12C7O7Y0H7', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1121, N'Serial128SZUAPD0', N'Code12GRPIFSE8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1122, N'Serial122EBWYDWH', N'Code12BLKELT1Q', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1123, N'Serial12ZZ2BK9JL', N'Code12HQ9GWUTS', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1124, N'Serial12EZMPAVEU', N'Code12YG35TANP', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1125, N'Serial12YLWMYUBU', N'Code1269T4ZE4U', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1126, N'Serial12GU2XEG7H', N'Code122FEQV8R8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1127, N'Serial12P25D9LN2', N'Code12PMRRBZFZ', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1128, N'Serial12SA8SDG2U', N'Code12WC8BZD8P', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1129, N'Serial124LXZJR6T', N'Code12TPIRKEXQ', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1130, N'Serial12T55MYJ2L', N'Code126NR71U7O', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1131, N'Serial12L0R5CHRY', N'Code128CIRES2Y', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1132, N'Serial12XNL2U5JW', N'Code12WQDSEE8G', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1133, N'Serial12G4JURYPC', N'Code1258MPLBCB', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1134, N'Serial12DBZO9XBW', N'Code12T4OBPEPB', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1135, N'Serial12HJCYE86F', N'Code129W3GPG27', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1136, N'Serial12NUM91JTT', N'Code12TE6AB9P9', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1137, N'Serial129ZIFYOS1', N'Code127UEH3T92', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1138, N'Serial1244JB0PZS', N'Code12GUL7Q5YC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1139, N'Serial12DAN0H24A', N'Code129A7M7YUD', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1140, N'Serial12EU0QUS3Q', N'Code12NLQ4K3MX', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1141, N'Serial1276MQIDTX', N'Code12LD2RF1S8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1142, N'Serial12HAV1Y0HB', N'Code12AOB5UBKH', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1143, N'Serial126IQTEUH0', N'Code12RDQ7DU60', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1144, N'Serial12M6TDN0GS', N'Code12IS7IVSAN', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1145, N'Serial12FPBHVY7L', N'Code12KCD3V2C6', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1146, N'Serial12ZLSMZXWE', N'Code12525JQ0CI', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1147, N'Serial12K6JSYKJW', N'Code125QW9Q9E2', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1148, N'Serial12Q4YK5FME', N'Code12PHP2OE4N', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1149, N'Serial12IXN2Q92K', N'Code12BV6F4UH2', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1150, N'Serial12V752UVBK', N'Code12ZKZX6Y70', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1151, N'Serial12KP1TJ2FL', N'Code12YQFXEIX0', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1152, N'Serial12JUEFJZGF', N'Code128SWKRRBX', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1153, N'Serial126HY6FNNN', N'Code12NWYVNREG', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1154, N'Serial1242IM0020', N'Code12QDRR8N2B', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1155, N'Serial124ZAYHOHT', N'Code120OT3K4GO', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1156, N'Serial12UTOSTQIS', N'Code12KZSPOP23', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1157, N'Serial12X90YCDQN', N'Code12K1ZG8OOC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1158, N'Serial12KYX6ZXE9', N'Code127E3IQ55V', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1159, N'Serial12NLQGO2U0', N'Code12B158HR5F', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1160, N'Serial12K034RJNH', N'Code12ISOX9JMC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1161, N'Serial12L2A5LQOD', N'Code12U2L9GNTG', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1162, N'Serial12M9I565IY', N'Code1209N9AX6H', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1163, N'Serial124WAI6JL8', N'Code12Q9ZLW8KH', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1164, N'Serial12EYBCQBS2', N'Code12KPEC3LKC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1165, N'Serial1283K67SCI', N'Code123N3ANXKT', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1166, N'Serial12EYXJ2GLR', N'Code12YNBJZKJU', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1167, N'Serial12NMQY0LYR', N'Code12E7N1AVJD', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1168, N'Serial12SUN2NOMA', N'Code122BE70AE8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1169, N'Serial12KMIEUDS2', N'Code1224QG2LEE', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1170, N'Serial12LPBJ5WGN', N'Code122XHVQOYO', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1171, N'Serial12CXRGK7KL', N'Code12BYVYH0H7', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1172, N'Serial12QC0X5FMV', N'Code120JJGA4OC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1173, N'Serial1251WA8ETU', N'Code12TXSG3FVF', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1174, N'Serial1202TCJ7KZ', N'Code12PRK4B03X', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1175, N'Serial123KZ80B2Z', N'Code12W2B1EMFX', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1176, N'Serial12P54J8E8Y', N'Code1273TPB6P8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1177, N'Serial12FV4EWHNF', N'Code12GH5WXGPP', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1178, N'Serial12PP8PIICJ', N'Code12BIF7YO06', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1179, N'Serial12WP4K2A15', N'Code120OT6PB6M', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1180, N'Serial125XWCONUZ', N'Code12OGN1YW30', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1181, N'Serial12R9NS1Q9L', N'Code123326FYID', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1182, N'Serial12RKGLSWOF', N'Code12JFSU77L1', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1183, N'Serial12QV9C4KVT', N'Code12EG09BGM8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1184, N'Serial1213OF18G2', N'Code127IVQU1Z1', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1185, N'Serial125EB36MID', N'Code12JFA7422V', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1186, N'Serial12GBVAN7YV', N'Code12A48YA3ND', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1187, N'Serial128MY05QTZ', N'Code12NY6KSUUC', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1188, N'Serial12JMMNEV1B', N'Code128V4AF2K5', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1189, N'Serial12Z4KD90NN', N'Code12AJU6VUCW', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1190, N'Serial12RYCQB42L', N'Code12UCJQHUN5', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1191, N'Serial12GW7V47VN', N'Code12LQK6RVE4', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1192, N'Serial12SHYVQHQY', N'Code12U4KZPEJP', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1193, N'Serial120WXT3ARD', N'Code12SPICU70H', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1194, N'Serial12K66YEAZX', N'Code12K7MA967Z', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1195, N'Serial122ALAOS8U', N'Code12BLGOH1E1', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1196, N'Serial121L53YSUG', N'Code121KN5JAGO', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1197, N'Serial123EMVIP34', N'Code12B62DOO9Q', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1198, N'Serial12I6XDWOZG', N'Code12GUTLR2RS', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1199, N'Serial12DL60GYTK', N'Code12GPX9HL7J', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1200, N'Serial12RZFWXQ9N', N'Code12PRVCZ4G8', 12, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1201, N'Serial13DNYZLZX8', N'Code13AYW06K27', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1202, N'Serial134O7ZKINX', N'Code13ULO5UA72', 13, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1203, N'Serial13D940PPRT', N'Code13KZZ9VOC0', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1204, N'Serial13MIYP335B', N'Code13TR4ZD3OZ', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1205, N'Serial132QQHHW93', N'Code13GEXFCQLI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1206, N'Serial13IJ4953G7', N'Code13IOTIFVQ4', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1207, N'Serial13ILUH2MZW', N'Code134PCN6G0H', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1208, N'Serial13W0X1DZRJ', N'Code13PCSYD1DE', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1209, N'Serial13EOSGQDG4', N'Code13Q1C7XF1N', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1210, N'Serial13MIVOV2C4', N'Code13E6IPI63L', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1211, N'Serial13DZ1ZR3VT', N'Code13HGP1FS63', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1212, N'Serial1328QBS1YM', N'Code13WTVIC8PU', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1213, N'Serial13XGYAISS7', N'Code13DXGP1GH6', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1214, N'Serial135DDF56N4', N'Code130IP8JO6H', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1215, N'Serial13L9JL5T8S', N'Code13FUHG05EN', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1216, N'Serial13ET3XXV3R', N'Code13PJE8RIYG', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1217, N'Serial13W2IN0875', N'Code13GYKYL24F', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1218, N'Serial133MTKX7X2', N'Code13EE4C0S6V', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1219, N'Serial13RY5872QK', N'Code13Y7J852V8', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1220, N'Serial133DMR0WNJ', N'Code13UVK1APWI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1221, N'Serial13508MJ5HO', N'Code130R7P8ZSO', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1222, N'Serial13JGTQWTEH', N'Code136O9KOWBB', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1223, N'Serial13GH2BW7NU', N'Code13QOBDI6WL', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1224, N'Serial132MB3137L', N'Code13U9H6OI5Z', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1225, N'Serial13O87F9D8Z', N'Code13JEIFLYEB', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1226, N'Serial1324NASUIK', N'Code13T2RJR3VB', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1227, N'Serial13YJN34V6H', N'Code13OCFGAC90', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1228, N'Serial13IE7T698P', N'Code13MR2E2V90', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1229, N'Serial13NBWBVEXF', N'Code13K83NJ37Z', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1230, N'Serial132Y77TQBJ', N'Code13Q9SX82S1', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1231, N'Serial134SBNVA4J', N'Code13XGNKFQB0', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1232, N'Serial13W7DBYBLP', N'Code1374M2EWS3', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1233, N'Serial13LCB5ZQOZ', N'Code13VY6639DV', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1234, N'Serial13TVY7ORYC', N'Code13LT44KJBC', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1235, N'Serial13S9DO12PH', N'Code13MF0F0MPJ', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1236, N'Serial13MWN23Y74', N'Code136UYYYQEV', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1237, N'Serial13F2UHJT4I', N'Code13A66LDRPN', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1238, N'Serial13O34CHFA1', N'Code134MXO7LI0', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1239, N'Serial13B27QC2RC', N'Code13O95RB6QL', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1240, N'Serial139LV7YZGI', N'Code13C7FBPE1N', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1241, N'Serial13LQ01N0G3', N'Code13JOIFSP8A', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1242, N'Serial1332Z3A72Z', N'Code13KH8L0JYK', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1243, N'Serial13HW7PF9SN', N'Code1347MLF12W', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1244, N'Serial13P7QD5VLQ', N'Code130AJRR53Z', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1245, N'Serial13888IR73G', N'Code13TPL5Z189', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1246, N'Serial130QNWL0AU', N'Code131P9KXWFC', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1247, N'Serial13XQJU9Q49', N'Code13RJN9017L', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1248, N'Serial13ZVM7HY1G', N'Code13VLKR9EXH', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1249, N'Serial13TOIY7979', N'Code13PC2JNZAL', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1250, N'Serial13XID9HTM8', N'Code13JYX5BNNT', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1251, N'Serial13I410GUAB', N'Code13GH1O1K6Z', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1252, N'Serial13UCZMGF5S', N'Code13V78K9K78', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1253, N'Serial135NV6CHVD', N'Code139TRRXQ30', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1254, N'Serial13ARH3JCT0', N'Code13V2PQTVDS', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1255, N'Serial13EQZC2G8O', N'Code1357GHG53O', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1256, N'Serial1389A4D7SW', N'Code13JB1U8TUJ', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1257, N'Serial1367HMN37E', N'Code13PMT34NH3', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1258, N'Serial13Z91N8IUI', N'Code13AG6B5V0X', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1259, N'Serial13JZVJ5QVH', N'Code13SD6J5UEI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1260, N'Serial138XY51S6W', N'Code13KMU35NKT', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1261, N'Serial13IKQX2K2U', N'Code13GMBCOZGI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1262, N'Serial13949B0DF2', N'Code13IFV88RO0', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1263, N'Serial13RSRUQC7J', N'Code13UOWN1NEQ', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1264, N'Serial1382QIQLSP', N'Code13N7M9LZQG', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1265, N'Serial13RYJL1TLT', N'Code1302N0IV2F', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1266, N'Serial13T4YAZRY3', N'Code13X6J3VQFD', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1267, N'Serial133303FNIX', N'Code13U38UGJ8Z', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1268, N'Serial13SVO3UBWH', N'Code131DZWCNOI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1269, N'Serial13LRGPNIA6', N'Code13N08BN7QH', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1270, N'Serial13JI14Y262', N'Code13Z423EJQI', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1271, N'Serial13N1CYM04S', N'Code13M49ZZFQG', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1272, N'Serial13EMSF3OHE', N'Code13E90DSSJD', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1273, N'Serial13T4B60LVW', N'Code13NPGQ2J4C', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1274, N'Serial13OC8Y11FV', N'Code137NEZ2SLW', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1275, N'Serial138KHFDO4R', N'Code13FKJ9ICSD', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1276, N'Serial13J5T68RDO', N'Code13CN37RHP4', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1277, N'Serial13LUOLJVP1', N'Code13GLAZTE3V', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1278, N'Serial13CP8B1NN8', N'Code130G6ZAXKW', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1279, N'Serial139ADR4NF6', N'Code13OTCQWTXU', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1280, N'Serial1388GXPAKM', N'Code138BCX2CNP', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1281, N'Serial13JG9UNIJM', N'Code13ZUYTPYHA', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1282, N'Serial137QNPYXFR', N'Code13W8DOVTOY', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1283, N'Serial13ATCUFWV9', N'Code13IPSH1I0Y', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1284, N'Serial13D4RLYIIK', N'Code137B03IDY9', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1285, N'Serial13WV7D7LHD', N'Code13E2CJIJBB', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1286, N'Serial13WULRTJV5', N'Code13RGP75K7E', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1287, N'Serial130LWDNNWV', N'Code13Z38INQPU', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1288, N'Serial13P45UH5UH', N'Code13ZP3S7WU7', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1289, N'Serial135Y412BV1', N'Code13W9E2E2A3', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1290, N'Serial13CQCUVWAC', N'Code1372LXRA5E', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1291, N'Serial13OQHWROWD', N'Code13BU55JXEV', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1292, N'Serial13RQX6UYVH', N'Code130JNOIRJK', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1293, N'Serial13OJAU7A0D', N'Code13TILAJNUB', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1294, N'Serial13BO3ONVH5', N'Code13Y87PAAUE', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1295, N'Serial13CJRJKM0S', N'Code13WPUPI09C', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1296, N'Serial13WD52XZQM', N'Code13W7MKKHW9', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1297, N'Serial135XDO7WUU', N'Code13LFSOZQKE', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1298, N'Serial13MKDNQPFM', N'Code13WTYE6MGU', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1299, N'Serial13NICAMIOJ', N'Code131N585YFF', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1300, N'Serial13EHZ1MEHB', N'Code13XT6M7HP7', 13, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1301, N'abc', N'Code14U4Y1ECW3', 14, 1)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1302, N'Serial14PO52HPPZ', N'Code14Y7Y682I9', 14, 0)
GO
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1303, N'Serial143KOH232X', N'Code14DU8LV7LO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1304, N'Serial14MRU9NQ5P', N'Code14CK6MD52D', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1305, N'Serial14HYUELBJT', N'Code14XZ6R5X46', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1306, N'Serial1454NRFFKN', N'Code14J0HQGMBA', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1307, N'Serial14HB8PY3SR', N'Code14QOTA1K17', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1308, N'Serial14UO0HFWNN', N'Code14J8WQNIOO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1309, N'Serial144IC07TDJ', N'Code14LE34P3DU', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1310, N'Serial14G3A2EVPC', N'Code141W70AXVF', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1311, N'Serial14CTPTHXJ4', N'Code141BAAKB55', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1312, N'Serial14C4RNSYSM', N'Code14M8MEP61A', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1313, N'Serial14U87EUJCV', N'Code14BAORXZK5', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1314, N'Serial14K8YA2KFO', N'Code14NFJO0DCE', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1315, N'Serial14JJXTVX4U', N'Code145O7VHGWK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1316, N'Serial14CH2PNVS6', N'Code14BBA1T820', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1317, N'Serial141UV18W7J', N'Code14045A2K2Y', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1318, N'Serial14W2AA34KJ', N'Code1420IXX81X', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1319, N'Serial146V0ZPI58', N'Code14E3NVY80R', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1320, N'Serial14RQ66X4RI', N'Code140L55HXRL', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1321, N'Serial14RKS5IVHY', N'Code14KR4RSQ5A', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1322, N'Serial14OQQ935YK', N'Code14POJHGU5M', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1323, N'Serial14JG022MXY', N'Code14MU7IY8IZ', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1324, N'Serial14TXKWH479', N'Code14JTZLMWPM', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1325, N'Serial14P2YHKNCK', N'Code14IM1EM7DQ', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1326, N'Serial14YXJ0UM09', N'Code14GK9EF7GN', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1327, N'Serial14TFGC1S00', N'Code14NXXEOIY4', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1328, N'Serial14PIDSVO3B', N'Code14FPRWU0OK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1329, N'Serial144IBRUBZD', N'Code144OIP4GH4', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1330, N'Serial14P7HUU670', N'Code14PZLSTBZE', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1331, N'Serial1403FBJOO9', N'Code147YF0HPCG', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1332, N'Serial14EQ87K37H', N'Code14X1X2G74L', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1333, N'Serial14YJAVLXXH', N'Code14HF21RCOV', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1334, N'Serial14PMPRB9PZ', N'Code147CDKSCP3', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1335, N'Serial145SE6PC9O', N'Code14QH8I5D5J', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1336, N'Serial14FIGTLK3G', N'Code1444WYTPQ0', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1337, N'Serial141UL43OM4', N'Code14WHO5CW5K', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1338, N'Serial14TAPJ4OGZ', N'Code141AWGCN4D', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1339, N'Serial147NPAHPTZ', N'Code1487RT7FP0', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1340, N'Serial14ER49YBI7', N'Code142IA337MP', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1341, N'Serial14HRN5FQ6T', N'Code14SLXAQ32I', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1342, N'Serial14E2DI9F2A', N'Code14MCBCQOFK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1343, N'Serial14SOS71HLT', N'Code1498U4E8DQ', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1344, N'Serial14YGHNVL8M', N'Code14QXYQ5MLK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1345, N'Serial144JYN492K', N'Code1429COTL7N', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1346, N'Serial14HIK309AU', N'Code14Q04A6O6C', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1347, N'Serial14BEYY7JDH', N'Code1422JRZYCO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1348, N'Serial142WLOJ0DN', N'Code14251XZOZV', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1349, N'Serial14AF4UDHFQ', N'Code14A761ECTX', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1350, N'Serial1401S1L1ES', N'Code144UDW6R8Q', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1351, N'Serial14S1I7I07R', N'Code14LM5ZFENH', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1352, N'Serial14ACN23E0G', N'Code14T407NGU2', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1353, N'Serial14FGOVZDKD', N'Code141BHJ55AU', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1354, N'Serial145PSIZGD9', N'Code1488N9K3X1', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1355, N'Serial14J2AHXIZH', N'Code1431K8867C', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1356, N'Serial14XLNCMYTY', N'Code14T5NZ79CN', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1357, N'Serial14VPET084U', N'Code14MGVQGJSH', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1358, N'Serial14JX9KMLIM', N'Code149YJT12DE', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1359, N'Serial143Y9VHU7R', N'Code14KROIA5W3', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1360, N'Serial14XUHV19RT', N'Code14XL4OX11J', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1361, N'Serial145HWTL9Z3', N'Code145ECFJVL0', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1362, N'Serial14BLFTJV6A', N'Code14JO728561', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1363, N'Serial14YLUYZ4V2', N'Code14DO5942MF', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1364, N'Serial14Q1PFH3KK', N'Code14ZNBV82KX', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1365, N'Serial1498JO077Z', N'Code14X1YJTOEL', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1366, N'Serial14X2L23VNI', N'Code14HNOBNKVF', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1367, N'Serial14WBI79Y7Z', N'Code14JWYN56MB', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1368, N'Serial14PFSFE5O5', N'Code145DKZ46CK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1369, N'Serial14ZHU6FWQ9', N'Code140T307XE6', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1370, N'Serial1482YWCAV2', N'Code14DY58OAMK', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1371, N'Serial149SUEX6XW', N'Code14SJTPNWNY', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1372, N'Serial14LK2N3JVB', N'Code14G473FNKD', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1373, N'Serial14R4FJ8E2K', N'Code14VV5J6Y8L', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1374, N'Serial14SY5RIXN0', N'Code145WUC3ZWO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1375, N'Serial14U35WBBXL', N'Code14UY91SQXL', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1376, N'Serial14RFC0GXTX', N'Code14AS3LTMDH', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1377, N'Serial14N76RNOWT', N'Code1471WVHJ1I', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1378, N'Serial14R0F2WBF4', N'Code14MP8K8WRP', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1379, N'Serial147HNTOKT6', N'Code146EWDY94P', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1380, N'Serial14AV0LVEQC', N'Code14TDEJY6KX', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1381, N'Serial14S6UYKODS', N'Code14KND541JP', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1382, N'Serial14VWNAN5G4', N'Code14YZ0I78GS', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1383, N'Serial14QUZ7KQLF', N'Code14RCCJG66I', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1384, N'Serial147B7J7FB6', N'Code14H0I988J1', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1385, N'Serial14R9IORWQ9', N'Code14RGTHM2RA', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1386, N'Serial14JXPPZVNT', N'Code14WOYP02QO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1387, N'Serial14VFF2ZJWB', N'Code14GC6VGATW', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1388, N'Serial148O877COC', N'Code14AH8F1870', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1389, N'Serial14BED0Y1WS', N'Code14ZE0PGL3T', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1390, N'Serial14VE6URBM9', N'Code14MEWLRSJ1', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1391, N'Serial14179S53G7', N'Code14H48MTERN', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1392, N'Serial14PE3AVZEV', N'Code142H4RUAU6', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1393, N'Serial140PADJ3LE', N'Code142TVK10IO', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1394, N'Serial14BGG54TKZ', N'Code14VRHQ0SH8', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1395, N'Serial14Z0IJV3RB', N'Code14CADJ9DUF', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1396, N'Serial14DN3X53JI', N'Code14KQMVS6G1', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1397, N'Serial14OGYTZ1C2', N'Code14W2JMCI37', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1398, N'Serial1405J58PC6', N'Code140UPIVM8A', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1399, N'Serial14RKB0DOUG', N'Code14E9CXVNX1', 14, 0)
INSERT [dbo].[ProductDetail] ([ID], [Serial], [Code], [ProductId], [isDelete]) VALUES (1400, N'Serial14TW8UAG8Q', N'Code14J2JG1C5E', 14, 0)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (1, N'Admin', N'admin@example.com', N'1234567890', N'123 Admin St', N'admin', N'4297f44b13955235245b2497399d7a93', 1, 1, CAST(8100.00 AS Decimal(10, 2)), CAST(N'2024-07-26T23:17:41.193' AS DateTime), N'system', CAST(N'2024-07-28T13:51:34.927' AS DateTime), N'Admin', NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'User', N'user@example.com', N'0987654321', N'456 User Rd', N'user', N'4297f44b13955235245b2497399d7a93', 2, 1, CAST(8900.00 AS Decimal(10, 2)), CAST(N'2024-07-26T23:17:41.193' AS DateTime), N'system', CAST(N'2024-07-28T14:01:14.770' AS DateTime), N'Admin', NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'Bùi Minh Hải', N'huylahoai000@gmail.com', N'0363577903', N'Trường THPT Xuân Mai', N'huydz', N'4297f44b13955235245b2497399d7a93', 2, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2024-07-27T20:26:22.487' AS DateTime), N'huydz', CAST(N'2024-07-28T13:51:30.267' AS DateTime), N'Admin', NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (5, N'Chu Văn Thành', N'thanhcvhe171649@fpt.edu.vn', N'0386520230', N'Thôn vọng xã tam giang huyện yên phong', N'thanhkk', N'4297f44b13955235245b2497399d7a93', 2, 1, CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-07-28T07:51:36.777' AS DateTime), N'th', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (6, N'Đào Ngọc Tấn', N'thanhchu5203@gmail.com', N'0323420230', N'Thôn vọng xã tam giang huyện yên phong', N'ti888', N'4297f44b13955235245b2497399d7a93', 2, 0, CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-07-28T08:51:33.293' AS DateTime), N'ti888', CAST(N'2024-07-28T13:52:48.597' AS DateTime), N'Admin', NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (7, N'Nguyễn Văn Hải', N'thanh2526@gmail.com', N'0386528526', N'Thôn vọng xã tam giang huyện yên phong', N'thanh28', N'4297f44b13955235245b2497399d7a93', 2, 1, CAST(7340.00 AS Decimal(10, 2)), CAST(N'2024-07-28T08:54:55.080' AS DateTime), N'Admin', CAST(N'2024-07-28T13:57:52.647' AS DateTime), N'Admin', NULL, 0, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Phone], [Address], [UserName], [Password], [RoleID], [isActive], [Money], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (15, N'Ngô Mạnh Huy', N'hyaga51@gmail.com', N'0954353252', N'Hà Nội', N'huy', N'4297f44b13955235245b2497399d7a93', 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-28T13:52:24.500' AS DateTime), N'Admin', NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([ID], [Name], [Discount], [Type], [RemainUsed], [IsActive], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (1, N'Giảm giá mùa hè', CAST(10.00 AS Decimal(10, 2)), 1, 99, 1, CAST(N'2024-07-26T23:17:41.557' AS DateTime), N'Admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Voucher] ([ID], [Name], [Discount], [Type], [RemainUsed], [IsActive], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (2, N'Khuyến mãi đặc biệt', CAST(20.00 AS Decimal(10, 2)), 2, 49, 1, CAST(N'2024-07-26T23:17:41.557' AS DateTime), N'Admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Voucher] ([ID], [Name], [Discount], [Type], [RemainUsed], [IsActive], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (3, N'Ưu đãi thành viên mới', CAST(15.00 AS Decimal(10, 2)), 1, 199, 1, CAST(N'2024-07-26T23:17:41.557' AS DateTime), N'Admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Voucher] ([ID], [Name], [Discount], [Type], [RemainUsed], [IsActive], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (4, N'Giảm giá cuối tuần', CAST(5.00 AS Decimal(10, 2)), 1, 500, 1, CAST(N'2024-07-26T23:17:41.557' AS DateTime), N'Admin', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Voucher] ([ID], [Name], [Discount], [Type], [RemainUsed], [IsActive], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [DeletedAt], [isDelete], [DeletedBy]) VALUES (5, N'thangnee', CAST(100.00 AS Decimal(10, 2)), 1, 29, 1, CAST(N'2024-07-26T23:17:41.557' AS DateTime), N'Admin', CAST(N'2024-07-28T09:12:34.580' AS DateTime), N'Admin', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[DepositHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([ID])
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[OrderHistoryDetail]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[OrderHistoryDetail]  WITH CHECK ADD FOREIGN KEY([OrderHistoryID])
REFERENCES [dbo].[OrderHistory] ([ID])
GO
ALTER TABLE [dbo].[OrderHistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderHist__Produ__4AB81AF0] FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetail] ([ID])
GO
ALTER TABLE [dbo].[OrderHistoryDetail] CHECK CONSTRAINT [FK__OrderHist__Produ__4AB81AF0]
GO
ALTER TABLE [dbo].[OrderReport]  WITH CHECK ADD  CONSTRAINT [FK_OrderReport_OrderHistory] FOREIGN KEY([OrderHistoryId])
REFERENCES [dbo].[OrderHistory] ([ID])
GO
ALTER TABLE [dbo].[OrderReport] CHECK CONSTRAINT [FK_OrderReport_OrderHistory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK__ProductDe__Produ__4E88ABD4] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK__ProductDe__Produ__4E88ABD4]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
