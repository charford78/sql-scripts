create view ClassesForMajorIncInstructor as 
select m.Code MajorCode, m.Description Major, c.Code Class,
		i.Lastname Instructor
	from Major m
	join MajorClass mc
		on mc.MajorId = m.id
	join Class c
		on mc.ClassId = c.id
	join Instructor i
		on i.id = c.InstructorId;