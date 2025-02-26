USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 07.02.2025 13:04:39 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Manufactor]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactor](
	[ManufactorID] [int] IDENTITY(1,1) NOT NULL,
	[ManufactorName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Manufactor] PRIMARY KEY CLUSTERED 
(
	[ManufactorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderUserID] [int] NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFE799BE3B] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductSupplier] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductMaxDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductUnitOfMeasure] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD53ACB088B] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07.02.2025 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufactor] ON 

INSERT [dbo].[Manufactor] ([ManufactorID], [ManufactorName]) VALUES (1, N'ЮвелирКарат')
INSERT [dbo].[Manufactor] ([ManufactorID], [ManufactorName]) VALUES (2, N'ЮвелирТорг')
SET IDENTITY_INSERT [dbo].[Manufactor] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (11, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 1, 7, 1, 921)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (12, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 2, 9, 36, 922)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (13, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 2, NULL, 2, 923)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (14, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime), 2, NULL, 11, 924)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (15, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 1, 8, 34, 925)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (16, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 1, NULL, 2, 926)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (17, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 2, NULL, 19, 927)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (18, CAST(N'2022-05-27T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), 2, 10, 5, 928)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (19, CAST(N'2022-05-27T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), 2, NULL, 19, 929)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderUserID], [OrderPickupPoint], [OrderCode]) VALUES (20, CAST(N'2022-05-28T00:00:00.000' AS DateTime), CAST(N'2022-06-03T00:00:00.000' AS DateTime), 1, NULL, 25, 930)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (35, 11, N'G843Y6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (36, 12, N'D493Y7', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (37, 13, N'F735H6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (38, 14, N'V835G5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (39, 15, N'S530N6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (40, 16, N'S844B6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (41, 17, N'L486B6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (42, 18, N'F047G5', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (43, 19, N'B835H6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (44, 20, N'N764H5', 5)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (46, 11, N'A112T4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (47, 12, N'S648N6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (48, 13, N'C635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (50, 15, N'P846H6', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (51, 16, N'S530N6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (52, 17, N'B846B6', 4)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (53, 18, N'H845N5', 2)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (54, 19, N'C453B6', 1)
INSERT [dbo].[OrderProduct] ([OrderProductID], [OrderID], [ProductArticleNumber], [ProductCount]) VALUES (55, 20, N'B964G6', 4)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (2, N'Новый')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (1, N'344288, г. Михайловка, ул. Чехова, 1')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (2, N'614164, г.Михайловка, ул. Степная, 30')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (3, N'394242, г. Михайловка, ул. Коммунистическая, 43')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (4, N'660540,г. Михайловка, ул. Солнечная, 25')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (5, N'125837, г. Михайловка, ул. Шоссейная, 40')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (6, N'125703, г. Михайловка, ул. Партизанская, 49')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (7, N'625283,г. Михайловка, ул. Победы, 46')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (8, N'614611,г. Михайловка, ул. Молодежная, 50')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (9, N'454311, г.Михайловка, ул. Новая, 19')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (10, N'660007, г.Михайловка, ул. Октябрьская, 19')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (11, N'603036, г. Михайловка, ул. Садовая, 4')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (12, N'450983,г.Михайловка, ул. Комсомольская, 26')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (13, N'394782, г. Михайловка, ул. Чехова, 3')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (14, N'603002, г. Михайловка, ул. Двержинского, 28')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (15, N'450558,г. Михайловка, ул. Набережная, 30')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (16, N'394060,г.Михайловка, ул. Фрунзе, 43')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (17, N'410661,г. Михайловка, ул. Школьная, 50')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (18, N'625590, г. Михайловка, ул. Коммунистическая, 20')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (19, N'625683, г. Михайловка, ул. 8 Марта')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (20, N'400562,г. Михайловка, ул. Зеленая, 32')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (21, N'614510, г. Михайловка, ул. Маяковского, 47')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (22, N'410542, г. Михайловка, ул. Светлая, 46')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (23, N'620839,г. Михайловка, ул. Цветочная, 8')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (24, N'443890, г. Михайловка, ул. Коммунистическая, 1')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (25, N'603379, г. Михайловка, ул. Спортивная, 46')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (26, N'603721, г. Михайловка, ул. Гоголя, 41')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (27, N'410172, г. Михайловка, ул. Северная, 13')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (28, N'420151, г. Михайловка, ул. Вишневая, 32')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (29, N'125061, г. Михайловка, ул. Подгорная, 8')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (30, N'630370, г. Михайловка, ул. Шоссейная, 24')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (31, N'614753, г. Михаиловка, ул. Полевая, 35')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (32, N'426030, г. Михаиловка, ул. Маяковского, 44')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (33, N'450375, г. Михаиловка, ул. Клубная, 44')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (34, N'625560, г. Михаиловка, ул. Некрасова, 12')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (35, N'630201, г. Михаиловка, ул. Комсомольская, 17')
INSERT [dbo].[PickUpPoint] ([PointID], [PointName]) VALUES (36, N'190949, г. Михаиловка, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'A112T4', N'Серьги', N'Серьги серебрянные в позолоье продёвки на цепочке "Звезда"', N'Серьги', N'А112Т4.png', 1, N'SunLight', CAST(590.0000 AS Decimal(19, 4)), 3, 30, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'B835H6', N'Колье', N'Ювелирное колье из серебра 925 пробы с фианитами', N'Колье', NULL, 1, N'Sokolov', CAST(2600.0000 AS Decimal(19, 4)), 4, 20, 5, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'B845B6', N'Серьги', N'Серьги с фианитами и гемититами из серебра с позолотой', N'Серьги', NULL, 2, N'Sokolov', CAST(5200.0000 AS Decimal(19, 4)), 3, 30, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'B846B6', N'Браслет', N'Браслет из Золота "Бесконечность" яхонт', N'Браслет', NULL, 1, N'Sokolov', CAST(5900.0000 AS Decimal(19, 4)), 3, 15, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'B936H6', N'Колье', N'Колье Эстет Золотое колье', N'Колье', NULL, 2, N'Sokolov', CAST(17500.0000 AS Decimal(19, 4)), 3, 5, 9, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'B964G6', N'Подвеска', N'Подвеска с 1 бриллиантом из красного золота', N'Подвеска', NULL, 2, N'Sokolov', CAST(5350.0000 AS Decimal(19, 4)), 2, 5, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'C453B6', N'Подвеска', N'Подвеска из красного золота', N'Подвеска', NULL, 1, N'Sokolov', CAST(5300.0000 AS Decimal(19, 4)), 2, 25, 16, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'C635R4', N'Ожерелье', N'Ожерелье Lace (муассанит, круг, RS Regular, 6,5 мм, 2 муассанит Кр-57 6мм', N'Ожерелье', N'C635R4.jpg', 2, N'SunLight', CAST(590000.0000 AS Decimal(19, 4)), 2, 10, 16, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'D493Y7', N'Ожерелье', N'Ожерелье Cordelia (муассанит, 11шт., 3,5мм, круг, BS Regular, 40см', N'Ожерелье', N'D493Y7.jpg', 1, N'Sokolov', CAST(79000.0000 AS Decimal(19, 4)), 3, 30, 2, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'D936R6', N'Серьги', N'Серьги со стразами Swarovski 2129919/9611 Ювелир Карат', N'Серьги', N'D936R6.jpg', 2, N'SunLight', CAST(890.0000 AS Decimal(19, 4)), 3, 30, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'F047G5', N'Брошь', N'Брошь PLATINA jewelry из серебра 925 пробы с эмалью', N'Брошь', NULL, 1, N'Sokolov', CAST(7100.0000 AS Decimal(19, 4)), 3, 10, 2, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'F735H6', N'Серьги', N'Серьги из золота с эмалью', N'Серьги', N'F735H6.jpg', 2, N'Sokolov', CAST(12000.0000 AS Decimal(19, 4)), 4, 5, 5, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'G836H6', N'Подвеска', N'Подвеска серебряная в позолоте с фианитами 2139189/9п Ювелир Карат', N'Подвеска', N'котенок.jpg', 2, N'Sokolov', CAST(140.0000 AS Decimal(19, 4)), 2, 10, 0, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'G843Y6', N'Подвеска', N'Подвеска серебряная с фианитами 2138729/9 Ювелир Карат', N'Подвеска', N'G843Y6.jpg', 2, N'Sokolov', CAST(240.0000 AS Decimal(19, 4)), 3, 25, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'H845N5', N'Серьги', N'Серьги из серебра с позолотой', N'Серьги', NULL, 2, N'SunLight', CAST(2400.0000 AS Decimal(19, 4)), 4, 25, 5, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'K943G6', N'Серьги', N'Серьги из золота с эмалью', N'Серьги', NULL, 2, N'Sokolov', CAST(11545.0000 AS Decimal(19, 4)), 3, 25, 2, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'kjsdf', N'котята', N'крутые котики', N'котята', N'котенок.jpg', 1, N'котята', CAST(1232.1200 AS Decimal(19, 4)), 32, 30, 32, N'шт')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'L486B6', N'Серьги', N'Серьги из красного золота', N'Серьги', NULL, 1, N'Sokolov', CAST(7000.0000 AS Decimal(19, 4)), 2, 30, 16, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'L596G5', N'Серьги', N'Серьги из красного золота', N'Серьги', NULL, 2, N'SunLight', CAST(11000.0000 AS Decimal(19, 4)), 3, 15, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'N385N6', N'Серьги', N'Серьги-продевки из золота с фианитами', N'Серьги', NULL, 1, N'Sokolov', CAST(6200.0000 AS Decimal(19, 4)), 4, 20, 5, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'N764H5', N'Серьги', N'Платина серьги из красного золота без камней', N'Серьги', NULL, 1, N'SunLight', CAST(10600.0000 AS Decimal(19, 4)), 4, 10, 3, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'P846H6', N'Подвеска', N'Подвеска из красного золота П142-4547', N'Подвеска', NULL, 2, N'Sokolov', CAST(5195.0000 AS Decimal(19, 4)), 3, 5, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'S395J7', N'Серьги', N'Серьги из золота 029038', N'Серьги', N'S395J7.jpg', 1, N'Sokolov', CAST(7000.0000 AS Decimal(19, 4)), 3, 25, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'S530N6', N'Серьги', N'Серебряные серьги с ювелирной керамикой', N'Серьги', NULL, 1, N'SunLight', CAST(2900.0000 AS Decimal(19, 4)), 2, 15, 16, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'S538J7', N'Серьги', N'Серьги с 4 фианитами из серебра с позолотой', N'Серьги', N'S538J7.jpg', 1, N'Sokolov', CAST(2300.0000 AS Decimal(19, 4)), 3, 30, 2, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'S648N6', N'Серьги', N'Серьги "Бабочки" в позолоте', N'Серьги', N'S648N6.png', 1, N'SunLight', CAST(990.0000 AS Decimal(19, 4)), 4, 5, 5, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'S844B6', N'Подвеска', N'Подвеска из серебра с позолотой', N'Подвеска', NULL, 2, N'SunLight', CAST(2100.0000 AS Decimal(19, 4)), 3, 6, 6, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'V494H6', N'Подвеска', N'Подвеска серебряная с фианнитами', N'Подвеска', NULL, 1, N'Sokolov', CAST(480.0000 AS Decimal(19, 4)), 2, 15, 12, N'шт.')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductMaxDiscountAmount], [ProductQuantityInStock], [ProductUnitOfMeasure]) VALUES (N'V835G5', N'Подвеска', N'Подвеска из золоченого серебра с фианитами', N'Подвеска', NULL, 1, N'SunLight', CAST(695.0000 AS Decimal(19, 4)), 3, 10, 6, N'шт.')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Савин', N'Станислав', N'Гордеевич', N'clh4o41zbrse@yahoo.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Григорева', N'Есения', N'Александровна', N'rdgm3tpair7ch@outlook.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Копылова', N'Алиса', N'Кирилловна', N'048anwxgze1@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Кузнецов', N'Лев', N'Фёдорович', N'9zg4lmtik3ja@yahoo.com', N'YYohfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Иванов', N'Михаил', N'Тимофеевич', N'1p4khxif7awq@mail.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Крюков', N'Тимофей', N'Ильич', N'zu56nc43xom@outlook.com', N'rwDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Игнатов', N'Роман', N'Степанович', N'iuf9nqrns114@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Анисимова', N'Алисия', N'Сергеевна', N'hkonmpl8tdy2@mail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Лебедева', N'Софья', N'Марковна', N'9ovm3eaqk0jz@mail.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Волков', N'Богдан', N'Денисович', N'5lfxozw7erq2@outlook.com', N'JIFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderPick__440B1D61] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickUpPoint] ([PointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderPick__440B1D61]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderStat__4222D4EF] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderStat__4222D4EF]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderUser__4316F928] FOREIGN KEY([OrderUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderUser__4316F928]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__5629CD9C] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__5629CD9C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Manufactor] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufactor] ([ManufactorID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Manufactor]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
