SELECT m.code, Description, c.code, i.lastname
	from major m
	join MajorClass mc
		on mc.MajorId = m.Id
	join class c
		on c.id = mc.ClassId
	join Instructor i
		on i.id = c.InstructorId;