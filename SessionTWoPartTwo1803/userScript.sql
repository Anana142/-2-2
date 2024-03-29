USE [master]
GO
/****** Object:  Database [user]    Script Date: 11.03.2024 14:46:09 ******/
CREATE DATABASE [user]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\user.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\user_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [user] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user] SET ARITHABORT OFF 
GO
ALTER DATABASE [user] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user] SET RECOVERY FULL 
GO
ALTER DATABASE [user] SET  MULTI_USER 
GO
ALTER DATABASE [user] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'user', N'ON'
GO
ALTER DATABASE [user] SET QUERY_STORE = ON
GO
ALTER DATABASE [user] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [user]
GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[Patronymic] [nvarchar](250) NULL,
	[RoleId] [int] NULL,
	[SpecializationId] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicCardCode] [int] NOT NULL,
	[Diagnoz] [nvarchar](250) NOT NULL,
	[Purpose] [nvarchar](250) NULL,
	[DepartmentId] [int] NULL,
	[ConditionId] [int] NOT NULL,
	[Length] [int] NULL,
	[AdditionInformation] [nvarchar](250) NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuransyPolise]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuransyPolise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateStop] [date] NOT NULL,
	[InsuransyCompanyId] [int] NOT NULL,
 CONSTRAINT [PK_InsuransyPolise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsurnsyCompany]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsurnsyCompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_InsurnsyCompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[MedicCardCode] [int] NOT NULL,
	[Photo] [image] NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[Patronymic] [nvarchar](250) NULL,
	[PasportSries] [nvarchar](4) NOT NULL,
	[PasportNumber] [nvarchar](6) NOT NULL,
	[Birthday] [date] NOT NULL,
	[GenderId] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](17) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[DateMedicCardGet] [date] NOT NULL,
	[DateLastVisit] [date] NULL,
	[DateNextVisit] [date] NULL,
	[InsuransyPolisyId] [int] NULL,
	[History] [nvarchar](250) NULL,
	[WorkPlace] [nvarchar](250) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[MedicCardCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[StartTimeDay] [time](7) NOT NULL,
	[EndTimeDay] [time](7) NOT NULL,
	[Archive] [int] NULL,
	[Approval] [int] NULL,
	[Date] [date] NOT NULL,
	[TimeGaps] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableTime]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeStartGaps] [time](7) NOT NULL,
	[TimeEndGaps] [time](7) NOT NULL,
	[PatientMediccardCode] [int] NULL,
	[SpecialEvent] [int] NULL,
	[ScheduleId] [int] NULL,
 CONSTRAINT [PK_TableTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapeuticDiagnostic]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapeuticDiagnostic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicCardCode] [int] NULL,
	[DoctorId] [int] NULL,
	[TypeId] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Rezult] [nvarchar](250) NULL,
	[Recommendation] [nvarchar](250) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TherapeuticDiagnostic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NULL,
	[StartTimeGaps] [time](7) NULL,
	[EndTimeGaps] [time](7) NULL,
	[PatientId] [int] NULL,
	[SpecialEvent] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 11.03.2024 14:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Conditions] ON 

INSERT [dbo].[Conditions] ([Id], [Name]) VALUES (1, N'Бюджетно')
INSERT [dbo].[Conditions] ([Id], [Name]) VALUES (2, N'Платно')
SET IDENTITY_INSERT [dbo].[Conditions] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'Отделение А')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'Отделение Б')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (1, N'Giralda', N'Cromblehome', NULL, 1, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (2, N'Maggi', N'Kiossel', NULL, 2, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (3, N'Sylvan', N'Sawood', NULL, 3, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (4, N'Sibyl', N'Questier', NULL, 1, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (5, N'Heidi', N'McCroft', NULL, 3, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (6, N'Sullivan', N'Spurden', NULL, 2, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (7, N'Elladine', N'Alyokhin', NULL, 2, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (8, N'Griselda', N'Maultby', NULL, NULL, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (9, N'Donnie', N'Glasman', NULL, NULL, NULL)
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Patronymic], [RoleId], [SpecializationId]) VALUES (10, N'Maia', N'Sonschein', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N' мужской')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (1, 69, N'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin', N'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 2, 2, 13, N'26/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (2, 100, N'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', N'id lobortis convallis tortor risus dapibus augue vel accumsan tellus', 2, 2, 2, N'22/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (3, 24, N'quam a odio in hac habitasse platea dictumst maecenas ut massa', N'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra', 2, 1, 11, N'08/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (4, 73, N'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', N'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in', 1, 1, 5, N'13/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (5, 84, N'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', N'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 1, 2, 18, N'17/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (6, 10, N'tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', N'nam congue risus semper porta volutpat quam pede lobortis ligula', 2, 1, 8, N'19/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (7, 65, N'integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', N'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu', 1, 1, 15, N'22/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (8, 36, N'proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae', N'rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 1, 1, 17, N'25/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (9, 75, N'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget', N'mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis', 2, 1, 3, N'14/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (10, 10, N'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', N'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis', 2, 2, 13, N'19/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (11, 60, N'placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt', N'orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 2, 1, 4, N'26/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (12, 5, N'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie', N'sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui', 1, 2, 6, N'26/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (13, 2, N'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', N'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu', 1, 1, 8, N'13/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (14, 43, N'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', N'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum', 1, 2, 17, N'25/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (15, 76, N'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam', N'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit', 2, 1, 10, N'09/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (16, 50, N'sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', N'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 2, 1, 10, N'16/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (17, 92, N'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', N'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', 2, 1, 16, N'19/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (18, 3, N'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', N'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna', 2, 2, 3, N'15/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (19, 98, N'tristique in tempus sit amet sem fusce consequat nulla nisl nunc', N'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 2, 2, 16, N'18/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (20, 63, N'quam pede lobortis ligula sit amet eleifend pede libero quis orci', N'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', 2, 2, 20, N'27/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (21, 34, N'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede', N'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 2, 2, 7, N'04/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (22, 75, N'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', N'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta', 2, 1, 12, N'16/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (23, 52, N'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in', N'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu', 2, 2, 4, N'15/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (24, 85, N'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', N'neque libero convallis eget eleifend luctus ultricies eu nibh quisque id', 1, 2, 8, N'27/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (25, 19, N'pede justo eu massa donec dapibus duis at velit eu est congue elementum', N'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam', 2, 2, 18, N'12/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (26, 69, N'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus', N'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 1, 2, 12, N'13/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (27, 52, N'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', N'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna', 2, 1, 7, N'10/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (28, 89, N'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', N'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', 1, 1, 12, N'22/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (29, 58, N'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum', N'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 2, 2, 2, N'23/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (30, 64, N'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in', N'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', 1, 2, 19, N'21/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (31, 84, N'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique', N'ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', 2, 2, 2, N'24/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (32, 40, N'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', N'gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', 2, 2, 18, N'22/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (33, 92, N'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', N'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris', 2, 1, 1, N'14/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (34, 100, N'mauris vulputate elementum nullam varius nulla facilisi cras non velit', N'donec semper sapien a libero nam dui proin leo odio porttitor id consequat', 1, 2, 17, N'14/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (35, 8, N'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', N'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit', 2, 1, 13, N'27/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (36, 93, N'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras', N'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 1, 1, 19, N'03/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (37, 28, N'nunc proin at turpis a pede posuere nonummy integer non', N'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', 1, 1, 2, N'25/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (38, 64, N'in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', N'ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', 2, 1, 4, N'13/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (39, 12, N'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', N'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 2, 2, 8, N'18/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (40, 26, N'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio', N'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 1, 2, 13, N'20/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (41, 23, N'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', N'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 2, 1, 7, N'11/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (42, 71, N'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet', N'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper', 1, 1, 14, N'13/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (43, 5, N'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', N'cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', 1, 1, 1, N'09/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (44, 17, N'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur', N'etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa', 1, 1, 16, N'10/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (45, 43, N'proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', N'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 1, 2, 20, N'31/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (46, 48, N'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', N'in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum', 1, 1, 8, N'18/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (47, 8, N'mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', N'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', 1, 2, 18, N'05/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (48, 16, N'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id', N'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', 2, 1, 7, N'29/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (49, 69, N'quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis', N'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 2, 1, 18, N'13/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (50, 60, N'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', N'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 2, 1, 4, N'27/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (51, 14, N'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', N'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 1, 2, 13, N'24/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (52, 61, N'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet', N'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 2, 2, 10, N'14/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (53, 70, N'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', N'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', 2, 1, 19, N'29/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (54, 22, N'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus', N'ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem', 2, 2, 6, N'21/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (55, 74, N'ac tellus semper interdum mauris ullamcorper purus sit amet nulla', N'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 2, 2, 4, N'24/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (56, 33, N'sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu', N'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 2, 2, 12, N'20/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (57, 51, N'purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor', N'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 2, 1, 18, N'03/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (58, 48, N'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', N'in eleifend quam a odio in hac habitasse platea dictumst maecenas', 2, 1, 12, N'05/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (59, 90, N'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', N'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi', 2, 2, 10, N'12/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (60, 67, N'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio', N'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 1, 2, 12, N'01/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (61, 65, N'orci pede venenatis non sodales sed tincidunt eu felis fusce posuere', N'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 2, 1, 9, N'21/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (62, 77, N'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', N'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', 1, 2, 10, N'24/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (63, 93, N'in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', N'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit', 2, 1, 15, N'20/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (64, 33, N'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', N'nulla nunc purus phasellus in felis donec semper sapien a libero nam', 2, 1, 20, N'12/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (65, 90, N'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', N'integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum', 1, 1, 1, N'04/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (66, 59, N'ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', N'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', 1, 2, 19, N'03/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (67, 79, N'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', N'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 1, 1, 12, N'31/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (68, 14, N'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', N'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet', 1, 2, 5, N'20/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (69, 76, N'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', N'dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', 1, 1, 1, N'17/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (70, 68, N'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet', N'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', 2, 2, 1, N'09/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (71, 42, N'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', N'ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit', 1, 2, 14, N'24/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (72, 51, N'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', N'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', 2, 2, 12, N'25/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (73, 26, N'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at', N'quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', 1, 2, 12, N'18/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (74, 79, N'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio', N'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 2, 1, 7, N'09/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (75, 63, N'aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus', N'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis', 2, 2, 1, N'27/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (76, 14, N'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', N'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in', 2, 1, 17, N'28/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (77, 77, N'interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', N'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero', 2, 2, 1, N'01/03/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (78, 70, N'sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede', N'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', 1, 2, 19, N'27/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (79, 48, N'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim', N'lectus in est risus auctor sed tristique in tempus sit', 1, 1, 14, N'10/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (80, 1, N'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', N'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 1, 1, 4, N'06/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (81, 6, N'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a', N'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', 2, 1, 19, N'24/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (82, 7, N'augue a suscipit nulla elit ac nulla sed vel enim sit amet', N'id mauris vulputate elementum nullam varius nulla facilisi cras non velit', 1, 2, 6, N'23/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (83, 72, N'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', N'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum', 2, 2, 14, N'21/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (84, 15, N'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla', N'mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh', 1, 1, 15, N'23/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (85, 48, N'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur', N'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 2, 2, 16, N'10/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (86, 4, N'eget congue eget semper rutrum nulla nunc purus phasellus in', N'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at', 2, 1, 4, N'04/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (87, 47, N'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', N'in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 2, 2, 1, N'10/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (88, 54, N'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui', N'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 2, 1, 15, N'16/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (89, 44, N'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu', N'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 2, 1, 20, N'18/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (90, 78, N'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', N'duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis', 2, 2, 17, N'18/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (91, 97, N'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem', N'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 1, 2, 7, N'18/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (92, 32, N'dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', N'lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 1, 1, 14, N'09/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (93, 67, N'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus', N'quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 2, 2, 9, N'16/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (94, 73, N'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', N'duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend', 2, 2, 9, N'08/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (95, 6, N'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst', N'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 2, 2, 2, N'23/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (96, 11, N'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor', N'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', 1, 2, 18, N'15/01/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (97, 10, N'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', N'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 1, 2, 10, N'24/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (98, 51, N'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam', N'placerat ante nulla justo aliquam quis turpis eget elit sodales', 1, 2, 15, N'22/02/2024', NULL)
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (99, 56, N'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', N'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu', 1, 2, 8, N'29/02/2024', NULL)
GO
INSERT [dbo].[Hospitalization] ([Id], [MedicCardCode], [Diagnoz], [Purpose], [DepartmentId], [ConditionId], [Length], [AdditionInformation], [StartDate]) VALUES (100, 82, N'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', N'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi', 1, 2, 16, N'07/01/2024', NULL)
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuransyPolise] ON 

INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (1, CAST(N'2027-03-12' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (2, CAST(N'2026-10-20' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (3, CAST(N'2027-07-29' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (4, CAST(N'2026-02-27' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (5, CAST(N'2027-11-27' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (6, CAST(N'2025-01-21' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (7, CAST(N'2027-09-09' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (8, CAST(N'2028-01-23' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (9, CAST(N'2026-02-21' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (10, CAST(N'2025-04-11' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (11, CAST(N'2026-06-05' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (12, CAST(N'2026-10-17' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (13, CAST(N'2025-11-17' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (14, CAST(N'2026-02-21' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (15, CAST(N'2027-08-17' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (16, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (17, CAST(N'2025-07-12' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (18, CAST(N'2026-02-01' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (19, CAST(N'2026-11-13' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (20, CAST(N'2024-11-19' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (21, CAST(N'2027-07-24' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (22, CAST(N'2025-08-02' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (23, CAST(N'2027-01-29' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (24, CAST(N'2024-07-10' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (25, CAST(N'2026-07-26' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (26, CAST(N'2024-05-05' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (27, CAST(N'2025-09-19' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (28, CAST(N'2026-11-08' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (29, CAST(N'2024-09-24' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (30, CAST(N'2027-03-05' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (31, CAST(N'2024-08-02' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (32, CAST(N'2024-07-07' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (33, CAST(N'2025-09-23' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (34, CAST(N'2027-03-07' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (35, CAST(N'2024-06-08' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (36, CAST(N'2027-10-23' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (37, CAST(N'2025-09-21' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (38, CAST(N'2027-07-20' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (39, CAST(N'2026-05-27' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (40, CAST(N'2027-06-06' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (41, CAST(N'2026-08-26' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (42, CAST(N'2027-05-11' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (43, CAST(N'2027-07-20' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (44, CAST(N'2024-12-22' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (45, CAST(N'2024-08-17' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (46, CAST(N'2024-06-11' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (47, CAST(N'2025-12-21' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (48, CAST(N'2025-05-01' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (49, CAST(N'2025-12-18' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (50, CAST(N'2028-02-04' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (51, CAST(N'2026-10-16' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (52, CAST(N'2024-04-05' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (53, CAST(N'2027-02-14' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (54, CAST(N'2025-08-24' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (55, CAST(N'2024-06-21' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (56, CAST(N'2024-08-20' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (57, CAST(N'2026-08-10' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (58, CAST(N'2026-08-19' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (59, CAST(N'2027-08-08' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (60, CAST(N'2024-08-13' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (61, CAST(N'2026-04-11' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (62, CAST(N'2027-11-15' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (63, CAST(N'2027-12-20' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (64, CAST(N'2026-06-05' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (65, CAST(N'2025-01-03' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (66, CAST(N'2026-12-06' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (67, CAST(N'2025-08-24' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (68, CAST(N'2025-01-07' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (69, CAST(N'2026-07-03' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (70, CAST(N'2026-06-09' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (71, CAST(N'2027-05-19' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (72, CAST(N'2024-07-15' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (73, CAST(N'2026-04-06' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (74, CAST(N'2026-08-30' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (75, CAST(N'2025-11-11' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (76, CAST(N'2024-07-08' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (77, CAST(N'2027-12-10' AS Date), 9)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (78, CAST(N'2028-02-27' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (79, CAST(N'2026-06-13' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (80, CAST(N'2026-06-07' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (81, CAST(N'2026-08-13' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (82, CAST(N'2025-05-26' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (83, CAST(N'2027-06-28' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (84, CAST(N'2026-07-29' AS Date), 8)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (85, CAST(N'2027-04-21' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (86, CAST(N'2024-07-17' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (87, CAST(N'2027-04-06' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (88, CAST(N'2025-09-25' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (89, CAST(N'2024-10-02' AS Date), 5)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (90, CAST(N'2024-08-02' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (91, CAST(N'2027-12-11' AS Date), 3)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (92, CAST(N'2027-01-03' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (93, CAST(N'2024-12-16' AS Date), 2)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (94, CAST(N'2027-01-07' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (95, CAST(N'2024-08-23' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (96, CAST(N'2026-12-15' AS Date), 6)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (97, CAST(N'2027-10-07' AS Date), 4)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (98, CAST(N'2027-07-22' AS Date), 7)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (99, CAST(N'2024-11-21' AS Date), 6)
GO
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (100, CAST(N'2026-12-10' AS Date), 10)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (101, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[InsuransyPolise] ([Id], [DateStop], [InsuransyCompanyId]) VALUES (102, CAST(N'0001-01-01' AS Date), 5)
SET IDENTITY_INSERT [dbo].[InsuransyPolise] OFF
GO
SET IDENTITY_INSERT [dbo].[InsurnsyCompany] ON 

INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (1, N'Dynazzy')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (2, N'Buzzbean')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (3, N'Skyba')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (4, N'Tagopia')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (5, N'Photobug')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (6, N'Edgeclub')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (7, N'Wikizz')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (8, N'Abatz')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (9, N'Voomm')
INSERT [dbo].[InsurnsyCompany] ([Id], [Name]) VALUES (10, N'Jayo')
SET IDENTITY_INSERT [dbo].[InsurnsyCompany] OFF
GO
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (0, NULL, N'Предвартительная запись', N'Предвартительная запись', N'Предвартительная запись', N'9999', N'9999', CAST(N'0001-01-01' AS Date), 1, N'1', N'11', N'1', CAST(N'0001-01-10' AS Date), NULL, NULL, 1, NULL, N'1')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (1, NULL, N'Alden', N'', N'O''Corhane', N'7189', N'565891', CAST(N'2009-07-16' AS Date), 1, N'Apt 160', N'588-812-2476', N'aocorhane0@flavors.me', CAST(N'2014-01-24' AS Date), NULL, NULL, 1, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (2, NULL, N'Doris', N'', N'Lawlings', N'9096', N'984756', CAST(N'2009-02-14' AS Date), 1, N'PO Box 99954', N'561-516-6012', N'dlawlings1@nhs.uk', CAST(N'2006-08-20' AS Date), NULL, NULL, 2, N'', N'Tazzy')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (3, NULL, N'Moselle', N'', N'Peggram', N'3292', N'199625', CAST(N'2010-03-07' AS Date), 1, N'Suite 39', N'598-202-0358', N'mpeggram2@meetup.com', CAST(N'2005-06-06' AS Date), NULL, NULL, 3, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (4, NULL, N'Nils', N'', N'Kerfut', N'1166', N'109452', CAST(N'2006-02-22' AS Date), 2, N'Apt 1491', N'903-313-7512', N'nkerfut3@geocities.com', CAST(N'2010-12-15' AS Date), NULL, NULL, 4, N'', N'Ozu')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (5, NULL, N'Danna', N'', N'Parcell', N'4112', N'295392', CAST(N'2008-01-25' AS Date), 2, N'Suite 28', N'693-114-5860', N'dparcell4@independent.co.uk', CAST(N'2020-12-31' AS Date), NULL, NULL, 5, N'', N'Topiclounge')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (6, NULL, N'Jo', N'', N'Clemencon', N'1560', N'367430', CAST(N'2010-04-14' AS Date), 2, N'16th Floor', N'327-392-7808', N'jclemencon5@1und1.de', CAST(N'2016-12-08' AS Date), NULL, NULL, 6, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (7, NULL, N'Hazlett', N'', N'Cabotto', N'5546', N'187669', CAST(N'2010-02-18' AS Date), 2, N'Suite 23', N'832-505-1994', N'hcabotto6@sun.com', CAST(N'2009-01-16' AS Date), NULL, NULL, 7, N'', N'Jabbercube')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (8, NULL, N'Palm', N'', N'Warhurst', N'8443', N'745724', CAST(N'2007-10-14' AS Date), 2, N'PO Box 30605', N'170-293-7829', N'pwarhurst7@cdbaby.com', CAST(N'2015-04-24' AS Date), NULL, NULL, 8, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (9, NULL, N'Aurlie', N'', N'Heather', N'6340', N'864389', CAST(N'2003-12-12' AS Date), 2, N'Room 1429', N'532-467-5552', N'aheather8@topsy.com', CAST(N'2009-09-16' AS Date), NULL, NULL, 9, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (10, NULL, N'Alphonse', N'', N'Curman', N'1397', N'681919', CAST(N'2004-09-04' AS Date), 1, N'15th Floor', N'515-701-1868', N'acurman9@yelp.com', CAST(N'2006-06-29' AS Date), NULL, NULL, 10, N'', N'Yadel')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (11, NULL, N'Oliver', N'', N'Boord', N'1552', N'160510', CAST(N'2011-04-26' AS Date), 1, N'Suite 23', N'126-428-8072', N'oboorda@furl.net', CAST(N'2005-05-19' AS Date), NULL, NULL, 11, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (12, NULL, N'Sib', N'', N'Ranner', N'1124', N'202263', CAST(N'2006-02-25' AS Date), 2, N'Suite 25', N'104-890-4560', N'srannerb@indiatimes.com', CAST(N'2015-02-11' AS Date), NULL, NULL, 12, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (13, NULL, N'Heall', N'', N'Vasyukhnov', N'3183', N'518505', CAST(N'2006-10-23' AS Date), 1, N'PO Box 37935', N'570-664-0168', N'hvasyukhnovc@mapquest.com', CAST(N'2011-04-27' AS Date), NULL, NULL, 13, N'', N'Centizu')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (14, NULL, N'Bertrando', N'', N'Thorsby', N'6586', N'367085', CAST(N'2007-10-22' AS Date), 1, N'PO Box 90521', N'126-106-3363', N'bthorsbyd@cornell.edu', CAST(N'2022-06-28' AS Date), NULL, NULL, 14, N'', N'Twimm')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (15, NULL, N'Bartlet', N'', N'Picton', N'9946', N'780854', CAST(N'2011-10-15' AS Date), 2, N'3rd Floor', N'495-188-2262', N'bpictone@psu.edu', CAST(N'2006-12-02' AS Date), NULL, NULL, 15, N'', N'Zoomcast')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (16, NULL, N'Chalmers', N'', N'Burkman', N'5524', N'784747', CAST(N'2005-04-23' AS Date), 2, N'Apt 1477', N'295-262-7372', N'cburkmanf@icq.com', CAST(N'2019-02-04' AS Date), NULL, NULL, 16, N'', N'Eadel')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (17, NULL, N'Maureen', N'', N'Koppe', N'2364', N'580649', CAST(N'2003-12-15' AS Date), 1, N'7th Floor', N'124-757-3199', N'mkoppeg@devhub.com', CAST(N'2011-12-08' AS Date), NULL, NULL, 17, N'', N'Oyonder')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (18, NULL, N'Laureen', N'', N'Drance', N'4026', N'131953', CAST(N'2008-03-29' AS Date), 1, N'PO Box 28768', N'619-594-8089', N'ldranceh@usda.gov', CAST(N'2017-07-08' AS Date), NULL, NULL, 18, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (19, NULL, N'Blake', N'', N'Glanert', N'8449', N'208097', CAST(N'2007-12-29' AS Date), 1, N'5th Floor', N'503-833-9064', N'bglanerti@columbia.edu', CAST(N'2009-02-27' AS Date), NULL, NULL, 19, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (20, NULL, N'Margit', N'', N'MacKilroe', N'2134', N'689255', CAST(N'2006-11-20' AS Date), 1, N'19th Floor', N'356-370-7867', N'mmackilroej@multiply.com', CAST(N'2015-10-27' AS Date), NULL, NULL, 20, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (21, NULL, N'Will', N'', N'Fouracres', N'1377', N'172832', CAST(N'2004-02-10' AS Date), 2, N'PO Box 31342', N'314-639-5670', N'wfouracresk@blogs.com', CAST(N'2005-12-20' AS Date), NULL, NULL, 21, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (22, NULL, N'Shaun', N'', N'Splevin', N'5224', N'214894', CAST(N'2004-05-15' AS Date), 1, N'PO Box 93639', N'204-190-2329', N'ssplevinl@senate.gov', CAST(N'2020-03-08' AS Date), NULL, NULL, 22, N'', N'Aivee')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (23, NULL, N'Enrico', N'', N'Skirvane', N'6993', N'898978', CAST(N'2004-08-25' AS Date), 1, N'Suite 45', N'415-706-4489', N'eskirvanem@addtoany.com', CAST(N'2007-02-09' AS Date), NULL, NULL, 23, N'', N'Ntag')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (24, NULL, N'Sephira', N'', N'Durkin', N'3813', N'608172', CAST(N'2011-02-07' AS Date), 2, N'Apt 266', N'361-478-6769', N'sdurkinn@hhs.gov', CAST(N'2017-08-11' AS Date), NULL, NULL, 24, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (25, NULL, N'Ahmed', N'', N'Ilymanov', N'2996', N'692969', CAST(N'2006-07-14' AS Date), 1, N'Suite 89', N'540-132-6782', N'ailymanovo@reverbnation.com', CAST(N'2009-12-15' AS Date), NULL, NULL, 25, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (26, NULL, N'Carlota', N'', N'MacMorland', N'9034', N'108248', CAST(N'2012-01-07' AS Date), 2, N'Room 1268', N'747-149-3956', N'cmacmorlandp@hao123.com', CAST(N'2015-06-19' AS Date), NULL, NULL, 26, N'', N'Eamia')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (27, NULL, N'Branden', N'', N'Southcott', N'4598', N'811797', CAST(N'2006-04-17' AS Date), 1, N'Apt 1687', N'986-746-6254', N'bsouthcottq@independent.co.uk', CAST(N'2009-12-23' AS Date), NULL, NULL, 27, N'', N'Dabjam')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (28, NULL, N'Rafaelita', N'', N'Sumshon', N'1319', N'739184', CAST(N'2008-05-07' AS Date), 2, N'Room 530', N'930-647-0436', N'rsumshonr@spotify.com', CAST(N'2019-12-23' AS Date), NULL, NULL, 28, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (29, NULL, N'Darcey', N'', N'Kingzett', N'5711', N'829770', CAST(N'2010-12-30' AS Date), 1, N'PO Box 36983', N'869-596-7013', N'dkingzetts@disqus.com', CAST(N'2023-03-31' AS Date), NULL, NULL, 29, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (30, NULL, N'Cherianne', N'', N'Leachman', N'1944', N'936180', CAST(N'2007-12-19' AS Date), 1, N'Apt 1618', N'406-137-0964', N'cleachmant@usnews.com', CAST(N'2008-08-18' AS Date), NULL, NULL, 30, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (31, NULL, N'Thorstein', N'', N'Lottrington', N'3017', N'701583', CAST(N'2006-10-03' AS Date), 2, N'Apt 935', N'936-990-6835', N'tlottringtonu@arstechnica.com', CAST(N'2009-09-13' AS Date), NULL, NULL, 31, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (32, NULL, N'Caroljean', N'', N'Moreing', N'8654', N'527368', CAST(N'2004-03-31' AS Date), 2, N'Room 148', N'768-939-7991', N'cmoreingv@microsoft.com', CAST(N'2011-11-06' AS Date), NULL, NULL, 32, N'', N'Mymm')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (33, NULL, N'Alfredo', N'', N'Boyn', N'7159', N'530357', CAST(N'2004-11-19' AS Date), 1, N'5th Floor', N'527-947-1583', N'aboynw@aboutads.info', CAST(N'2008-05-13' AS Date), NULL, NULL, 33, N'', N'Jabbersphere')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (34, NULL, N'Olva', N'', N'Croad', N'3868', N'128161', CAST(N'2004-01-23' AS Date), 2, N'PO Box 91625', N'523-523-8914', N'ocroadx@bing.com', CAST(N'2017-11-24' AS Date), NULL, NULL, 34, N'', N'Kwideo')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (35, NULL, N'Drusilla', N'', N'Elderton', N'8233', N'465412', CAST(N'2004-04-06' AS Date), 2, N'19th Floor', N'480-596-0921', N'deldertony@washingtonpost.com', CAST(N'2017-05-29' AS Date), NULL, NULL, 35, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (36, NULL, N'Rem', N'', N'Macconaghy', N'9778', N'227033', CAST(N'2010-09-30' AS Date), 2, N'Suite 67', N'536-506-2926', N'rmacconaghyz@usgs.gov', CAST(N'2006-04-06' AS Date), NULL, NULL, 36, N'', N'Gabcube')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (37, NULL, N'Faith', N'', N'Riley', N'5874', N'449998', CAST(N'2008-06-20' AS Date), 2, N'Suite 96', N'293-636-8132', N'friley10@army.mil', CAST(N'2022-06-15' AS Date), NULL, NULL, 37, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (38, NULL, N'Panchito', N'', N'Doughtery', N'2615', N'887891', CAST(N'2010-04-02' AS Date), 2, N'17th Floor', N'243-480-8156', N'pdoughtery11@goodreads.com', CAST(N'2017-12-02' AS Date), NULL, NULL, 38, N'', N'Skipstorm')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (39, NULL, N'Sanson', N'', N'Jedrys', N'9042', N'252349', CAST(N'2008-04-22' AS Date), 2, N'Suite 46', N'872-881-1034', N'sjedrys12@baidu.com', CAST(N'2014-11-04' AS Date), NULL, NULL, 39, N'', N'Ooba')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (40, NULL, N'Cynthie', N'', N'Senyard', N'1629', N'736027', CAST(N'2003-11-30' AS Date), 1, N'Room 842', N'125-432-2267', N'csenyard13@washingtonpost.com', CAST(N'2015-02-20' AS Date), NULL, NULL, 40, N'', N'Skibox')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (41, NULL, N'Silvano', N'', N'Lempertz', N'6085', N'280171', CAST(N'2010-01-05' AS Date), 2, N'Suite 80', N'281-999-8522', N'slempertz14@theguardian.com', CAST(N'2015-11-27' AS Date), NULL, NULL, 41, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (42, NULL, N'Misti', N'', N'Sparkwill', N'8030', N'147846', CAST(N'2011-07-07' AS Date), 2, N'11th Floor', N'758-751-9482', N'msparkwill15@go.com', CAST(N'2016-04-27' AS Date), NULL, NULL, 42, N'', N'Dabshots')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (43, NULL, N'Rennie', N'', N'Rapin', N'8995', N'227770', CAST(N'2005-03-10' AS Date), 2, N'19th Floor', N'685-315-6785', N'rrapin16@livejournal.com', CAST(N'2022-12-13' AS Date), NULL, NULL, 43, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (44, NULL, N'Oralie', N'', N'Jay', N'9289', N'138927', CAST(N'2004-11-06' AS Date), 1, N'Suite 38', N'665-666-5976', N'ojay17@wired.com', CAST(N'2018-10-02' AS Date), NULL, NULL, 44, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (45, NULL, N'Archibaldo', N'', N'Colbridge', N'2623', N'355072', CAST(N'2003-06-19' AS Date), 2, N'16th Floor', N'452-947-0162', N'acolbridge18@intel.com', CAST(N'2013-10-20' AS Date), NULL, NULL, 45, N'', N'Livetube')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (46, NULL, N'Timi', N'', N'Arlott', N'6919', N'687742', CAST(N'2011-08-24' AS Date), 2, N'Suite 17', N'706-492-8877', N'tarlott19@joomla.org', CAST(N'2021-03-29' AS Date), NULL, NULL, 46, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (47, NULL, N'Aguistin', N'', N'Toffano', N'3744', N'417752', CAST(N'2005-08-04' AS Date), 1, N'Room 46', N'609-994-5650', N'atoffano1a@java.com', CAST(N'2009-01-23' AS Date), NULL, NULL, 47, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (48, NULL, N'Blakeley', N'', N'Randal', N'9960', N'601845', CAST(N'2006-02-28' AS Date), 2, N'Suite 87', N'668-955-8302', N'brandal1b@symantec.com', CAST(N'2022-05-05' AS Date), NULL, NULL, 48, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (49, NULL, N'Bennie', N'', N'Eyree', N'4574', N'564368', CAST(N'2007-01-26' AS Date), 2, N'Apt 1246', N'882-225-1325', N'beyree1c@indiegogo.com', CAST(N'2015-06-19' AS Date), NULL, NULL, 49, N'', N'Zoombeat')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (50, NULL, N'Micky', N'', N'Caiger', N'3624', N'435773', CAST(N'2009-03-19' AS Date), 1, N'13th Floor', N'726-603-3650', N'mcaiger1d@webs.com', CAST(N'2013-01-03' AS Date), NULL, NULL, 50, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (51, NULL, N'Simone', N'', N'Cocci', N'5653', N'109393', CAST(N'2005-05-20' AS Date), 2, N'11th Floor', N'335-895-2478', N'scocci1e@columbia.edu', CAST(N'2008-05-27' AS Date), NULL, NULL, 51, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (52, NULL, N'Layne', N'', N'Weetch', N'3469', N'493362', CAST(N'2009-05-10' AS Date), 1, N'Room 43', N'621-196-3003', N'lweetch1f@springer.com', CAST(N'2012-10-19' AS Date), NULL, NULL, 52, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (53, NULL, N'Maurene', N'', N'Hatterslay', N'4382', N'110027', CAST(N'2009-11-10' AS Date), 1, N'Apt 793', N'820-658-1193', N'mhatterslay1g@disqus.com', CAST(N'2015-04-21' AS Date), NULL, NULL, 53, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (54, NULL, N'Kathrine', N'', N'Buttery', N'5400', N'643937', CAST(N'2005-01-17' AS Date), 2, N'Apt 104', N'726-972-9844', N'kbuttery1h@netvibes.com', CAST(N'2022-10-26' AS Date), NULL, NULL, 54, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (55, NULL, N'Noby', N'', N'Moorman', N'3628', N'377816', CAST(N'2011-01-09' AS Date), 2, N'Suite 66', N'735-863-1420', N'nmoorman1i@t.co', CAST(N'2009-06-05' AS Date), NULL, NULL, 55, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (56, NULL, N'Ewell', N'', N'Blaycock', N'8655', N'590458', CAST(N'2007-12-19' AS Date), 1, N'Suite 64', N'472-110-4337', N'eblaycock1j@chron.com', CAST(N'2013-01-20' AS Date), NULL, NULL, 56, N'', N'Shufflebeat')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (57, NULL, N'Reeva', N'', N'Danielczyk', N'9773', N'888547', CAST(N'2009-05-23' AS Date), 1, N'13th Floor', N'874-364-7057', N'rdanielczyk1k@usatoday.com', CAST(N'2021-06-22' AS Date), NULL, NULL, 57, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (58, NULL, N'Bealle', N'', N'St Leger', N'1817', N'264931', CAST(N'2009-09-09' AS Date), 1, N'PO Box 55571', N'499-612-2800', N'bstleger1l@examiner.com', CAST(N'2013-02-04' AS Date), NULL, NULL, 58, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (59, NULL, N'Emlyn', N'', N'Bawden', N'6719', N'481429', CAST(N'2010-08-04' AS Date), 1, N'8th Floor', N'441-372-3178', N'ebawden1m@army.mil', CAST(N'2023-11-07' AS Date), NULL, NULL, 59, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (60, NULL, N'Dacia', N'', N'Joubert', N'3399', N'517724', CAST(N'2007-01-22' AS Date), 2, N'5th Floor', N'582-975-5975', N'djoubert1n@youtube.com', CAST(N'2017-11-13' AS Date), NULL, NULL, 60, N'', N'Topicshots')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (61, NULL, N'Brent', N'', N'Vondrak', N'8121', N'626136', CAST(N'2007-01-23' AS Date), 1, N'Room 938', N'576-130-3891', N'bvondrak1o@shareasale.com', CAST(N'2023-09-06' AS Date), NULL, NULL, 61, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (62, NULL, N'Radcliffe', N'', N'Lacy', N'1072', N'569936', CAST(N'2010-01-29' AS Date), 1, N'5th Floor', N'223-173-2221', N'rlacy1p@addtoany.com', CAST(N'2008-01-02' AS Date), NULL, NULL, 62, N'', N'Voonte')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (63, NULL, N'Faustine', N'', N'McJury', N'7320', N'491114', CAST(N'2010-05-02' AS Date), 2, N'9th Floor', N'917-605-8213', N'fmcjury1q@cam.ac.uk', CAST(N'2013-02-16' AS Date), NULL, NULL, 63, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (64, NULL, N'Cherie', N'', N'Stegers', N'6985', N'824894', CAST(N'2011-11-18' AS Date), 2, N'2nd Floor', N'453-762-1761', N'cstegers1r@stanford.edu', CAST(N'2020-06-16' AS Date), NULL, NULL, 64, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (65, NULL, N'Bordy', N'', N'Annandale', N'6111', N'404998', CAST(N'2006-07-26' AS Date), 1, N'PO Box 815', N'883-871-9056', N'bannandale1s@exblog.jp', CAST(N'2008-05-22' AS Date), NULL, NULL, 65, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (66, NULL, N'Buddie', N'', N'Macbeth', N'9134', N'531876', CAST(N'2003-04-20' AS Date), 1, N'Suite 4', N'920-250-1939', N'bmacbeth1t@webmd.com', CAST(N'2007-04-22' AS Date), NULL, NULL, 66, N'', N'LiveZ')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (67, NULL, N'Margo', N'', N'Bobasch', N'6587', N'918419', CAST(N'2009-01-15' AS Date), 2, N'Apt 525', N'745-835-8773', N'mbobasch1u@mozilla.org', CAST(N'2014-12-03' AS Date), NULL, NULL, 67, N'', N'Kwilith')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (68, NULL, N'Molly', N'', N'Feedham', N'6203', N'146808', CAST(N'2006-07-19' AS Date), 2, N'19th Floor', N'329-118-7629', N'mfeedham1v@dell.com', CAST(N'2020-03-19' AS Date), NULL, NULL, 68, N'', N'Meembee')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (69, NULL, N'Rheba', N'', N'Gotfrey', N'7391', N'308273', CAST(N'2003-11-20' AS Date), 2, N'14th Floor', N'923-744-5677', N'rgotfrey1w@stumbleupon.com', CAST(N'2006-05-11' AS Date), NULL, NULL, 69, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (70, NULL, N'Valene', N'', N'Oganesian', N'5487', N'154419', CAST(N'2008-05-29' AS Date), 2, N'Room 415', N'491-760-4600', N'voganesian1x@marriott.com', CAST(N'2011-05-28' AS Date), NULL, NULL, 70, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (71, NULL, N'Harrie', N'', N'Johnston', N'5655', N'640308', CAST(N'2011-02-27' AS Date), 2, N'Apt 265', N'231-819-3361', N'hjohnston1y@examiner.com', CAST(N'2005-08-23' AS Date), NULL, NULL, 71, N'', N'Yacero')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (72, NULL, N'Julie', N'', N'Fetherstan', N'2484', N'559349', CAST(N'2007-03-06' AS Date), 2, N'Room 1735', N'531-749-6716', N'jfetherstan1z@angelfire.com', CAST(N'2020-07-21' AS Date), NULL, NULL, 72, N'', N'Dazzlesphere')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (73, NULL, N'Shayne', N'', N'Espinoy', N'2514', N'205607', CAST(N'2005-05-22' AS Date), 2, N'PO Box 61246', N'681-643-6671', N'sespinoy20@prnewswire.com', CAST(N'2020-12-13' AS Date), NULL, NULL, 73, N'', N'Quinu')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (74, NULL, N'Alicea', N'', N'Hatliff', N'1648', N'613825', CAST(N'2006-03-13' AS Date), 1, N'10th Floor', N'435-370-5498', N'ahatliff21@cargocollective.com', CAST(N'2023-02-15' AS Date), NULL, NULL, 74, N'', N'Flashdog')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (75, NULL, N'Gaylor', N'', N'Lowensohn', N'4003', N'425759', CAST(N'2009-05-05' AS Date), 1, N'Apt 772', N'108-743-0032', N'glowensohn22@nationalgeographic.com', CAST(N'2009-09-14' AS Date), NULL, NULL, 75, N'', N'Reallinks')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (76, NULL, N'Sherill', N'', N'Leadley', N'2243', N'961941', CAST(N'2011-07-22' AS Date), 1, N'Suite 36', N'404-316-4319', N'sleadley23@moonfruit.com', CAST(N'2012-12-23' AS Date), NULL, NULL, 76, N'', N'Shuffledrive')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (77, NULL, N'Garwin', N'', N'Baudasso', N'5852', N'885634', CAST(N'2006-12-25' AS Date), 2, N'Apt 1487', N'343-318-8483', N'gbaudasso24@imgur.com', CAST(N'2020-04-20' AS Date), NULL, NULL, 77, N'', N'Podcat')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (78, NULL, N'Cassandry', N'', N'Peller', N'8095', N'372712', CAST(N'2008-02-07' AS Date), 1, N'13th Floor', N'821-311-3744', N'cpeller25@hhs.gov', CAST(N'2015-10-18' AS Date), NULL, NULL, 78, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (79, NULL, N'Bari', N'', N'Lamperti', N'6974', N'460987', CAST(N'2007-10-03' AS Date), 2, N'Apt 1383', N'783-623-8695', N'blamperti26@arstechnica.com', CAST(N'2006-04-10' AS Date), NULL, NULL, 79, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (80, NULL, N'Rodolph', N'', N'Urlich', N'7163', N'476754', CAST(N'2009-06-24' AS Date), 2, N'Suite 2', N'786-641-0712', N'rurlich27@xrea.com', CAST(N'2012-01-30' AS Date), NULL, NULL, 80, N'', N'Gigashots')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (81, NULL, N'Flo', N'', N'Dudeney', N'3788', N'788745', CAST(N'2008-07-19' AS Date), 1, N'PO Box 73383', N'238-448-8719', N'fdudeney28@slideshare.net', CAST(N'2016-11-15' AS Date), NULL, NULL, 81, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (82, NULL, N'Jannel', N'', N'Amoss', N'2196', N'876112', CAST(N'2006-06-02' AS Date), 2, N'Apt 1833', N'190-967-1195', N'jamoss29@dedecms.com', CAST(N'2010-01-17' AS Date), NULL, NULL, 82, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (83, NULL, N'Leah', N'', N'Bulbrook', N'7831', N'667673', CAST(N'2007-08-11' AS Date), 2, N'Apt 687', N'722-218-4155', N'lbulbrook2a@usda.gov', CAST(N'2006-08-24' AS Date), NULL, NULL, 83, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (84, NULL, N'Cassius', N'', N'Djuricic', N'6919', N'726081', CAST(N'2010-01-14' AS Date), 2, N'PO Box 15549', N'699-677-3831', N'cdjuricic2b@paypal.com', CAST(N'2014-10-23' AS Date), NULL, NULL, 84, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (85, NULL, N'Modesta', N'', N'Van Waadenburg', N'7521', N'816115', CAST(N'2007-04-07' AS Date), 2, N'Apt 166', N'682-687-2952', N'mvanwaadenburg2c@skype.com', CAST(N'2022-02-12' AS Date), NULL, NULL, 85, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (86, NULL, N'Stanleigh', N'', N'Jewsbury', N'6903', N'954147', CAST(N'2003-03-11' AS Date), 2, N'Apt 1772', N'375-169-1733', N'sjewsbury2d@usa.gov', CAST(N'2018-02-24' AS Date), NULL, NULL, 86, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (87, NULL, N'Hermon', N'', N'Tayt', N'1465', N'665688', CAST(N'2006-03-29' AS Date), 2, N'19th Floor', N'460-468-9354', N'htayt2e@ibm.com', CAST(N'2013-09-12' AS Date), NULL, NULL, 87, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (88, NULL, N'Kathy', N'', N'O''Cosgra', N'8059', N'305635', CAST(N'2008-08-18' AS Date), 1, N'Room 770', N'267-792-3751', N'kocosgra2f@xrea.com', CAST(N'2021-01-03' AS Date), NULL, NULL, 88, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (89, NULL, N'Emera', N'', N'Jerman', N'4364', N'585212', CAST(N'2005-03-28' AS Date), 1, N'16th Floor', N'922-763-9262', N'ejerman2g@economist.com', CAST(N'2020-09-17' AS Date), NULL, NULL, 89, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (90, NULL, N'Estrellita', N'', N'Jukes', N'7502', N'128562', CAST(N'2009-12-10' AS Date), 1, N'Room 731', N'637-870-7764', N'ejukes2h@slate.com', CAST(N'2005-12-21' AS Date), NULL, NULL, 90, N'', N'Browsebug')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (91, NULL, N'Willard', N'', N'Eicheler', N'1723', N'648127', CAST(N'2010-03-02' AS Date), 2, N'Room 616', N'452-507-7900', N'weicheler2i@nasa.gov', CAST(N'2014-09-10' AS Date), NULL, NULL, 91, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (92, NULL, N'Stanfield', N'', N'Boldry', N'3782', N'550747', CAST(N'2010-06-15' AS Date), 1, N'2nd Floor', N'127-787-3607', N'sboldry2j@liveinternet.ru', CAST(N'2008-02-17' AS Date), NULL, NULL, 92, N'', N'Kayveo')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (93, NULL, N'Alfonse', N'', N'Ciardo', N'7898', N'862452', CAST(N'2004-08-30' AS Date), 1, N'15th Floor', N'536-202-6882', N'aciardo2k@goo.ne.jp', CAST(N'2005-06-04' AS Date), NULL, NULL, 93, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (94, NULL, N'Lorain', N'', N'Oubridge', N'6447', N'458833', CAST(N'2007-01-31' AS Date), 2, N'1st Floor', N'969-907-0698', N'loubridge2l@phoca.cz', CAST(N'2020-08-26' AS Date), NULL, NULL, 94, N'', N'Jazzy')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (95, NULL, N'Natal', N'', N'Alltimes', N'8274', N'898596', CAST(N'2007-05-15' AS Date), 2, N'Suite 7', N'855-148-9520', N'nalltimes2m@huffingtonpost.com', CAST(N'2017-12-31' AS Date), NULL, NULL, 95, N'', N'Roomm')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (96, NULL, N'Colly', N'', N'Nerheny', N'6873', N'807703', CAST(N'2008-04-07' AS Date), 1, N'Apt 1936', N'503-920-6928', N'cnerheny2n@usnews.com', CAST(N'2008-07-21' AS Date), NULL, NULL, 96, N'', N'Meeveo')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (97, NULL, N'Livvy', N'', N'Pasek', N'1376', N'499368', CAST(N'2004-12-06' AS Date), 2, N'8th Floor', N'880-642-7128', N'lpasek2o@ebay.co.uk', CAST(N'2015-11-20' AS Date), NULL, NULL, 97, N'', N'Dabshots')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (98, NULL, N'Cart', N'', N'Sinnock', N'7551', N'861483', CAST(N'2004-06-26' AS Date), 2, N'Room 1229', N'974-884-0052', N'csinnock2p@ow.ly', CAST(N'2016-03-24' AS Date), NULL, NULL, 98, N'', N'')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (99, NULL, N'Effie', N'', N'Broun', N'7076', N'771128', CAST(N'2007-01-07' AS Date), 1, N'Room 1588', N'641-825-9219', N'ebroun2q@statcounter.com', CAST(N'2008-11-15' AS Date), NULL, NULL, 99, N'', N'Eazzy')
GO
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (100, NULL, N'Xylia', N'', N'Mac Giany', N'2533', N'630746', CAST(N'2008-10-22' AS Date), 1, N'PO Box 74688', N'282-521-7573', N'xmacgiany2r@liveinternet.ru', CAST(N'2017-04-08' AS Date), NULL, NULL, 100, N'', N'Brainbox')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (105, NULL, N'Имя', N'Фамилия', N'Отчество', N'', N'', CAST(N'2022-02-28' AS Date), 1, N'', N'89841956797', NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, N'История', NULL)
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (9999, 0x89504E470D0A1A0A0000000D494844520000005500000055080600000038F5A85A000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8640000049C49444154785EED90D18AE4381004F7FF7F7AB6BCF8400E250E17B27AEEA103A20595A992E93FC5CF272596AFC2FDBB3DDFCCE12E89E5AB70FF6ECF3773B84B62F92ADCBFDBF3CD1CEE9258BE0AF7EFF67C731EBE89ED67BE2AB17C95B4BFCE79F826B69FF9AAC4F255D2FE3AE7E19BD87EE6AB12CB5749FBEB9C876F62FB99AF4A2C5F25EDAF731E8E303789E5847DDAC5EE333749CAEB9C8723CC4D6239619F76B1FBCC4D92F23AE7E1087393584ED8A75DEC3E7393A4BCCE7938C2DC249613F66917BBCFDC2429AF731E8E3037C96A6ED8FD6E6E9294D7390F47989B643537EC7E373749CAEB9C8723CC4DB29A1B76BF9B9B24E575CEC311E62659CD0DBBDFCD4D92F23AE7E1087393584EAC6F39B13E7393A4BCCE7938C2DC249613EB5B4EACCFDC2429AF731E8E303789E5C4FA9613EB333749CAEB9C8723CC4D6239B1BEE5C4FACC4D92F23AE7E19B74F75B9F392596AF92F6D7390FDFA4BBDFFACC29B17C95B4BFCE79F826DDFDD6674E89E5ABA4FD75CEC337E9EEB73E734A2C5F25EDAFF33ADC2DF974BEDBF3CD1CEE927C3ADFEDF9660E77493E9DEFF67C3387BB249FCE77FBEFCD7FBFBF48FAA811E6E6FF81EF9FBA81EF9FBA81EF9FBA81FA8EFB8F624E49EADC49BA39259613EB33A767671E8E30A72475EE24DD9C12CB89F599D3B3330F479853923A77926E4E89E5C4FACCE9D9998723CC29499D3B4937A7C472627DE6F4ECE4F03F8D746794A4CE2735BAFD44DDBB2EA146BA334A52E7931ADD7EA2EE5D975023DD1925A9F3498D6E3F51F7AE4BA891EE8C92D4F9A446B79FA87BD7255D49EA8C1AD6B77C15EEA724E5755E875D49EA8C1AD6B77C15EEA724E5755E875D49EA8C1AD6B77C15EEA724E5755E875D49EA8C1AD6B77C15EEA724E5538BA5AE46BAB3A291EEACF884EF9FDAF409DF3FB5E913BE7F6AD327682B2DBE93A4CE8AC472B2BB7FA02D2E3549EAAC482C27BBFB07DAE25293A4CE8AC472B2BB7FA02D2E3549EAAC482C27BBFB07CF5A1BE97EF46FF72D3FF05736F3E423477EBB6FF981BFB299271F39F2DB7DCB0FFC95CD3CF9C891DFEE5B7E50F36B69B724755634ACBF9A1FD4FC5ADA2D499D150DEBAFE60735BF96764B526745C3FAABF941CDAFA5DD92D459D1B0FE6A7E50732FAD60FB99D3B7496F8C92D4194DD4DC4B2BD87EE6F46DD21BA32475461335F7D20AB69F397D9BF4C628499DD144CDBDB482ED674EDF26BD314A52673451F3FB127393584ED8A7247556EC92EED7390F47989BC472C23E25A9B3629774BFCE7938C2DC249613F629499D15BBA4FB75CEC311E626B19CB04F49EAACD825DDAF731E8E30374937A7C472C2FEDB266A7E5F626E926E4E89E584FDB74DD4FCBEC4DC24DD9C12CB09FB6F9BA8F97D89B949BA39259613F6DF3651F3FB12739374736A589F39DD41EDBD7F84B949BA3935ACCF9CEEA0F6DE3FC2DC24DD9C1AD6674E77507BEF1F616E926E4E0DEB33A73BA8BD7B1FE9EE679F1AD6B79C583FE575CEC337E9EE679F1AD6B79C583FE575CEC337E9EE679F1AD6B79C583FE575CEC337E9EE679F1AD6B79C583FE5755E87BB25A933DAA57BBFDB7F42EDB92EDD2D499DD12EDDFBDDFE136ACF75E96E49EA8C76E9DEEFF69F507BAE4B774B5267B44BF77EB7FF8477B67C19F8F9F90B7999C2F990CC855F0000000049454E44AE426082, N'Анастасия', N'Воронова', N'Александровна', N'7777', N'326246', CAST(N'0001-01-01' AS Date), 2, N'111111111111', N'+79241385865', N'a1nanana@mail.ru', CAST(N'0001-01-01' AS Date), NULL, NULL, 102, NULL, N'OOO Мягкие носочки')
INSERT [dbo].[Patient] ([MedicCardCode], [Photo], [FirstName], [LastName], [Patronymic], [PasportSries], [PasportNumber], [Birthday], [GenderId], [Address], [PhoneNumber], [Email], [DateMedicCardGet], [DateLastVisit], [DateNextVisit], [InsuransyPolisyId], [History], [WorkPlace]) VALUES (676865, 0x89504E470D0A1A0A0000000D494844520000005500000055080600000038F5A85A000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000004C249444154785EED90D16A04470C04F3FF3FEDC8C73EC835CDD689D9F125E082F280BAA53DFC4FF1F59B4E4937BA46DA39E9F5CD1C9E724ABAD135D2CE49AF6FE6F09453D28DAE91764E7A7D3387A79C926E748DB473D2EB9BEBF04976EFDBFE6EBE4BBA5FEF3A7C92DDFBB6BF9BEF92EED7BB0E9F64F7BEEDEFE6BBA4FBF5AEC327D9BD6FFBBBF92EE97EBDEBB0C3DC249613F64DC3FACC4D92F27AD76187B9492C27EC9B86F5999B24E5F5AEC30E7393584ED8370DEB333749CAEB5D871DE626B19CB06F1AD6676E9294D7BB0E3BCC4D62B961FB4FE7264979BDEBB0C3DC24961BB6FF746E9294D7BB0E3BCC4D62B961FB4FE7264979BDEBB0C3DC24961BB6FF746E9294D7BB0E3BCC4D62F914DEA3649A9B24E5F5AEC30E7393583E85F72899E6264979BDEBB0C3DC24964FE13D4AA6B949525EEF3AEC303789E553788F92696E9294D7BB0E9FC4EEEFE6C6EEBE91EED7BB0E9FC4EEEFE6C6EEBE91EED7BB0E9FC4EEEFE6C6EEBE91EED7BB0E9FC4EEEFE6C6EEBE91EED7FB73785AF2DBF969AF6FE6F094E4B7F3D35EDFCCE129C96FE7A7BDBE99C35392DFCE4FFBFAE6EBEF7F88F443BBFF07FEFEA907F8FBA71EE0EF9F7A80FA9DB31F6D7DE694A44E97A4CE9DC4F227A8BBB38F589F3925A9D325A97327B1FC09EAEEEC23D6674E49EA7449EADC492C7F82BA3BFB88F59953923A5D923A7712CB9F60B9BAFB51DB674E49EA74C9E99CA4FEB2954A136C9F3925A9D325A77392FACB562A4DB07DE694A44E979CCE49EA2F5BA934C1F69953923A5D723A27A95FEF3ABCE3D37DCB09FBA69176BA57671DDEF1E9BEE5847DD3483BDDABB30EEFF874DF72C2BE69A49DEED55987777CBA6F3961DF34D24EF7EAACC33BAC3FCD2999E6BB4E49FBF5AEC33BAC3FCD2999E6BB4E49FBF5AEC33BAC3FCD2999E6BB4E49FBF5AEC33BAC3FCD2999E6BB4E49FBF5FE1C4E25A93391A44E97A4CE9DC47292FAF5FE1C4E25A93391A44E97A4CE9DC47292FAF5FE1C4E25A93391A44E97A4CE9DC47292FAF5FE1C4E25A93391A44E97A4CE9DC47292FABE7518FE283A25DDE812CB09FBF4D579FDFD20E98775A7A41B5D6239619FBE3AAFBF1F24FDB0EE9474A34B2C27ECD357E7F5F783A41FD69D926E7489E5847D7A757278CA29E9C69D649A9BEF50BDBC7CCA29E9C69D649A9BEF50BDBC7CCA29E9C69D649A9BEF50BDBC7CCA29E9C69D649A9BEF50BDF9D204BBCFDC9C32DDB7BEE5DFD4DC4B3BD87DE6E694E9BEF52DFFA6E65EDAC1EE3337A74CF7AD6FF93735F7D20E769FB93965BA6F7DCBBFA9F97D89B9492CDF85F74DE3897EBDEBB0C3DC2496EFC2FBA6F144BFDE75D8616E12CB77E17DD378A25FEF3AEC303789E5BBF0BE693CD1AF771D76989B649A9B46DAB9934C737A75D66187B949A6B969A49D3BC934A757671D76989B649A9B46DAB9934C737A75D66187B949A6B969A49D3BC934A757671D76989BC4F229768FB969583FE5F5AEC30E7393583EC5EE31370DEBA7BCDE75D8616E12CBA7D83DE6A661FD94D7BB0E3BCC4D62F914BBC7DC34AC9FF27AD7E193ECDEE7BE6958DFF277A8BDFD2377ECDEE7BE6958DFF277A8BDFD2377ECDEE7BE6958DFF277A8BDFD2377ECDEE7BE6958DFF277A8BD9F474E4B52A73BC5F6A7B999A8792E9F92A44E778AED4F733351F35C3E25499DEE14DB9FE666A2E6B97C4A923ADD29B63FCDCDC4FC57FF217C7DFD0B9BD94197C7BB19130000000049454E44AE426082, N'Ana', N'Alexa', N'qqqqqqqqqq', N'7777', N'123456', CAST(N'0001-01-01' AS Date), 1, N'111111111111', N'1234567', NULL, CAST(N'2024-03-01' AS Date), NULL, NULL, 101, NULL, N'12')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Сотрудник регистратуры')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Главный врач')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([Id], [DoctorId], [StartTimeDay], [EndTimeDay], [Archive], [Approval], [Date], [TimeGaps]) VALUES (126, 1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, NULL, CAST(N'2024-03-17' AS Date), 15)
INSERT [dbo].[Schedule] ([Id], [DoctorId], [StartTimeDay], [EndTimeDay], [Archive], [Approval], [Date], [TimeGaps]) VALUES (127, 1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, 1, CAST(N'2024-03-17' AS Date), 15)
INSERT [dbo].[Schedule] ([Id], [DoctorId], [StartTimeDay], [EndTimeDay], [Archive], [Approval], [Date], [TimeGaps]) VALUES (128, 1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, 1, CAST(N'2024-03-11' AS Date), 20)
INSERT [dbo].[Schedule] ([Id], [DoctorId], [StartTimeDay], [EndTimeDay], [Archive], [Approval], [Date], [TimeGaps]) VALUES (129, 2, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, 1, CAST(N'2024-03-10' AS Date), 20)
INSERT [dbo].[Schedule] ([Id], [DoctorId], [StartTimeDay], [EndTimeDay], [Archive], [Approval], [Date], [TimeGaps]) VALUES (130, 1, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time), 1, 1, CAST(N'2024-03-15' AS Date), 10)
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[TableTime] ON 

INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (7, CAST(N'08:00:00' AS Time), CAST(N'08:15:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (8, CAST(N'08:15:00' AS Time), CAST(N'08:30:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (9, CAST(N'08:30:00' AS Time), CAST(N'08:45:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (10, CAST(N'08:45:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (11, CAST(N'09:00:00' AS Time), CAST(N'09:15:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (12, CAST(N'09:15:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (13, CAST(N'09:30:00' AS Time), CAST(N'09:45:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (14, CAST(N'09:45:00' AS Time), CAST(N'10:00:00' AS Time), NULL, NULL, 126)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (15, CAST(N'08:00:00' AS Time), CAST(N'08:15:00' AS Time), NULL, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (16, CAST(N'08:15:00' AS Time), CAST(N'08:30:00' AS Time), 10, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (17, CAST(N'08:30:00' AS Time), CAST(N'08:45:00' AS Time), 0, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (18, CAST(N'08:45:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (19, CAST(N'09:00:00' AS Time), CAST(N'09:15:00' AS Time), NULL, 1, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (20, CAST(N'09:15:00' AS Time), CAST(N'09:30:00' AS Time), NULL, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (21, CAST(N'09:30:00' AS Time), CAST(N'09:45:00' AS Time), 6, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (22, CAST(N'09:45:00' AS Time), CAST(N'10:00:00' AS Time), NULL, NULL, 127)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (23, CAST(N'08:00:00' AS Time), CAST(N'08:20:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (24, CAST(N'08:20:00' AS Time), CAST(N'08:40:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (25, CAST(N'08:40:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (26, CAST(N'09:00:00' AS Time), CAST(N'09:20:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (27, CAST(N'09:20:00' AS Time), CAST(N'09:40:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (28, CAST(N'09:40:00' AS Time), CAST(N'10:00:00' AS Time), NULL, NULL, 128)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (29, CAST(N'10:00:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (30, CAST(N'10:20:00' AS Time), CAST(N'10:40:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (31, CAST(N'10:40:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (32, CAST(N'11:00:00' AS Time), CAST(N'11:20:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (33, CAST(N'11:20:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (34, CAST(N'11:40:00' AS Time), CAST(N'12:00:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (35, CAST(N'12:00:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (36, CAST(N'12:20:00' AS Time), CAST(N'12:40:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (37, CAST(N'12:40:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (38, CAST(N'13:00:00' AS Time), CAST(N'13:20:00' AS Time), 6, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (39, CAST(N'13:20:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (40, CAST(N'13:40:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, 129)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (56, CAST(N'10:00:00' AS Time), CAST(N'10:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (57, CAST(N'10:10:00' AS Time), CAST(N'10:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (58, CAST(N'10:20:00' AS Time), CAST(N'10:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (59, CAST(N'10:30:00' AS Time), CAST(N'10:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (60, CAST(N'10:40:00' AS Time), CAST(N'10:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (61, CAST(N'10:50:00' AS Time), CAST(N'11:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (62, CAST(N'11:00:00' AS Time), CAST(N'11:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (63, CAST(N'11:10:00' AS Time), CAST(N'11:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (64, CAST(N'11:20:00' AS Time), CAST(N'11:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (65, CAST(N'11:30:00' AS Time), CAST(N'11:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (66, CAST(N'11:40:00' AS Time), CAST(N'11:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (67, CAST(N'11:50:00' AS Time), CAST(N'12:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (68, CAST(N'12:00:00' AS Time), CAST(N'12:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (69, CAST(N'12:10:00' AS Time), CAST(N'12:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (70, CAST(N'12:20:00' AS Time), CAST(N'12:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (71, CAST(N'12:30:00' AS Time), CAST(N'12:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (72, CAST(N'12:40:00' AS Time), CAST(N'12:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (73, CAST(N'12:50:00' AS Time), CAST(N'13:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (74, CAST(N'13:00:00' AS Time), CAST(N'13:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (75, CAST(N'13:10:00' AS Time), CAST(N'13:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (76, CAST(N'13:20:00' AS Time), CAST(N'13:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (77, CAST(N'13:30:00' AS Time), CAST(N'13:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (78, CAST(N'13:40:00' AS Time), CAST(N'13:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (79, CAST(N'13:50:00' AS Time), CAST(N'14:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (80, CAST(N'14:00:00' AS Time), CAST(N'14:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (81, CAST(N'14:10:00' AS Time), CAST(N'14:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (82, CAST(N'14:20:00' AS Time), CAST(N'14:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (83, CAST(N'14:30:00' AS Time), CAST(N'14:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (84, CAST(N'14:40:00' AS Time), CAST(N'14:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (85, CAST(N'14:50:00' AS Time), CAST(N'15:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (86, CAST(N'15:00:00' AS Time), CAST(N'15:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (87, CAST(N'15:10:00' AS Time), CAST(N'15:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (88, CAST(N'15:20:00' AS Time), CAST(N'15:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (89, CAST(N'15:30:00' AS Time), CAST(N'15:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (90, CAST(N'15:40:00' AS Time), CAST(N'15:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (91, CAST(N'15:50:00' AS Time), CAST(N'16:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (92, CAST(N'16:00:00' AS Time), CAST(N'16:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (93, CAST(N'16:10:00' AS Time), CAST(N'16:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (94, CAST(N'16:20:00' AS Time), CAST(N'16:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (95, CAST(N'16:30:00' AS Time), CAST(N'16:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (96, CAST(N'16:40:00' AS Time), CAST(N'16:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (97, CAST(N'16:50:00' AS Time), CAST(N'17:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (98, CAST(N'17:00:00' AS Time), CAST(N'17:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (99, CAST(N'17:10:00' AS Time), CAST(N'17:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (100, CAST(N'17:20:00' AS Time), CAST(N'17:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (101, CAST(N'17:30:00' AS Time), CAST(N'17:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (102, CAST(N'17:40:00' AS Time), CAST(N'17:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (103, CAST(N'17:50:00' AS Time), CAST(N'18:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (104, CAST(N'18:00:00' AS Time), CAST(N'18:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (105, CAST(N'18:10:00' AS Time), CAST(N'18:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (106, CAST(N'18:20:00' AS Time), CAST(N'18:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (107, CAST(N'18:30:00' AS Time), CAST(N'18:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (108, CAST(N'18:40:00' AS Time), CAST(N'18:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (109, CAST(N'18:50:00' AS Time), CAST(N'19:00:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (110, CAST(N'19:00:00' AS Time), CAST(N'19:10:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (111, CAST(N'19:10:00' AS Time), CAST(N'19:20:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (112, CAST(N'19:20:00' AS Time), CAST(N'19:30:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (113, CAST(N'19:30:00' AS Time), CAST(N'19:40:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (114, CAST(N'19:40:00' AS Time), CAST(N'19:50:00' AS Time), NULL, NULL, 130)
INSERT [dbo].[TableTime] ([Id], [TimeStartGaps], [TimeEndGaps], [PatientMediccardCode], [SpecialEvent], [ScheduleId]) VALUES (115, CAST(N'19:50:00' AS Time), CAST(N'20:00:00' AS Time), NULL, NULL, 130)
SET IDENTITY_INSERT [dbo].[TableTime] OFF
GO
SET IDENTITY_INSERT [dbo].[TherapeuticDiagnostic] ON 

INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (1, 55, 1, 1, N'amet turpis', N'', N'', CAST(898.09 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (2, 15, 2, 2, N'id lobortis', N'', N'', CAST(553.24 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (3, 56, 3, 3, N'est donec', N'', N'', CAST(761.72 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (4, 91, 4, 1, N'odio odio', N'', N'', CAST(815.63 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (5, 99, 5, 2, N'eu mi nulla', N'', N'', CAST(660.37 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (6, 93, 6, 1, N'velit nec', N'', N'', CAST(899.12 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (7, 67, 7, 1, N'integer ac', N'', N'', CAST(546.93 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (8, 42, 8, 1, N'lobortis est phasellus', N'', N'', CAST(541.68 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (9, 51, 9, 1, N'congue diam id', N'', N'', CAST(615.87 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (10, 98, 10, 1, N'turpis donec posuere metus vitae', N'', N'', CAST(536.09 AS Decimal(18, 2)))
INSERT [dbo].[TherapeuticDiagnostic] ([Id], [MedicCardCode], [DoctorId], [TypeId], [Name], [Rezult], [Recommendation], [Cost]) VALUES (11, 61, 2, 1, N'pretium iaculis', N'', N'', CAST(729.67 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TherapeuticDiagnostic] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeTable] ON 

INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (244, 6, CAST(N'00:00:00' AS Time), CAST(N'00:10:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (245, 6, CAST(N'00:10:00' AS Time), CAST(N'00:20:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (246, 6, CAST(N'00:20:00' AS Time), CAST(N'00:30:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (247, 6, CAST(N'00:30:00' AS Time), CAST(N'00:40:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (248, 6, CAST(N'00:40:00' AS Time), CAST(N'00:50:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (249, 6, CAST(N'00:50:00' AS Time), CAST(N'01:00:00' AS Time), NULL, 1, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (250, 6, CAST(N'01:00:00' AS Time), CAST(N'01:10:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (251, 6, CAST(N'01:10:00' AS Time), CAST(N'01:20:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (252, 6, CAST(N'01:20:00' AS Time), CAST(N'01:30:00' AS Time), NULL, 1, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (253, 6, CAST(N'01:30:00' AS Time), CAST(N'01:40:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (254, 6, CAST(N'01:40:00' AS Time), CAST(N'01:50:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (255, 6, CAST(N'01:50:00' AS Time), CAST(N'02:00:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (256, 6, CAST(N'02:00:00' AS Time), CAST(N'02:10:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (257, 6, CAST(N'02:10:00' AS Time), CAST(N'02:20:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (258, 6, CAST(N'02:20:00' AS Time), CAST(N'02:30:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (259, 6, CAST(N'02:30:00' AS Time), CAST(N'02:40:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (260, 6, CAST(N'02:40:00' AS Time), CAST(N'02:50:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (261, 6, CAST(N'02:50:00' AS Time), CAST(N'03:00:00' AS Time), NULL, NULL, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (262, 6, CAST(N'00:00:00' AS Time), CAST(N'00:10:00' AS Time), NULL, 1, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (263, 6, CAST(N'00:10:00' AS Time), CAST(N'00:20:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (264, 6, CAST(N'00:20:00' AS Time), CAST(N'00:30:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (265, 6, CAST(N'00:30:00' AS Time), CAST(N'00:40:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (266, 6, CAST(N'00:40:00' AS Time), CAST(N'00:50:00' AS Time), NULL, 1, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (267, 6, CAST(N'00:50:00' AS Time), CAST(N'01:00:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (268, 6, CAST(N'01:00:00' AS Time), CAST(N'01:10:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (269, 6, CAST(N'01:10:00' AS Time), CAST(N'01:20:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (270, 6, CAST(N'01:20:00' AS Time), CAST(N'01:30:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (271, 6, CAST(N'01:30:00' AS Time), CAST(N'01:40:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (272, 6, CAST(N'01:40:00' AS Time), CAST(N'01:50:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (273, 6, CAST(N'01:50:00' AS Time), CAST(N'02:00:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (274, 6, CAST(N'02:00:00' AS Time), CAST(N'02:10:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (275, 6, CAST(N'02:10:00' AS Time), CAST(N'02:20:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (276, 6, CAST(N'02:20:00' AS Time), CAST(N'02:30:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (277, 6, CAST(N'02:30:00' AS Time), CAST(N'02:40:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (278, 6, CAST(N'02:40:00' AS Time), CAST(N'02:50:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (279, 6, CAST(N'02:50:00' AS Time), CAST(N'03:00:00' AS Time), NULL, NULL, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (280, 8, CAST(N'00:00:00' AS Time), CAST(N'00:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (281, 8, CAST(N'00:20:00' AS Time), CAST(N'00:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (282, 8, CAST(N'00:40:00' AS Time), CAST(N'01:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (283, 8, CAST(N'01:00:00' AS Time), CAST(N'01:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (284, 8, CAST(N'01:20:00' AS Time), CAST(N'01:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (285, 8, CAST(N'01:40:00' AS Time), CAST(N'02:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (286, 8, CAST(N'02:00:00' AS Time), CAST(N'02:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (287, 8, CAST(N'02:20:00' AS Time), CAST(N'02:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (288, 8, CAST(N'02:40:00' AS Time), CAST(N'03:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (289, 8, CAST(N'03:00:00' AS Time), CAST(N'03:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (290, 8, CAST(N'03:20:00' AS Time), CAST(N'03:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (291, 8, CAST(N'03:40:00' AS Time), CAST(N'04:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (292, 8, CAST(N'04:00:00' AS Time), CAST(N'04:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (293, 8, CAST(N'04:20:00' AS Time), CAST(N'04:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (294, 8, CAST(N'04:40:00' AS Time), CAST(N'05:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (295, 8, CAST(N'05:00:00' AS Time), CAST(N'05:20:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (296, 8, CAST(N'05:20:00' AS Time), CAST(N'05:40:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[TimeTable] ([Id], [ScheduleId], [StartTimeGaps], [EndTimeGaps], [PatientId], [SpecialEvent], [Date]) VALUES (297, 8, CAST(N'05:40:00' AS Time), CAST(N'06:00:00' AS Time), NULL, NULL, CAST(N'2024-03-22' AS Date))
SET IDENTITY_INSERT [dbo].[TimeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name]) VALUES (1, N'лабораторное исследование')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (2, N'инструментальная диагностика, лекарственная терапия')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (3, N'физиотерапия')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Role]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Specialization] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Specialization]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Conditions] FOREIGN KEY([ConditionId])
REFERENCES [dbo].[Conditions] ([Id])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Conditions]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Department]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Patient] FOREIGN KEY([MedicCardCode])
REFERENCES [dbo].[Patient] ([MedicCardCode])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Patient]
GO
ALTER TABLE [dbo].[InsuransyPolise]  WITH CHECK ADD  CONSTRAINT [FK_InsuransyPolise_InsurnsyCompany] FOREIGN KEY([InsuransyCompanyId])
REFERENCES [dbo].[InsurnsyCompany] ([Id])
GO
ALTER TABLE [dbo].[InsuransyPolise] CHECK CONSTRAINT [FK_InsuransyPolise_InsurnsyCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuransyPolise] FOREIGN KEY([InsuransyPolisyId])
REFERENCES [dbo].[InsuransyPolise] ([Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuransyPolise]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Doctor]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Patient] FOREIGN KEY([TimeGaps])
REFERENCES [dbo].[Patient] ([MedicCardCode])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Patient]
GO
ALTER TABLE [dbo].[TableTime]  WITH CHECK ADD  CONSTRAINT [FK_TableTime_Patient] FOREIGN KEY([PatientMediccardCode])
REFERENCES [dbo].[Patient] ([MedicCardCode])
GO
ALTER TABLE [dbo].[TableTime] CHECK CONSTRAINT [FK_TableTime_Patient]
GO
ALTER TABLE [dbo].[TableTime]  WITH CHECK ADD  CONSTRAINT [FK_TableTime_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([Id])
GO
ALTER TABLE [dbo].[TableTime] CHECK CONSTRAINT [FK_TableTime_Schedule]
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnostic_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic] CHECK CONSTRAINT [FK_TherapeuticDiagnostic_Doctor]
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnostic_Patient] FOREIGN KEY([MedicCardCode])
REFERENCES [dbo].[Patient] ([MedicCardCode])
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic] CHECK CONSTRAINT [FK_TherapeuticDiagnostic_Patient]
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnostic_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TherapeuticDiagnostic] CHECK CONSTRAINT [FK_TherapeuticDiagnostic_Type]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([MedicCardCode])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Patient]
GO
USE [master]
GO
ALTER DATABASE [user] SET  READ_WRITE 
GO
