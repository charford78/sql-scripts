/*
Insert Student
	(Firstname, Lastname, StateCode, SAT, GPA, MajorId)
	Values
	('Noah', 'Phense', 'GA', 1235, 3.15, 
		(select id from Major where Description = 'Math'));
*/	
	
select *
	from Student
	order by Id desc;