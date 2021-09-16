SELECT lastname, description
	from Student s
	join major m
		on s.majorid = m.id;