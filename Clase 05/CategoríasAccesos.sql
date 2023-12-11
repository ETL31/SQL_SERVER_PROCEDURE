USE [NEPTUNO]
GO

/****** Object:  Table [dbo].[Categor�as]    Script Date: 25/06/2023 17:11:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[Categor�asAccesos](
    Id bigint identity(1,1) primary key,
	[IdCategor�a] [int] NOT NULL,
	
	[UsuarioCreacion] [int] NULL,
	[IpCreacion] [varchar](255) NULL,
	[PcCreacion] [varchar](255) NULL,
	[UsuarioModificacion] [int] NULL,
	[FechaHoraCreacion] [datetime2](7) NULL,
	[IpModificacion] [varchar](255) NULL,
	[PcModificacion] [varchar](255) NULL,
	[FechaHoraModificacion] [datetime2](7) NULL
) 
