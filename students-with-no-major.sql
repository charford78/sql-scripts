SELECT *
	from student s
	left join major m
		on m.id = s.MajorId
	where MajorId is NULL;