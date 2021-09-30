USE [USCivilWarBattles]
GO

/****** Object:  Table [dbo].[Commanders]    Script Date: 9/30/2021 1:26:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE Commanders
GO
CREATE TABLE [dbo].[Commanders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Commander] [varchar](30) NOT NULL,
	[Army] [varchar](10) NOT NULL,
	[BattleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Commanders]  WITH CHECK ADD FOREIGN KEY([BattleId])
REFERENCES [dbo].[Battles] ([Id])
GO


