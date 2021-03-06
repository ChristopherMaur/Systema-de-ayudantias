USE [master]
GO
/****** Object:  Database [Ayudantia]    Script Date: 04/01/2018 19:26:54 ******/
CREATE DATABASE [Ayudantia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ayudantia', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ayudantia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ayudantia_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ayudantia_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ayudantia] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ayudantia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ayudantia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ayudantia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ayudantia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ayudantia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ayudantia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ayudantia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ayudantia] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ayudantia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ayudantia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ayudantia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ayudantia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ayudantia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ayudantia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ayudantia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ayudantia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ayudantia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ayudantia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ayudantia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ayudantia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ayudantia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ayudantia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ayudantia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ayudantia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ayudantia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ayudantia] SET  MULTI_USER 
GO
ALTER DATABASE [Ayudantia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ayudantia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ayudantia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ayudantia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Ayudantia]
GO
/****** Object:  Table [dbo].[ALUMNO_CARRERA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALUMNO_CARRERA](
	[codigo_alu_car] [int] NOT NULL,
	[rut_user] [int] NOT NULL,
	[codigo_car] [int] NOT NULL,
	[ano_alu_car] [int] NOT NULL,
	[periodo_alu_car] [int] NOT NULL,
	[fecha_registro_alu_car] [datetime] NOT NULL,
 CONSTRAINT [PK_ALUMNO_CARRERA] PRIMARY KEY CLUSTERED 
(
	[codigo_alu_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASIGNATURAS]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ASIGNATURAS](
	[codigo_asig] [int] NOT NULL,
	[nombre_asig] [varchar](100) NOT NULL,
	[fecha_registro_asig] [datetime] NOT NULL,
 CONSTRAINT [PK_ASIGNATURAS] PRIMARY KEY CLUSTERED 
(
	[codigo_asig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AYUDANTE]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AYUDANTE](
	[rut_ayudante] [int] NOT NULL,
	[ano_periodo_academico] [varchar](50) NOT NULL,
	[asignatura_ayudante] [varchar](150) NOT NULL,
	[seccion_ayudante] [int] NOT NULL,
	[horas_ayudante] [int] NOT NULL,
	[fecha_seleccion_ayudante] [datetime] NOT NULL,
	[detalle_horario] [varchar](150) NOT NULL,
 CONSTRAINT [PK_AYUDANTE] PRIMARY KEY CLUSTERED 
(
	[rut_ayudante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AYUDANTIAS]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AYUDANTIAS](
	[id_ayudantia] [int] NOT NULL,
	[codigo_asig] [int] NOT NULL,
	[rut_ayudante] [int] NOT NULL,
	[codigo_car] [int] NOT NULL,
	[codigo_sec] [int] NOT NULL,
	[ano_periodo_academico] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AYUDANTIAS] PRIMARY KEY CLUSTERED 
(
	[id_ayudantia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CARRERA_ASIGNATURA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRERA_ASIGNATURA](
	[codigo_car_asig] [int] NOT NULL,
	[codigo_car] [int] NOT NULL,
	[codigo_asig] [int] NOT NULL,
	[fecha_registro_car_asig] [datetime] NOT NULL,
 CONSTRAINT [PK_CARRERA_ASIGNATURA] PRIMARY KEY CLUSTERED 
(
	[codigo_car_asig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CARRERAS]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CARRERAS](
	[codigo_car] [int] NOT NULL,
	[nombre_car] [varchar](150) NOT NULL,
	[fecha_registro_car] [datetime] NOT NULL,
 CONSTRAINT [PK_CARRERAS] PRIMARY KEY CLUSTERED 
(
	[codigo_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EVALUACION_SECCION_ASIGNATURA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EVALUACION_SECCION_ASIGNATURA](
	[codigo_eva] [int] NOT NULL,
	[codigo_sec] [int] NOT NULL,
	[nombre_eva] [varchar](50) NOT NULL,
	[ponderacion_eva] [decimal](7, 0) NOT NULL,
	[fecha_registro_eva] [datetime] NOT NULL,
 CONSTRAINT [PK_EVALUACION_SECCION_ASIGNATURA] PRIMARY KEY CLUSTERED 
(
	[codigo_eva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LISTADO_POSTULACIONES]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LISTADO_POSTULACIONES](
	[id_listado] [int] NOT NULL,
	[id_oferta] [int] NOT NULL,
	[rut_postulacion] [int] NOT NULL,
 CONSTRAINT [PK_LISTADO_POSTULACIONES] PRIMARY KEY CLUSTERED 
(
	[id_listado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATRICULA_ALUMNO_CARRERA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATRICULA_ALUMNO_CARRERA](
	[codigo_matricula] [int] NOT NULL,
	[codigo_alu_car] [int] NOT NULL,
	[ano_matricula] [int] NOT NULL,
	[periodo_matricula] [int] NOT NULL,
	[fecha_registro_matricula] [datetime] NOT NULL,
 CONSTRAINT [PK_MATRICULA_ALUMNO_CARRERA] PRIMARY KEY CLUSTERED 
(
	[codigo_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATRICULA_ASIGNATURA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATRICULA_ASIGNATURA](
	[codigo_matricula_asig] [int] NOT NULL,
	[codigo_matricula] [int] NOT NULL,
	[codigo_asig] [int] NOT NULL,
	[fecha_registro_matricula_asig] [datetime] NOT NULL,
 CONSTRAINT [PK_MATRICULA_ASIGNATURA] PRIMARY KEY CLUSTERED 
(
	[codigo_matricula_asig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATRICULA_ASIGNATURA_EVALUACION]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATRICULA_ASIGNATURA_EVALUACION](
	[codigo_matricula_eva] [int] NOT NULL,
	[codigo_matricula_asig] [int] NOT NULL,
	[codigo_eva] [int] NOT NULL,
	[calificacion_matricula_eva] [decimal](7, 0) NOT NULL,
	[fecha_registro_matricula_eva] [datetime] NOT NULL,
 CONSTRAINT [PK_MATRICULA_ASIGNATURA_EVALUACION] PRIMARY KEY CLUSTERED 
(
	[codigo_matricula_eva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OFERTA_AYUDANTIA_ASIGNATURA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OFERTA_AYUDANTIA_ASIGNATURA](
	[id_oferta] [int] NOT NULL,
	[codigo_sec] [int] NOT NULL,
	[codigo_car] [int] NOT NULL,
	[horas_oferta] [int] NOT NULL,
	[requisito_oferta] [varchar](230) NOT NULL,
 CONSTRAINT [PK_OFERTA_AYUDANTIA_ASIGNATURA] PRIMARY KEY CLUSTERED 
(
	[id_oferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POSTULACION_AYUDANTE]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSTULACION_AYUDANTE](
	[rut_postulacion] [int] NOT NULL,
	[codigo_asig] [int] NOT NULL,
	[fecha_postulacion] [datetime] NOT NULL,
	[comentarios_postulacion] [varchar](230) NOT NULL,
	[horas_postulacion] [int] NOT NULL,
	[estado_postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_POSTULACION_AYUDANTE] PRIMARY KEY CLUSTERED 
(
	[rut_postulacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SECCION_ASIGNATURA]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECCION_ASIGNATURA](
	[codigo_sec] [int] NOT NULL,
	[codigo_car_asig] [int] NOT NULL,
	[rut_user] [int] NOT NULL,
	[numero_sec] [int] NOT NULL,
	[fecha_registro_sec] [datetime] NOT NULL,
 CONSTRAINT [PK_SECCION_ASIGNATURA] PRIMARY KEY CLUSTERED 
(
	[codigo_sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 04/01/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[rut_user] [int] NOT NULL,
	[dv_user] [int] NOT NULL,
	[nombre_user] [varchar](100) NOT NULL,
	[apellido_paterno_user] [varchar](100) NOT NULL,
	[apellido_materno_user] [varchar](100) NOT NULL,
	[fecha_registro_user] [datetime] NOT NULL,
	[clave_user] [varchar](50) NOT NULL,
	[email_user] [varchar](100) NOT NULL,
	[telefono_user] [int] NOT NULL,
	[rol_user] [varchar](50) NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[rut_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11111, N'Algebra', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11112, N'Estadísticas', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11113, N'Lenguaje', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11114, N'Metodología de Desarrollo', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11115, N'Base de Datos', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11116, N'Programación I', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11117, N'Diseño', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11118, N'Administración de Empresas', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (11119, N'Gestión Empresarial I', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22221, N'Gestion de Empresas', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22222, N'Algebra Líneal', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22223, N'Filosofía', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22224, N'Alimentación Sana', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22225, N'Física', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22226, N'Administración General', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22227, N'Informática I', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (22228, N'Informática II', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (33333, N'Cálculo', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (44444, N'Calculo II', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (55555, N'Cálculo III', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (66666, N'Inglés', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (77777, N'Inglés II', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (88888, N'Ingles III', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[ASIGNATURAS] ([codigo_asig], [nombre_asig], [fecha_registro_asig]) VALUES (99999, N'Edificación', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[AYUDANTE] ([rut_ayudante], [ano_periodo_academico], [asignatura_ayudante], [seccion_ayudante], [horas_ayudante], [fecha_seleccion_ayudante], [detalle_horario]) VALUES (18388306, N'2018-1', N'Programación I', 2, 5, CAST(0x0000A84200C90CC0 AS DateTime), N'1212')
INSERT [dbo].[AYUDANTE] ([rut_ayudante], [ano_periodo_academico], [asignatura_ayudante], [seccion_ayudante], [horas_ayudante], [fecha_seleccion_ayudante], [detalle_horario]) VALUES (99999999, N'2018-1', N'Calculo II', 1, 6, CAST(0x0000A84300C90CC0 AS DateTime), N'lunes 3')
INSERT [dbo].[AYUDANTIAS] ([id_ayudantia], [codigo_asig], [rut_ayudante], [codigo_car], [codigo_sec], [ano_periodo_academico]) VALUES (1, 11115, 99999999, 29037, 11115, N'2018-1')
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11111, 29037, 11116, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11112, 29037, 11114, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11113, 29037, 11115, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11114, 29037, 22221, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11115, 29037, 11111, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11116, 29037, 22222, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11117, 29037, 33333, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (11118, 29037, 44444, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (22221, 29018, 11119, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (22222, 29018, 11112, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (22223, 29018, 22226, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (22224, 29018, 11118, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (33331, 29038, 77777, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (33332, 29038, 88888, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (33333, 29038, 66666, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (33334, 29038, 11113, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (44441, 29020, 22227, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (44442, 29020, 22228, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (44444, 29020, 55555, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (55551, 29019, 22225, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (55552, 29019, 22224, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (66661, 29001, 99999, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (66662, 29004, 11117, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig], [codigo_car], [codigo_asig], [fecha_registro_car_asig]) VALUES (66663, 29004, 22223, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29001, N'Arquitectura', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29004, N'Diseño Industrial', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29018, N'Ingeniería Estadísticas', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29019, N'Ingeniería Civil Química', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29020, N'Ingeniería Civil Industrial', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29026, N'Ingeniería Civil Mecánica', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29037, N'Ingeniería de Ejecución en Computación e Informática', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[CARRERAS] ([codigo_car], [nombre_car], [fecha_registro_car]) VALUES (29038, N'Ingeniería Comercial', CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (1, 6, 18388306)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (2, 8, 22222222)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (3, 12, 33333333)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (4, 11, 88888888)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (5, 13, 99999999)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (6, 13, 66666666)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (7, 10, 67548936)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (8, 11, 9006006)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (9, 3, 55555555)
INSERT [dbo].[LISTADO_POSTULACIONES] ([id_listado], [id_oferta], [rut_postulacion]) VALUES (10, 1, 44444444)
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (1, 11111, 29037, 5, N'Programación I aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (2, 11112, 29037, 5, N'Programación I aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (3, 11113, 29037, 5, N'Metodología de Desarrollo aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (4, 11114, 29037, 5, N'Metodología de Desarrollo aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (5, 11115, 29037, 5, N'Base de Datos aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (6, 11116, 29037, 5, N'Base de Datos aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (7, 11117, 29037, 5, N'Gestion de Empresas aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (8, 11118, 29037, 5, N'Algebra aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (9, 11119, 29037, 5, N'Algebra aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (10, 11121, 29037, 6, N'Algebra Líneal aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (11, 11122, 29037, 6, N'Algebra Líneal aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (12, 11123, 29037, 6, N'Cálculo aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (13, 11124, 29018, 6, N'Calculo II aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (14, 11125, 29018, 6, N'Estadísticas aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (15, 11126, 29018, 6, N'Estadísticas aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (16, 11127, 29018, 6, N'Gestión Empresarial I aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (17, 11128, 29018, 6, N'Administración General aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (18, 11112, 29037, 8, N'Programacion I aprobada')
INSERT [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta], [codigo_sec], [codigo_car], [horas_oferta], [requisito_oferta]) VALUES (19, 11111, 29037, 4, N'Programacion I aprobada')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (9006006, 22222, CAST(0x0000A85500225510 AS DateTime), N'Postulación', 4, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (11111111, 11116, CAST(0x0000A84500083D60 AS DateTime), N'Postulación', 8, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (11222333, 22222, CAST(0x0000ABA9000A6FE0 AS DateTime), N'Postulación', 3, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (18388306, 11116, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Seleccionado')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (18725339, 22226, CAST(0x0000A3CD016481A0 AS DateTime), N'Postulación', 4, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (22222222, 11111, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (33333333, 33333, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (44444444, 11116, CAST(0x0000A83C018B3BB0 AS DateTime), N'cmentarios', 6, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (55555555, 11114, CAST(0x0000A8530044F070 AS DateTime), N'Postulación', 4, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (66222888, 22226, CAST(0x0000A856003A8090 AS DateTime), N'Postulación', 3, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (66666666, 44444, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Rechazado')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (67548936, 22222, CAST(0x0000AA200186D6B0 AS DateTime), N'Postulación', 4, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (88888888, 22222, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (98765432, 22222, CAST(0x0000A51D003D3FB0 AS DateTime), N'Postulación', 4, N'Pendiente')
INSERT [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion], [codigo_asig], [fecha_postulacion], [comentarios_postulacion], [horas_postulacion], [estado_postulacion]) VALUES (99999999, 44444, CAST(0x0000A84700000000 AS DateTime), N'Postulación', 5, N'Seleccionado')
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11111, 11111, 22222221, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11112, 11111, 33333331, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11113, 11112, 33333331, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11114, 11112, 88888881, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11115, 11113, 99999999, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11116, 11113, 22222221, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11117, 11114, 88888881, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11118, 11115, 66666661, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11119, 11115, 99999999, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11121, 11116, 55555551, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11122, 11116, 66666661, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11123, 11117, 22222221, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11124, 11118, 22222221, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11125, 22222, 17872991, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11126, 22222, 17872991, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11127, 22221, 88888881, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11128, 22223, 88888881, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11129, 22224, 55555551, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11130, 33333, 99999999, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11131, 33333, 99999999, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11132, 33332, 66666661, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11133, 33332, 66666661, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11134, 33334, 33333331, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11135, 44444, 33333331, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11136, 44444, 17872991, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11137, 44441, 17872991, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11138, 44441, 17872991, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11139, 44442, 22222221, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11140, 55551, 22222221, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11141, 55552, 55555551, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11142, 66661, 55555551, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11143, 66662, 88888881, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11144, 66662, 66666661, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11145, 66663, 88888881, 1, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[SECCION_ASIGNATURA] ([codigo_sec], [codigo_car_asig], [rut_user], [numero_sec], [fecha_registro_sec]) VALUES (11146, 66663, 99999999, 2, CAST(0x0000A85B00000000 AS DateTime))
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (11111111, 1, N'Admin', N'Admin', N'Admin', CAST(0x0000A85B00000000 AS DateTime), N'1111', N'admin@gmail.com', 11111111, N'Admin')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (11111112, 1, N'Enrique', N'Iglesias', N'Bailando', CAST(0x0000A85B00000000 AS DateTime), N'1111', N'eiglesias@gmail.com', 11111112, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (17872991, 8, N'Christopher', N'Gutiérrez', N'Mellado', CAST(0x0000831000000000 AS DateTime), N'1414', N'chgutie@gmail.com', 56455649, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (18388306, 2, N'Nicol', N'Bascuñán', N'Faúndez', CAST(0x0000857800000000 AS DateTime), N'3012', N'nicol.b1101@gmail.com', 54554068, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (22222221, 2, N'Ulises', N'Hernandez', N'Landero', CAST(0x0000A85B00000000 AS DateTime), N'2222', N'uhernandez@gmail.com', 22222221, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (22222222, 2, N'Christian', N'Rodríguez', N'Hormazábal', CAST(0x0000A85B00000000 AS DateTime), N'2222', N'chrodriguez@gmail.com', 22222222, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (33333331, 3, N'Manuel', N'Garrido', N'Paredes', CAST(0x0000A85B00000000 AS DateTime), N'3333', N'mgarrido@gmail.com', 33333331, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (33333333, 3, N'Cristian', N'Venegas', N'Córdova', CAST(0x0000A85B00000000 AS DateTime), N'3333', N'cvenegas@gmail.com', 33333333, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (44444441, 4, N'Alejandro', N'Mora', N'Mora', CAST(0x0000A85B00000000 AS DateTime), N'4444', N'amora@gmail.com', 44444441, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (44444444, 4, N'Hector', N'Riquelme', N'Cerda', CAST(0x000084E800000000 AS DateTime), N'4444', N'hriquelme@gmail.com', 44444444, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (55555551, 5, N'Lucía', N'Jaramillo', N'Jerez', CAST(0x0000A85B00000000 AS DateTime), N'5555', N'ljaramillo@gmail.com', 55555551, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (55555555, 5, N'Elizabeth', N'Mondaca', N'Lagos', CAST(0x0000A85B00000000 AS DateTime), N'5555', N'emondaca@gmail.com', 55555555, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (66666661, 6, N'Fredy', N'Muñoz', N'Muñoz', CAST(0x0000A85B00000000 AS DateTime), N'6666', N'fmunoz@gmail.com', 66666661, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (66666666, 6, N'Patricio', N'Lucas', N'Lucas', CAST(0x0000A85B00000000 AS DateTime), N'6666', N'plucas@gmail.com', 66666666, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (77777771, 7, N'Francisca', N'Hurtado', N'Perez', CAST(0x0000A85B00000000 AS DateTime), N'7777', N'fhurtado@gmail.com', 77777771, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (77777777, 7, N'Luna', N'Lovegood', N'Lovegood', CAST(0x0000A85B00000000 AS DateTime), N'7777', N'llovegood@gmail.com', 77777777, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (88888881, 8, N'Karen', N'Flores', N'Nuñez', CAST(0x0000A85B00000000 AS DateTime), N'8888', N'kflores@gmail.com', 88888881, N'Profesor')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (88888888, 8, N'Harry', N'James', N'Potter', CAST(0x0000A85B00000000 AS DateTime), N'8888', N'hpotter@gmail.com', 88888888, N'Alumno')
INSERT [dbo].[USUARIOS] ([rut_user], [dv_user], [nombre_user], [apellido_paterno_user], [apellido_materno_user], [fecha_registro_user], [clave_user], [email_user], [telefono_user], [rol_user]) VALUES (99999999, 9, N'Sefer', N'Raziel', N'Hamalach', CAST(0x0000A85B00000000 AS DateTime), N'9999', N'raziel@gmail.com', 99999999, N'Alumno')
ALTER TABLE [dbo].[ALUMNO_CARRERA]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_CARRERA_CARRERAS] FOREIGN KEY([codigo_car])
REFERENCES [dbo].[CARRERAS] ([codigo_car])
GO
ALTER TABLE [dbo].[ALUMNO_CARRERA] CHECK CONSTRAINT [FK_ALUMNO_CARRERA_CARRERAS]
GO
ALTER TABLE [dbo].[ALUMNO_CARRERA]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_CARRERA_USUARIOS] FOREIGN KEY([rut_user])
REFERENCES [dbo].[USUARIOS] ([rut_user])
GO
ALTER TABLE [dbo].[ALUMNO_CARRERA] CHECK CONSTRAINT [FK_ALUMNO_CARRERA_USUARIOS]
GO
ALTER TABLE [dbo].[AYUDANTIAS]  WITH CHECK ADD  CONSTRAINT [FK_AYUDANTIAS_ASIGNATURAS] FOREIGN KEY([codigo_asig])
REFERENCES [dbo].[ASIGNATURAS] ([codigo_asig])
GO
ALTER TABLE [dbo].[AYUDANTIAS] CHECK CONSTRAINT [FK_AYUDANTIAS_ASIGNATURAS]
GO
ALTER TABLE [dbo].[AYUDANTIAS]  WITH CHECK ADD  CONSTRAINT [FK_AYUDANTIAS_AYUDANTE] FOREIGN KEY([rut_ayudante])
REFERENCES [dbo].[AYUDANTE] ([rut_ayudante])
GO
ALTER TABLE [dbo].[AYUDANTIAS] CHECK CONSTRAINT [FK_AYUDANTIAS_AYUDANTE]
GO
ALTER TABLE [dbo].[AYUDANTIAS]  WITH CHECK ADD  CONSTRAINT [FK_AYUDANTIAS_CARRERAS] FOREIGN KEY([codigo_car])
REFERENCES [dbo].[CARRERAS] ([codigo_car])
GO
ALTER TABLE [dbo].[AYUDANTIAS] CHECK CONSTRAINT [FK_AYUDANTIAS_CARRERAS]
GO
ALTER TABLE [dbo].[AYUDANTIAS]  WITH CHECK ADD  CONSTRAINT [FK_AYUDANTIAS_SECCION_ASIGNATURA] FOREIGN KEY([codigo_sec])
REFERENCES [dbo].[SECCION_ASIGNATURA] ([codigo_sec])
GO
ALTER TABLE [dbo].[AYUDANTIAS] CHECK CONSTRAINT [FK_AYUDANTIAS_SECCION_ASIGNATURA]
GO
ALTER TABLE [dbo].[CARRERA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_CARRERA_ASIGNATURA_ASIGNATURAS] FOREIGN KEY([codigo_asig])
REFERENCES [dbo].[ASIGNATURAS] ([codigo_asig])
GO
ALTER TABLE [dbo].[CARRERA_ASIGNATURA] CHECK CONSTRAINT [FK_CARRERA_ASIGNATURA_ASIGNATURAS]
GO
ALTER TABLE [dbo].[CARRERA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_CARRERA_ASIGNATURA_CARRERAS] FOREIGN KEY([codigo_car])
REFERENCES [dbo].[CARRERAS] ([codigo_car])
GO
ALTER TABLE [dbo].[CARRERA_ASIGNATURA] CHECK CONSTRAINT [FK_CARRERA_ASIGNATURA_CARRERAS]
GO
ALTER TABLE [dbo].[EVALUACION_SECCION_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_EVALUACION_SECCION_ASIGNATURA_SECCION_ASIGNATURA] FOREIGN KEY([codigo_sec])
REFERENCES [dbo].[SECCION_ASIGNATURA] ([codigo_sec])
GO
ALTER TABLE [dbo].[EVALUACION_SECCION_ASIGNATURA] CHECK CONSTRAINT [FK_EVALUACION_SECCION_ASIGNATURA_SECCION_ASIGNATURA]
GO
ALTER TABLE [dbo].[LISTADO_POSTULACIONES]  WITH CHECK ADD  CONSTRAINT [FK_LISTADO_POSTULACIONES_OFERTA_AYUDANTIA_ASIGNATURA] FOREIGN KEY([id_oferta])
REFERENCES [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] ([id_oferta])
GO
ALTER TABLE [dbo].[LISTADO_POSTULACIONES] CHECK CONSTRAINT [FK_LISTADO_POSTULACIONES_OFERTA_AYUDANTIA_ASIGNATURA]
GO
ALTER TABLE [dbo].[LISTADO_POSTULACIONES]  WITH CHECK ADD  CONSTRAINT [FK_LISTADO_POSTULACIONES_POSTULACION_AYUDANTE] FOREIGN KEY([rut_postulacion])
REFERENCES [dbo].[POSTULACION_AYUDANTE] ([rut_postulacion])
GO
ALTER TABLE [dbo].[LISTADO_POSTULACIONES] CHECK CONSTRAINT [FK_LISTADO_POSTULACIONES_POSTULACION_AYUDANTE]
GO
ALTER TABLE [dbo].[MATRICULA_ALUMNO_CARRERA]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULA_ALUMNO_CARRERA_ALUMNO_CARRERA] FOREIGN KEY([codigo_alu_car])
REFERENCES [dbo].[ALUMNO_CARRERA] ([codigo_alu_car])
GO
ALTER TABLE [dbo].[MATRICULA_ALUMNO_CARRERA] CHECK CONSTRAINT [FK_MATRICULA_ALUMNO_CARRERA_ALUMNO_CARRERA]
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULA_ASIGNATURA_ASIGNATURAS] FOREIGN KEY([codigo_asig])
REFERENCES [dbo].[ASIGNATURAS] ([codigo_asig])
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA] CHECK CONSTRAINT [FK_MATRICULA_ASIGNATURA_ASIGNATURAS]
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULA_ASIGNATURA_MATRICULA_ALUMNO_CARRERA] FOREIGN KEY([codigo_matricula])
REFERENCES [dbo].[MATRICULA_ALUMNO_CARRERA] ([codigo_matricula])
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA] CHECK CONSTRAINT [FK_MATRICULA_ASIGNATURA_MATRICULA_ALUMNO_CARRERA]
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA_EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULA_ASIGNATURA_EVALUACION_EVALUACION_SECCION_ASIGNATURA] FOREIGN KEY([codigo_eva])
REFERENCES [dbo].[EVALUACION_SECCION_ASIGNATURA] ([codigo_eva])
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA_EVALUACION] CHECK CONSTRAINT [FK_MATRICULA_ASIGNATURA_EVALUACION_EVALUACION_SECCION_ASIGNATURA]
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA_EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULA_ASIGNATURA_EVALUACION_MATRICULA_ASIGNATURA] FOREIGN KEY([codigo_matricula_asig])
REFERENCES [dbo].[MATRICULA_ASIGNATURA] ([codigo_matricula_asig])
GO
ALTER TABLE [dbo].[MATRICULA_ASIGNATURA_EVALUACION] CHECK CONSTRAINT [FK_MATRICULA_ASIGNATURA_EVALUACION_MATRICULA_ASIGNATURA]
GO
ALTER TABLE [dbo].[OFERTA_AYUDANTIA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_OFERTA_AYUDANTIA_ASIGNATURA_CARRERAS] FOREIGN KEY([codigo_car])
REFERENCES [dbo].[CARRERAS] ([codigo_car])
GO
ALTER TABLE [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] CHECK CONSTRAINT [FK_OFERTA_AYUDANTIA_ASIGNATURA_CARRERAS]
GO
ALTER TABLE [dbo].[OFERTA_AYUDANTIA_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_OFERTA_AYUDANTIA_ASIGNATURA_SECCION_ASIGNATURA] FOREIGN KEY([codigo_sec])
REFERENCES [dbo].[SECCION_ASIGNATURA] ([codigo_sec])
GO
ALTER TABLE [dbo].[OFERTA_AYUDANTIA_ASIGNATURA] CHECK CONSTRAINT [FK_OFERTA_AYUDANTIA_ASIGNATURA_SECCION_ASIGNATURA]
GO
ALTER TABLE [dbo].[POSTULACION_AYUDANTE]  WITH CHECK ADD  CONSTRAINT [FK_POSTULACION_AYUDANTE_ASIGNATURAS] FOREIGN KEY([codigo_asig])
REFERENCES [dbo].[ASIGNATURAS] ([codigo_asig])
GO
ALTER TABLE [dbo].[POSTULACION_AYUDANTE] CHECK CONSTRAINT [FK_POSTULACION_AYUDANTE_ASIGNATURAS]
GO
ALTER TABLE [dbo].[SECCION_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_SECCION_ASIGNATURA_CARRERA_ASIGNATURA] FOREIGN KEY([codigo_car_asig])
REFERENCES [dbo].[CARRERA_ASIGNATURA] ([codigo_car_asig])
GO
ALTER TABLE [dbo].[SECCION_ASIGNATURA] CHECK CONSTRAINT [FK_SECCION_ASIGNATURA_CARRERA_ASIGNATURA]
GO
ALTER TABLE [dbo].[SECCION_ASIGNATURA]  WITH CHECK ADD  CONSTRAINT [FK_SECCION_ASIGNATURA_USUARIOS] FOREIGN KEY([rut_user])
REFERENCES [dbo].[USUARIOS] ([rut_user])
GO
ALTER TABLE [dbo].[SECCION_ASIGNATURA] CHECK CONSTRAINT [FK_SECCION_ASIGNATURA_USUARIOS]
GO
USE [master]
GO
ALTER DATABASE [Ayudantia] SET  READ_WRITE 
GO
