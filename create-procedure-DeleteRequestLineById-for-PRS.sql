Create or Alter Procedure DeleteRequestLineById
	@RequestLineId int = null
as begin
	-- check for data entered
	if @RequestLineId is null
	begin
		print 'Requestline Id must be entered';
		return -1;
	end
	delete from Requestlines
		where Id = @RequestLineId
	print 'Deletion successful!'
	return 0
end
go
exec DeleteRequestLineById @RequestlineId = 3

