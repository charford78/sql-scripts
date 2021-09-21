--create database USCivilWarBattles;

create table Battles (
	Id int primary key identity(1,1),
	BattleCode varchar(10) not null unique,
	BattleName varchar(100) not null,
	Date datetime,
	Location varchar(30) not null,
	Theatre varchar(20) not null,
	Victor char(3) not null
)