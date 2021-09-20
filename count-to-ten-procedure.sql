create or alter procedure CountToTen
as 
begin
	declare @Index int = 1;
	declare @stop int = 10;

	while @Index <= @Stop
	begin
		print '@Index is ' + CAST(@Index as varchar(5));
		if @Index = 5
		begin
			print '@Index is five, halfway there';
		end
		set @Index = @Index + 1;
	end
end
go
exec CountToTen;