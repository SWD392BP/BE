USE [master]
GO
/****** Object:  Database [SWD392-BirthdayParty]    Script Date: 2/3/2024 12:07:50 PM ******/
CREATE DATABASE [SWD392-BirthdayParty]

GO
ALTER DATABASE [SWD392-BirthdayParty] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWD392-BirthdayParty].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET  MULTI_USER 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWD392-BirthdayParty] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWD392-BirthdayParty] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWD392-BirthdayParty] SET QUERY_STORE = OFF
GO
USE [SWD392-BirthdayParty]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [nchar](10) NOT NULL,
	[UserID] [INT] NULL,
	[PartyID] [nchar](10) NULL,
	[RoomID] [nchar](10) NULL,
	[SlotID] [nchar](10) NULL,
	[MenuID] [nchar](10) NULL,
	[CreateDate] [nchar](10) NULL,
	[LastUpdateDate] [nchar](10) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ChatID] [INT] NOT NULL,
	[HostUserID] [INT] NULL,
	[CustomerUserID] [INT] NULL,
	[PartyID] [nchar](10) NULL,
	[Message] [text] NULL,
	[Timestamp] [timestamp] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [nchar](10) NOT NULL,
	[UserID] [INT] NULL,
	[BookingID] [nchar](10) NULL,
	[Rating] [float] NULL,
	[Comment] [text] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuID] [nchar](10) NOT NULL,
	[PartyID] [nchar](10) NULL,
	[Description] [text] NULL,
	[MenuItem] [text] NULL,
	[Price] [float] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageBookings]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageBookings](
	[PackageBookingID] [nchar](10) NOT NULL,
	[HostUserID] [INT] NULL,
	[PackageID] [INT] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_PackageBookings] PRIMARY KEY CLUSTERED 
(
	[PackageBookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[PackageID] [INT] IDENTITY(1,1) NOT NULL,
	[AdminUserID] [INT] NULL,
	[PackageName] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Image] [NVARCHAR](255) NULL,
	[Price] [INT] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parties]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parties](
	[PartyID] [nchar](10) NOT NULL,
	[HostUserID] [INT] NULL,
	[PartyName] [nvarchar](50) NULL,
	[PartyDate] [date] NULL,
	[Description] [text] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [nchar](10) NOT NULL,
	[RoomName] [nvarchar](50) NULL,
	[PartyID] [nchar](10) NULL,
	[RoomNo] [nvarchar](20) NULL,
	[Description] [text] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slots]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slots](
	[SlotID] [nchar](10) NOT NULL,
	[RoomID] [nchar](10) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Slots] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [INT] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](13) NULL,
	[Role] [varchar](10) NOT NULL,
	[Image] [varchar](255) NULL,
	[CreateDate] [date],
	[LastUpdateDate] [date],
	[Status] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[VoucherID] [nchar](10) NOT NULL,
	[VoucherCode] [nchar](10) NULL,
	[PackageID] [INT] NULL,
	[DiscountAmount] [float] NULL,
	[DiscountPercent] [float] NULL,
	[ExpiryDate] [date] NULL,
	[DiscountMax] [float] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherUsages]    Script Date: 2/3/2024 12:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherUsages](
	[VoucherUsageID] [nchar](10) NOT NULL,
	[VoucherID] [nchar](10) NULL,
	[HostUserID] [INT] NULL,
	[CreateDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_VoucherUsages] PRIMARY KEY CLUSTERED 
(
	[VoucherUsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Menus]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Parties] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Parties]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Slots] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slots] ([SlotID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Slots]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Parties] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Parties]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users] FOREIGN KEY([HostUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users1] FOREIGN KEY([CustomerUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users1]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Bookings] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Bookings]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Users]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Parties] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Parties]
GO
ALTER TABLE [dbo].[PackageBookings]  WITH CHECK ADD  CONSTRAINT [FK_PackageBookings_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
GO
ALTER TABLE [dbo].[PackageBookings] CHECK CONSTRAINT [FK_PackageBookings_Packages]
GO
ALTER TABLE [dbo].[PackageBookings]  WITH CHECK ADD  CONSTRAINT [FK_PackageBookings_Users] FOREIGN KEY([HostUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PackageBookings] CHECK CONSTRAINT [FK_PackageBookings_Users]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Users] FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Users]
GO
ALTER TABLE [dbo].[Parties]  WITH CHECK ADD  CONSTRAINT [FK_Parties_Users] FOREIGN KEY([HostUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Parties] CHECK CONSTRAINT [FK_Parties_Users]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Parties] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Parties] ([PartyID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Parties]
GO
ALTER TABLE [dbo].[Slots]  WITH CHECK ADD  CONSTRAINT [FK_Slots_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Slots] CHECK CONSTRAINT [FK_Slots_Rooms]
GO
ALTER TABLE [dbo].[VoucherUsages]  WITH CHECK ADD  CONSTRAINT [FK_VoucherUsages_Users] FOREIGN KEY([HostUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[VoucherUsages] CHECK CONSTRAINT [FK_VoucherUsages_Users]
GO
ALTER TABLE [dbo].[VoucherUsages]  WITH CHECK ADD  CONSTRAINT [FK_VoucherUsages_Vouchers] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Vouchers] ([VoucherID])
GO
ALTER TABLE [dbo].[VoucherUsages] CHECK CONSTRAINT [FK_VoucherUsages_Vouchers]
GO
USE [master]
GO
ALTER DATABASE [SWD392-BirthdayParty] SET  READ_WRITE 
GO
