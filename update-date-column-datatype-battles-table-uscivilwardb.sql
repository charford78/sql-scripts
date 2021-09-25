alter table Battles 
	alter column Date 
		varchar(20);

update Battles set Date = 'July 21st, 1861'
	where BattleCode = '1BRUN';

select *
	from Battles


		
	
