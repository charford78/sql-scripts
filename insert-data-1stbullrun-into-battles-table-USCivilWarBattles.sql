insert Battles (BattleCode, BattleName, Date, Location, Theatre, Victor)
	values
	('1BRUN', '1st Battle of Bull Run', 1861-07-21, 'Manassas, VA',
		'Eastern', 'CSA');

	select * from Battles

	Update Battles
		set Date = 1861-21-07
		where BattleCode = '1BRUN';
