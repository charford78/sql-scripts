create or alter procedure StudentGpaAdjustment
as
begin
	declare cur cursor for
		select FirstName, LastName, GPADelta from Adjustments
			where Completed = 0
	declare @FirstName varchar(30);
	declare @LastName varchar(30);
	declare @GPADelta decimal(5,2);
	open cur;
		fetch next from cur into @FirstName, @LastName, @GPADelta;
		while @@FETCH_STATUS = 0
		begin
			update student set
				GPA = GPA + @GPADelta
				where FirstName = @Firstname and LastName = @LastName
			/*
			select FirstName, LastName, GPA, @GPADelta Delta, (GPA + @GPADelta) 'New GPA'
				from Student
					where FirstName = @FirstName and LastName = @Lastname;
			*/
			fetch next from cur into @FirstName, @LastName, @GPADelta;
		end

	close cur;
	deallocate cur;

	update Adjustments set
		Completed = 1
		where Completed = 0;
end
go
exec StudentGpaAdjustment;