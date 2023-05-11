CREATE TABLE [dbo].[order_table](
	[order_id] [bigint] NOT NULL,
	[order_date] [date] NULL,
	[user_id] [bigint] NOT NULL,
	[product_cate_id] [int] NOT NULL,
	[order_value] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_table]    Script Date: 6/10/2022 12:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_table](
	[product_cate_id] [int] NOT NULL,
	[product_cate_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_table]    Script Date: 6/10/2022 12:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[user_id] [bigint] NOT NULL,
	[user_name] [varchar](100) NULL,
	[location] [varchar](50) NULL,
	[user_segment] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (150151, CAST(N'2021-05-01' AS Date), 101, 1, 150000)
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (178151, CAST(N'2021-05-06' AS Date), 102, 5, 300000)
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (178629, CAST(N'2021-07-06' AS Date), 101, 2, 250000)
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (180053, CAST(N'2021-07-01' AS Date), 103, 3, 89000)
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (184235, CAST(N'2021-08-10' AS Date), 102, 5, 50000)
INSERT [dbo].[order_table] ([order_id], [order_date], [user_id], [product_cate_id], [order_value]) VALUES (196325, CAST(N'2021-05-27' AS Date), 103, 4, 140000)
GO
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (1, N'books')
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (2, N'home_decor')
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (3, N'ultilities')
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (4, N'food')
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (5, N'mom_and_baby')
INSERT [dbo].[product_table] ([product_cate_id], [product_cate_name]) VALUES (6, N'electronics')
GO
INSERT [dbo].[user_table] ([user_id], [user_name], [location], [user_segment]) VALUES (101, N'A', N'HCM', N'Whale')
INSERT [dbo].[user_table] ([user_id], [user_name], [location], [user_segment]) VALUES (102, N'B ', N'HN', N'Salon')
INSERT [dbo].[user_table] ([user_id], [user_name], [location], [user_segment]) VALUES (103, N'C', N'DN', N'Dolphin')
INSERT [dbo].[user_table] ([user_id], [user_name], [location], [user_segment]) VALUES (104, N'D', N'HCM', N'Whale')
INSERT [dbo].[user_table] ([user_id], [user_name], [location], [user_segment]) VALUES (105, N'E', N'HN', N'Dolphin')
GO
