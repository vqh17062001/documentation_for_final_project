USE [master]
GO
/****** Object:  Database [HealthWebDB]    Script Date: 27/07/2025 19:13:14 ******/
CREATE DATABASE [HealthWebDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealthWebDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HealthWebDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealthWebDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HealthWebDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HealthWebDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HealthWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HealthWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthWebDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HealthWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealthWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthWebDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealthWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthWebDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HealthWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [HealthWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealthWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealthWebDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealthWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HealthWebDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HealthWebDB', N'ON'
GO
ALTER DATABASE [HealthWebDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HealthWebDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HealthWebDB]
GO
/****** Object:  User [sa1]    Script Date: 27/07/2025 19:13:14 ******/
CREATE USER [sa1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RemoveVietnameseDiacritics]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RemoveVietnameseDiacritics](@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX) = @input;
    
    -- Loại bỏ dấu các ký tự tiếng Việt
    SET @result = REPLACE(@result, N'à', 'a');
    SET @result = REPLACE(@result, N'á', 'a');
    SET @result = REPLACE(@result, N'ạ', 'a');
    SET @result = REPLACE(@result, N'ả', 'a');
    SET @result = REPLACE(@result, N'ã', 'a');
    SET @result = REPLACE(@result, N'â', 'a');
    SET @result = REPLACE(@result, N'ầ', 'a');
    SET @result = REPLACE(@result, N'ấ', 'a');
    SET @result = REPLACE(@result, N'ậ', 'a');
    SET @result = REPLACE(@result, N'ẩ', 'a');
    SET @result = REPLACE(@result, N'ẫ', 'a');
    SET @result = REPLACE(@result, N'ă', 'a');
    SET @result = REPLACE(@result, N'ằ', 'a');
    SET @result = REPLACE(@result, N'ắ', 'a');
    SET @result = REPLACE(@result, N'ặ', 'a');
    SET @result = REPLACE(@result, N'ẳ', 'a');
    SET @result = REPLACE(@result, N'ẵ', 'a');
    
    SET @result = REPLACE(@result, N'è', 'e');
    SET @result = REPLACE(@result, N'é', 'e');
    SET @result = REPLACE(@result, N'ẹ', 'e');
    SET @result = REPLACE(@result, N'ẻ', 'e');
    SET @result = REPLACE(@result, N'ẽ', 'e');
    SET @result = REPLACE(@result, N'ê', 'e');
    SET @result = REPLACE(@result, N'ề', 'e');
    SET @result = REPLACE(@result, N'ế', 'e');
    SET @result = REPLACE(@result, N'ệ', 'e');
    SET @result = REPLACE(@result, N'ể', 'e');
    SET @result = REPLACE(@result, N'ễ', 'e');
    
    SET @result = REPLACE(@result, N'ì', 'i');
    SET @result = REPLACE(@result, N'í', 'i');
    SET @result = REPLACE(@result, N'ị', 'i');
    SET @result = REPLACE(@result, N'ỉ', 'i');
    SET @result = REPLACE(@result, N'ĩ', 'i');
    
    SET @result = REPLACE(@result, N'ò', 'o');
    SET @result = REPLACE(@result, N'ó', 'o');
    SET @result = REPLACE(@result, N'ọ', 'o');
    SET @result = REPLACE(@result, N'ỏ', 'o');
    SET @result = REPLACE(@result, N'õ', 'o');
    SET @result = REPLACE(@result, N'ô', 'o');
    SET @result = REPLACE(@result, N'ồ', 'o');
    SET @result = REPLACE(@result, N'ố', 'o');
    SET @result = REPLACE(@result, N'ộ', 'o');
    SET @result = REPLACE(@result, N'ổ', 'o');
    SET @result = REPLACE(@result, N'ỗ', 'o');
    SET @result = REPLACE(@result, N'ơ', 'o');
    SET @result = REPLACE(@result, N'ờ', 'o');
    SET @result = REPLACE(@result, N'ớ', 'o');
    SET @result = REPLACE(@result, N'ợ', 'o');
    SET @result = REPLACE(@result, N'ở', 'o');
    SET @result = REPLACE(@result, N'ỡ', 'o');
    
    SET @result = REPLACE(@result, N'ù', 'u');
    SET @result = REPLACE(@result, N'ú', 'u');
    SET @result = REPLACE(@result, N'ụ', 'u');
    SET @result = REPLACE(@result, N'ủ', 'u');
    SET @result = REPLACE(@result, N'ũ', 'u');
    SET @result = REPLACE(@result, N'ư', 'u');
    SET @result = REPLACE(@result, N'ừ', 'u');
    SET @result = REPLACE(@result, N'ứ', 'u');
    SET @result = REPLACE(@result, N'ự', 'u');
    SET @result = REPLACE(@result, N'ử', 'u');
    SET @result = REPLACE(@result, N'ữ', 'u');
    
    SET @result = REPLACE(@result, N'ỳ', 'y');
    SET @result = REPLACE(@result, N'ý', 'y');
    SET @result = REPLACE(@result, N'ỵ', 'y');
    SET @result = REPLACE(@result, N'ỷ', 'y');
    SET @result = REPLACE(@result, N'ỹ', 'y');
    
    SET @result = REPLACE(@result, N'đ', 'd');
    
    -- Chuyển thành chữ hoa
    SET @result = UPPER(@result);
    
    -- Loại bỏ khoảng cách
    SET @result = REPLACE(@result, ' ', '');
    
    RETURN @result;
END;
GO
/****** Object:  Table [dbo].[ACTIONS]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIONS](
	[action_ID] [varchar](50) NOT NULL,
	[action_name] [nvarchar](100) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[action_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentBatch]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentBatch](
	[batch_ID] [varchar](50) NOT NULL,
	[code_name] [varchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[scheduled_at] [datetime] NULL,
	[status] [smallint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[created_by] [uniqueidentifier] NULL,
	[manager_by] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Assessme__DBFF182980643B66] PRIMARY KEY CLUSTERED 
(
	[batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentBatchStudent]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentBatchStudent](
	[ABS_ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NULL,
	[batch_ID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ABS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentTests]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentTests](
	[testtype_ID] [varchar](50) NULL,
	[ABS_ID] [varchar](50) NULL,
	[code] [varchar](50) NULL,
	[unit] [varchar](20) NULL,
	[result_value] [varchar](50) NULL,
	[recorded_at] [datetime] NULL,
	[recorded_by] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT_LOGs]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDIT_LOGs](
	[audit_log_ID] [varchar](50) NOT NULL,
	[entity_ID] [varchar](50) NOT NULL,
	[login_his_ID] [varchar](50) NOT NULL,
	[time_start] [datetime] NOT NULL,
	[time_end] [datetime] NULL,
	[data_before] [nvarchar](max) NULL,
	[data_after] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BodyMetrics]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyMetrics](
	[ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[time_stamp] [datetime] NOT NULL,
	[height_cm] [varchar](3) NULL,
	[weight_kg] [varchar](3) NULL,
	[temperature_C] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyActivity]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyActivity](
	[ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[activity_date] [date] NOT NULL,
	[activity_minutes] [varchar](20) NULL,
	[type] [varchar](50) NULL,
	[title] [nvarchar](200) NULL,
	[calories] [varchar](6) NULL,
	[steps] [varchar](10) NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_code] [varchar](50) NOT NULL,
	[battalion] [varchar](1) NULL,
	[course] [varchar](1) NULL,
	[character_code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[department_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITY]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITY](
	[entity_ID] [varchar](50) NOT NULL,
	[name_entity] [nvarchar](100) NOT NULL,
	[level_security] [tinyint] NOT NULL,
	[type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[entity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Environment]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environment](
	[ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[time_stamp] [datetime] NOT NULL,
	[temperature_C] [varchar](2) NULL,
	[humidity_RH] [varchar](2) NULL,
	[uv_index_mw_cm2] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NULL,
	[duration_minutes] [tinyint] NULL,
	[type] [varchar](20) NULL,
	[title] [varchar](50) NULL,
	[calories] [varchar](6) NULL,
	[distance_m] [varchar](10) NULL,
	[steps] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUP_ROLES]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_ROLES](
	[group_ID] [varchar](50) NOT NULL,
	[role_ID] [varchar](50) NOT NULL,
	[note] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUPS]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUPS](
	[group_ID] [varchar](50) NOT NULL,
	[group_name] [nvarchar](100) NOT NULL,
	[time_active_ID] [varchar](50) NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN_HISTORYs]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN_HISTORYs](
	[login_his_ID] [varchar](50) NOT NULL,
	[user_ID] [uniqueidentifier] NOT NULL,
	[login_time] [datetime] NOT NULL,
	[logout_time] [datetime] NULL,
	[mac_device] [varchar](50) NULL,
	[ip_address] [varchar](50) NULL,
	[status_login] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[login_his_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISSIONS]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISSIONS](
	[permission_ID] [varchar](50) NOT NULL,
	[permission_name] [nvarchar](100) NOT NULL,
	[action_ID] [varchar](50) NOT NULL,
	[entity_ID] [varchar](50) NOT NULL,
	[time_active_ID] [varchar](50) NULL,
	[role_ID] [varchar](50) NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysiologicalMetrics]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysiologicalMetrics](
	[ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[measured_at] [datetime] NOT NULL,
	[metric_type] [varchar](20) NULL,
	[metric_value] [varchar](20) NULL,
	[metric_unit] [varchar](10) NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE_USERS]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE_USERS](
	[role_ID] [varchar](50) NOT NULL,
	[user_ID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[role_ID] [varchar](50) NOT NULL,
	[role_name] [nvarchar](100) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SleepSession]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SleepSession](
	[sleep_session_ID] [varchar](50) NOT NULL,
	[student_ID] [varchar](50) NOT NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[total_minutes] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[sleep_session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SleepStage]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SleepStage](
	[ID] [varchar](50) NOT NULL,
	[sleep_session_ID] [varchar](50) NOT NULL,
	[stage] [tinyint] NULL,
	[start_time] [datetime] NULL,
	[duration_minutes] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_ID] [varchar](50) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[dob] [varchar](10) NULL,
	[gender] [varchar](6) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[status] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[created_by] [uniqueidentifier] NULL,
	[manage_by] [uniqueidentifier] NULL,
	[department] [nvarchar](max) NULL,
 CONSTRAINT [PK__Students__2A082B22619858A2] PRIMARY KEY CLUSTERED 
(
	[student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTypes](
	[testtype_ID] [varchar](50) NOT NULL,
	[code] [varchar](50) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[unit] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[testtype_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIME_ACTIVE]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIME_ACTIVE](
	[time_active_ID] [varchar](50) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[schedule_day_of_week] [tinyint] NULL,
	[schedule_day_of_month] [tinyint] NULL,
	[schedule_day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[time_active_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[user_ID] [uniqueidentifier] NOT NULL,
	[user_name] [varchar](200) NOT NULL,
	[password_hash] [varchar](200) NOT NULL,
	[full_name] [nvarchar](200) NULL,
	[phone_number] [varchar](20) NULL,
	[department] [nvarchar](100) NULL,
	[user_status] [smallint] NOT NULL,
	[manage_by] [uniqueidentifier] NULL,
	[level_security] [tinyint] NOT NULL,
	[create_at] [datetime] NOT NULL,
	[update_at] [datetime] NULL,
	[group_ID] [varchar](50) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIONS] ADD  CONSTRAINT [DF_ACTIONS_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[AssessmentBatch] ADD  CONSTRAINT [DF__Assessmen__statu__2739D489]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[AssessmentBatch] ADD  CONSTRAINT [DF__Assessmen__creat__282DF8C2]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[AssessmentBatch] ADD  CONSTRAINT [DF__Assessmen__updat__29221CFB]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[AssessmentTests] ADD  DEFAULT (getdate()) FOR [recorded_at]
GO
ALTER TABLE [dbo].[AUDIT_LOGs] ADD  CONSTRAINT [DF_AUDIT_LOGs_time_start]  DEFAULT (getdate()) FOR [time_start]
GO
ALTER TABLE [dbo].[DailyActivity] ADD  CONSTRAINT [DF_DailyActivity_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[GROUPS] ADD  CONSTRAINT [DF_GROUPS_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[LOGIN_HISTORYs] ADD  CONSTRAINT [DF_LOGINH_status_login]  DEFAULT ((1)) FOR [status_login]
GO
ALTER TABLE [dbo].[PERMISSIONS] ADD  CONSTRAINT [DF_PERMISSIONS_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[PhysiologicalMetrics] ADD  CONSTRAINT [DF_PhysiologicalMetrics_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ROLES] ADD  CONSTRAINT [DF_ROLES_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_user_ID]  DEFAULT (newsequentialid()) FOR [user_ID]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_user_status]  DEFAULT ((1)) FOR [user_status]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_level_security]  DEFAULT ((1)) FOR [level_security]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_USERS_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[AssessmentBatchStudent]  WITH CHECK ADD  CONSTRAINT [FK__Assessmen__stude__2CF2ADDF] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentBatchStudent] CHECK CONSTRAINT [FK__Assessmen__stude__2CF2ADDF]
GO
ALTER TABLE [dbo].[AssessmentBatchStudent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentBatchStudent_Batch] FOREIGN KEY([batch_ID])
REFERENCES [dbo].[AssessmentBatch] ([batch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentBatchStudent] CHECK CONSTRAINT [FK_AssessmentBatchStudent_Batch]
GO
ALTER TABLE [dbo].[AssessmentTests]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentTests_AssessmentBatchStudent] FOREIGN KEY([ABS_ID])
REFERENCES [dbo].[AssessmentBatchStudent] ([ABS_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentTests] CHECK CONSTRAINT [FK_AssessmentTests_AssessmentBatchStudent]
GO
ALTER TABLE [dbo].[AssessmentTests]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentTests_TestTypes] FOREIGN KEY([testtype_ID])
REFERENCES [dbo].[TestTypes] ([testtype_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentTests] CHECK CONSTRAINT [FK_AssessmentTests_TestTypes]
GO
ALTER TABLE [dbo].[AUDIT_LOGs]  WITH CHECK ADD  CONSTRAINT [FK_AUDIT_Entity] FOREIGN KEY([entity_ID])
REFERENCES [dbo].[ENTITY] ([entity_ID])
GO
ALTER TABLE [dbo].[AUDIT_LOGs] CHECK CONSTRAINT [FK_AUDIT_Entity]
GO
ALTER TABLE [dbo].[AUDIT_LOGs]  WITH CHECK ADD  CONSTRAINT [FK_AUDIT_LoginHistory] FOREIGN KEY([login_his_ID])
REFERENCES [dbo].[LOGIN_HISTORYs] ([login_his_ID])
GO
ALTER TABLE [dbo].[AUDIT_LOGs] CHECK CONSTRAINT [FK_AUDIT_LoginHistory]
GO
ALTER TABLE [dbo].[BodyMetrics]  WITH CHECK ADD  CONSTRAINT [FK_BodyMetrics_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[BodyMetrics] CHECK CONSTRAINT [FK_BodyMetrics_Students]
GO
ALTER TABLE [dbo].[DailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyActivity_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[DailyActivity] CHECK CONSTRAINT [FK_DailyActivity_Students]
GO
ALTER TABLE [dbo].[Environment]  WITH CHECK ADD  CONSTRAINT [FK_Environment_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[Environment] CHECK CONSTRAINT [FK_Environment_Students]
GO
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [FK_Exercise_Students]
GO
ALTER TABLE [dbo].[GROUP_ROLES]  WITH CHECK ADD  CONSTRAINT [FK_GROUPROLES_Groups] FOREIGN KEY([group_ID])
REFERENCES [dbo].[GROUPS] ([group_ID])
GO
ALTER TABLE [dbo].[GROUP_ROLES] CHECK CONSTRAINT [FK_GROUPROLES_Groups]
GO
ALTER TABLE [dbo].[GROUP_ROLES]  WITH CHECK ADD  CONSTRAINT [FK_GROUPROLES_Roles] FOREIGN KEY([role_ID])
REFERENCES [dbo].[ROLES] ([role_ID])
GO
ALTER TABLE [dbo].[GROUP_ROLES] CHECK CONSTRAINT [FK_GROUPROLES_Roles]
GO
ALTER TABLE [dbo].[GROUPS]  WITH CHECK ADD  CONSTRAINT [FK_GROUPS_TimeActive] FOREIGN KEY([time_active_ID])
REFERENCES [dbo].[TIME_ACTIVE] ([time_active_ID])
GO
ALTER TABLE [dbo].[GROUPS] CHECK CONSTRAINT [FK_GROUPS_TimeActive]
GO
ALTER TABLE [dbo].[LOGIN_HISTORYs]  WITH CHECK ADD  CONSTRAINT [FK_LOGINH_Users] FOREIGN KEY([user_ID])
REFERENCES [dbo].[USERS] ([user_ID])
GO
ALTER TABLE [dbo].[LOGIN_HISTORYs] CHECK CONSTRAINT [FK_LOGINH_Users]
GO
ALTER TABLE [dbo].[PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_PERMS_Actions] FOREIGN KEY([action_ID])
REFERENCES [dbo].[ACTIONS] ([action_ID])
GO
ALTER TABLE [dbo].[PERMISSIONS] CHECK CONSTRAINT [FK_PERMS_Actions]
GO
ALTER TABLE [dbo].[PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_PERMS_Entity] FOREIGN KEY([entity_ID])
REFERENCES [dbo].[ENTITY] ([entity_ID])
GO
ALTER TABLE [dbo].[PERMISSIONS] CHECK CONSTRAINT [FK_PERMS_Entity]
GO
ALTER TABLE [dbo].[PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_PERMS_Roles] FOREIGN KEY([role_ID])
REFERENCES [dbo].[ROLES] ([role_ID])
GO
ALTER TABLE [dbo].[PERMISSIONS] CHECK CONSTRAINT [FK_PERMS_Roles]
GO
ALTER TABLE [dbo].[PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_PERMS_TimeActive] FOREIGN KEY([time_active_ID])
REFERENCES [dbo].[TIME_ACTIVE] ([time_active_ID])
GO
ALTER TABLE [dbo].[PERMISSIONS] CHECK CONSTRAINT [FK_PERMS_TimeActive]
GO
ALTER TABLE [dbo].[PhysiologicalMetrics]  WITH CHECK ADD  CONSTRAINT [FK_PhysiologicalMetrics_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[PhysiologicalMetrics] CHECK CONSTRAINT [FK_PhysiologicalMetrics_Students]
GO
ALTER TABLE [dbo].[ROLE_USERS]  WITH CHECK ADD  CONSTRAINT [FK_ROLEUSERS_Roles] FOREIGN KEY([role_ID])
REFERENCES [dbo].[ROLES] ([role_ID])
GO
ALTER TABLE [dbo].[ROLE_USERS] CHECK CONSTRAINT [FK_ROLEUSERS_Roles]
GO
ALTER TABLE [dbo].[ROLE_USERS]  WITH CHECK ADD  CONSTRAINT [FK_ROLEUSERS_Users] FOREIGN KEY([user_ID])
REFERENCES [dbo].[USERS] ([user_ID])
GO
ALTER TABLE [dbo].[ROLE_USERS] CHECK CONSTRAINT [FK_ROLEUSERS_Users]
GO
ALTER TABLE [dbo].[SleepSession]  WITH CHECK ADD  CONSTRAINT [FK_SleepSession_Students] FOREIGN KEY([student_ID])
REFERENCES [dbo].[Students] ([student_ID])
GO
ALTER TABLE [dbo].[SleepSession] CHECK CONSTRAINT [FK_SleepSession_Students]
GO
ALTER TABLE [dbo].[SleepStage]  WITH CHECK ADD  CONSTRAINT [FK_SleepStage_Session] FOREIGN KEY([sleep_session_ID])
REFERENCES [dbo].[SleepSession] ([sleep_session_ID])
GO
ALTER TABLE [dbo].[SleepStage] CHECK CONSTRAINT [FK_SleepStage_Session]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_CreatedBy] FOREIGN KEY([created_by])
REFERENCES [dbo].[USERS] ([user_ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_CreatedBy]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_ManageBy] FOREIGN KEY([manage_by])
REFERENCES [dbo].[USERS] ([user_ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_ManageBy]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_Groups] FOREIGN KEY([group_ID])
REFERENCES [dbo].[GROUPS] ([group_ID])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_Groups]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_Manager] FOREIGN KEY([manage_by])
REFERENCES [dbo].[USERS] ([user_ID])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_Manager]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserEffectivePermissions]    Script Date: 27/07/2025 19:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserEffectivePermissions]
    @user_ID UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy level security của user
    DECLARE @user_level_security TINYINT;

    SELECT @user_level_security = level_security
    FROM dbo.USERS
    WHERE user_ID = @user_ID;

    -- Lấy tất cả các role mà user sở hữu: trực tiếp hoặc qua group
    ;WITH UserRoles AS (
        -- Vai trò trực tiếp
        SELECT role_ID
        FROM dbo.ROLE_USERS
        WHERE user_ID = @user_ID

        UNION

        -- Vai trò qua GROUP
        SELECT gr.role_ID
        FROM dbo.USERS u
        JOIN dbo.GROUP_ROLES gr ON u.group_ID = gr.group_ID
        WHERE u.user_ID = @user_ID
    )

    SELECT 
        p.action_ID,
        p.entity_ID,
        e.level_security AS entity_security_level,
        p.role_ID,
        p.isActive
    FROM UserRoles ur
    JOIN dbo.PERMISSIONS p ON ur.role_ID = p.role_ID
    JOIN dbo.ENTITY e ON p.entity_ID = e.entity_ID
    WHERE 
        p.isActive = 1
        AND e.level_security >= @user_level_security
END
GO
USE [master]
GO
ALTER DATABASE [HealthWebDB] SET  READ_WRITE 
GO
