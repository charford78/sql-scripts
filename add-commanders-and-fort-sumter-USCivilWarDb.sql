select * from battles

select * from Commanders

insert Commanders (Commander, Army, BattleId)
	values ('BG Irvin McDowell', 'USA', (select Id from Battles
										where BattleCode = '1BRUN')),
		   ('BG P. G. T. Beauregard', 'CSA', (select Id from Battles
										where BattleCode = '1BRUN')),
		   ('BG Joseph E. Johnston', 'CSA', (select Id from Battles
										where BattleCode = '1BRUN')),
		   ('BG Nathaniel Lyon', 'USA', (select Id from Battles
										where BattleCode = 'WILCRK')),
		   ('MAJ Samuel D. Sturgis', 'USA', (select Id from Battles
										where BattleCode = 'WILCRK')),
			('MG Sterling Price', 'MOSG', (select Id from Battles
										where BattleCode = 'WILCRK')),
			('BG Benjamin McCulloch', 'CSA', (select Id from Battles
										where BattleCode = 'WILCRK'))

alter table Battles
	alter column Date varchar(40) null;

insert Battles (BattleCode, BattleName, Date, Location, Theatre, Victor)
	values ('FTSUM', 'Battle of Fort Sumter', 'April 12th-13th, 1861', 'Charleston, SC', 
			'Eastern', 'CSA')

insert Commanders (Commander, Army, BattleId)
	values ('BG P. G. T. Beauregard', 'CSA', (select Id from Battles
											where BattleCode = 'FTSUM')),
		   ('MAJ Rober Anderson', 'USA', (select Id from Battles
											where BattleCode = 'FTSUM'));