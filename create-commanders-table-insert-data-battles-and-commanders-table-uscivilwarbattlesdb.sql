select * from Battles

insert Battles (BattleCode, BattleName, Location, Theatre, Victor)
values ('WILCRK', 'Battle of Wilson''s Creek', 'Wilson''s Creek, MO',
	'Western', 'CSA');

update Battles set
	Date = 'August 10th, 1861'
	where BattleCode = 'WILCRK';

alter table Battles
	alter column Location varchar(40);

alter table battles
	alter column Theatre varchar(40);

update Battles set
	Theatre = 'Trans-Mississippi'
		where BattleCode = 'WILCRK';

select * from Commanders;

insert Commanders (Commander, Army, BattleId)
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

	