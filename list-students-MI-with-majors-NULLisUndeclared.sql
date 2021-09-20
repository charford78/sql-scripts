select Lastname, isnull(m.Description, 'Undeclared') Major
	from Student s
	left join Major m
		on s.MajorId = m.Id
	where s.StateCode = 'MI'