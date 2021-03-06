USE [phonebook]
GO
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [FK_Permission_Role]
GO
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [FK_Permission_Employee]
GO
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [FK_Permission_Department]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Location]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.7.2021. 2:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 13.7.2021. 2:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 13.7.2021. 2:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
DROP TABLE [dbo].[Location]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.7.2021. 2:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13.7.2021. 2:04:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
USE [master]
GO
/****** Object:  Database [phonebook]    Script Date: 13.7.2021. 2:04:36 ******/
DROP DATABASE [phonebook]
GO
/****** Object:  Database [phonebook]    Script Date: 13.7.2021. 2:04:36 ******/
CREATE DATABASE [phonebook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phonebook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IVANINSTANCE\MSSQL\DATA\phonebook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'phonebook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IVANINSTANCE\MSSQL\DATA\phonebook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [phonebook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phonebook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phonebook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phonebook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phonebook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phonebook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phonebook] SET ARITHABORT OFF 
GO
ALTER DATABASE [phonebook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phonebook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phonebook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phonebook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phonebook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phonebook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phonebook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phonebook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phonebook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phonebook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phonebook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phonebook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phonebook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phonebook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phonebook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phonebook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phonebook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phonebook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [phonebook] SET  MULTI_USER 
GO
ALTER DATABASE [phonebook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phonebook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phonebook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phonebook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [phonebook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [phonebook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [phonebook] SET QUERY_STORE = OFF
GO
USE [phonebook]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13.7.2021. 2:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.7.2021. 2:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[IdentifierRole] [int] NOT NULL,
	[IdentifierDepartment] [int] NOT NULL,
	[MobileNumber] [varchar](max) NULL,
	[Email] [varchar](max) NOT NULL,
	[JobDetails] [varchar](max) NULL,
	[IdentifierLocation] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 13.7.2021. 2:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 13.7.2021. 2:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[IdentifierEmployee] [int] NOT NULL,
	[IdentifierDepartment] [int] NOT NULL,
	[IdentifierRole] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.7.2021. 2:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Identifier], [Name]) VALUES (1, N'Manufacturing')
INSERT [dbo].[Department] ([Identifier], [Name]) VALUES (2, N'Sales')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (1, N'Jimmy', N'Page', 1, 1, N'767676', N'j@p.com', N'guitar expert', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (2, N'Eric', N'Clapton', 2, 1, N'999999', N'e@test.org', N'musician', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (4, N'Keith', N'Richards', 2, 1, N'876876', N'test@test.org', N'guitar ninja', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (5, N'Mick', N'Jagger', 1, 1, N'999888777', N'mick@rs.com', N'frontman', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (6, N'Ivan', N'Golović', 2, 1, N'555444', N'ivan@g.com', N'operator with access to workers', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (7, N'Jane', N'Doe', 2, 1, N'6555444', N'jane@doe.com', N'operator with access rights to workers and managers', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (8, N'Angus', N'Young', 1, 2, N'8787878787', N'angus@acdc.com', N'guitar wizzard', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (9, N'Brian', N'May', 2, 2, N'900009', N'brian@queen.com', N'guitar guru', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (10, N'Jeff', N'Beck', 1, 2, N'80008000', N'jeff@beck.org', N'guitar legend', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (11, N'Gordon', N'Sumner', 2, 2, N'3666666', N'gordon@sting.com', N'frontman and composer', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (12, N'Eddie', N'Vedder', 2, 2, N'7877777', N'eddie@pearl-jam.com', N'frontman', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (15, N'Jerry', N'Cantrell', 1, 2, N'99009900', N'jerry@aic.com', N'operator with access to workers in Sales department', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (16, N'Ozzy', N'Osborne', 1, 2, N'77336', N'ozzy@osborne.com', N'frontman', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (18, N'Billie', N'Gibbons', 1, 2, N'848484', N'b@g.com', N'frontman and guitar expect', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (19, N'Eddie', N'Van Hallen', 1, 1, N'47474747', N'evh@test.it', N'guitar king', 2)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (20, N'Goran', N'Bare', 1, 1, N'74444444', N'goran@majke.com', N'frontman and legend', 1)
INSERT [dbo].[Employee] ([Identifier], [Name], [LastName], [IdentifierRole], [IdentifierDepartment], [MobileNumber], [Email], [JobDetails], [IdentifierLocation]) VALUES (21, N'Tal', N'Wilkenfeld', 1, 1, N'9292929', N'tal@test.com', N'bass queen', 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Identifier], [Name]) VALUES (1, N'Athens')
INSERT [dbo].[Location] ([Identifier], [Name]) VALUES (2, N'Madrid')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (1, 6, 1, 1)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (2, 6, 2, 1)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (3, 7, 1, 1)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (4, 7, 1, 2)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (5, 7, 2, 1)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (6, 7, 2, 2)
INSERT [dbo].[Permission] ([Identifier], [IdentifierEmployee], [IdentifierDepartment], [IdentifierRole]) VALUES (7, 15, 2, 1)
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Identifier], [Name]) VALUES (1, N'Worker')
INSERT [dbo].[Role] ([Identifier], [Name]) VALUES (2, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([IdentifierDepartment])
REFERENCES [dbo].[Department] ([Identifier])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Location] FOREIGN KEY([IdentifierLocation])
REFERENCES [dbo].[Location] ([Identifier])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Location]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([IdentifierRole])
REFERENCES [dbo].[Role] ([Identifier])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Department] FOREIGN KEY([IdentifierDepartment])
REFERENCES [dbo].[Department] ([Identifier])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Department]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Employee] FOREIGN KEY([IdentifierEmployee])
REFERENCES [dbo].[Employee] ([Identifier])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Employee]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Role] FOREIGN KEY([IdentifierRole])
REFERENCES [dbo].[Role] ([Identifier])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Role]
GO
USE [master]
GO
ALTER DATABASE [phonebook] SET  READ_WRITE 
GO
