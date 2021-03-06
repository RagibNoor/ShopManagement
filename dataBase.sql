USE [master]
GO
/****** Object:  Database [ShopManagement]    Script Date: 10/14/2018 12:44:09 AM ******/
CREATE DATABASE [ShopManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShopManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ShopManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShopManagement]
GO
/****** Object:  Table [dbo].[Customer_tbl]    Script Date: 10/14/2018 12:44:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[customerId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_tbl]    Script Date: 10/14/2018 12:44:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_Product_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sell_tbl]    Script Date: 10/14/2018 12:44:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sell_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_sell_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier_tbl]    Script Date: 10/14/2018 12:44:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[SupplierId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Sell_views]    Script Date: 10/14/2018 12:44:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Sell_views]
AS
SELECT dbo.Product_tbl.Name AS ProductName, dbo.Customer_tbl.CustomerName, dbo.Supplier_tbl.SupplierName
FROM     dbo.sell_tbl INNER JOIN
                  dbo.Product_tbl ON dbo.sell_tbl.ProductId = dbo.Product_tbl.Id INNER JOIN
                  dbo.Customer_tbl ON dbo.sell_tbl.CustomerId = dbo.Customer_tbl.Id INNER JOIN
                  dbo.Supplier_tbl ON dbo.Product_tbl.SupplierId = dbo.Supplier_tbl.Id

GO
SET IDENTITY_INSERT [dbo].[Customer_tbl] ON 

INSERT [dbo].[Customer_tbl] ([Id], [CustomerName], [customerId]) VALUES (1, N'Ragib', N'001')
INSERT [dbo].[Customer_tbl] ([Id], [CustomerName], [customerId]) VALUES (3, N'Shakib', N'002')
SET IDENTITY_INSERT [dbo].[Customer_tbl] OFF
SET IDENTITY_INSERT [dbo].[Product_tbl] ON 

INSERT [dbo].[Product_tbl] ([Id], [Name], [SupplierId]) VALUES (1, N'Chips', 1)
INSERT [dbo].[Product_tbl] ([Id], [Name], [SupplierId]) VALUES (2, N'Chair', 2)
SET IDENTITY_INSERT [dbo].[Product_tbl] OFF
SET IDENTITY_INSERT [dbo].[sell_tbl] ON 

INSERT [dbo].[sell_tbl] ([Id], [ProductId], [CustomerId]) VALUES (2, 1, 1)
INSERT [dbo].[sell_tbl] ([Id], [ProductId], [CustomerId]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[sell_tbl] OFF
SET IDENTITY_INSERT [dbo].[Supplier_tbl] ON 

INSERT [dbo].[Supplier_tbl] ([Id], [SupplierName], [SupplierId]) VALUES (1, N'Pran', N'p-101')
INSERT [dbo].[Supplier_tbl] ([Id], [SupplierName], [SupplierId]) VALUES (2, N'RFL', N'p-102')
SET IDENTITY_INSERT [dbo].[Supplier_tbl] OFF
ALTER TABLE [dbo].[Product_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Product_tbl_Supplier_tbl] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier_tbl] ([Id])
GO
ALTER TABLE [dbo].[Product_tbl] CHECK CONSTRAINT [FK_Product_tbl_Supplier_tbl]
GO
ALTER TABLE [dbo].[sell_tbl]  WITH CHECK ADD  CONSTRAINT [FK_sell_tbl_Customer_tbl] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer_tbl] ([Id])
GO
ALTER TABLE [dbo].[sell_tbl] CHECK CONSTRAINT [FK_sell_tbl_Customer_tbl]
GO
ALTER TABLE [dbo].[sell_tbl]  WITH CHECK ADD  CONSTRAINT [FK_sell_tbl_Product_tbl] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product_tbl] ([Id])
GO
ALTER TABLE [dbo].[sell_tbl] CHECK CONSTRAINT [FK_sell_tbl_Product_tbl]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -82
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sell_tbl"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product_tbl"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer_tbl"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 148
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_tbl"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 295
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sell_views'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sell_views'
GO
USE [master]
GO
ALTER DATABASE [ShopManagement] SET  READ_WRITE 
GO
