declare @statecode varchar(2) = 'IN'

select *
	from Student
	where StateCode = @statecode;