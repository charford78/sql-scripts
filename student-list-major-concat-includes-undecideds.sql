SELECT concat(Lastname, ', ', Firstname) 'Name', isnull(Description, 'Undecided') 'Major'
	from student s
	left join Major m
		on m.Id = s.MajorId
	order by Lastname;