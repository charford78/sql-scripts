declare @uppergpa decimal(5,1) = 3.5;
declare @lowergpa decimal(5,1) = 2.5;

SELECT *
	from Student
	where GPA >= @uppergpa
union
SELECT *
	from Student
	where GPA <= @lowergpa;