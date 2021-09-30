USE [USCivilWarBattles]
GO
DROP TABLE Commanders
GO
CREATE TABLE [dbo].[Commanders](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Commander] [varchar](30) NOT NULL,
	[Army] [varchar](10) NOT NULL,
	[BattleId] [int] NOT NULL foreign key references Battles(Id)
)
GO


