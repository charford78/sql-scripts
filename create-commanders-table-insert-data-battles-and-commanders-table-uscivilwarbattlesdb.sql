select * from Battles

insert Battles (BattleCode, BattleName, Location, Theatre, Victor)
values ('WILCRK', 'Battle of Wilson''s Creek', 'Wilson''s Creek, MO',
	'Western', 'CSA');

create table Commanders (
	Id int primary key identity(1,1),
	Name varchar(30) not null,
	Army char(3) not null,
	BattleId int not null foreign key references Battles(Id)
	);

select * from Commanders;

insert Commanders (Name, Army, BattleId)
	values
		('P.G.T. Beauregard', 'CSA', (Select Id from Battles 
									where BattleCode = '1BRUN')),
		('Joseph E. Johnston', 'CSA', (Select Id from Battles
									where BattleCode = '1BRUN')),
		('Irvin McDowell', 'USA', (Select Id from Battles
									where BattleCode = '1BRUN'));

select * 
	from Battles b	
	join Commanders c
		on b.Id = c.BattleId;

insert Commanders (Commander, Army, BattleId)
	values
		('Sterling Price', 'MSG', (Select Id from Battles
								where BattleCode = 'WILCRK')),
		('Benjamin McCulloch', 'CSA', (select Id from Battles
								where BattleCode = 'WILCRK')),
		('Nathaniel Lyon', 'USA', (select Id from Battles
								where BattleCode = 'WILCRK')),
		('Samuel D. Sturgis', 'USA', (select Id from Battles
								where BattleCode = 'WILCRK'));

