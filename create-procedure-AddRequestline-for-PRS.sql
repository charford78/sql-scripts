Create or Alter Procedure AddRequestline
	@RequestId int = null,
	@ProductName varchar(40) = null,
	@Quantity int = null
as begin
	-- check for all data entered
	if @RequestId is null or @ProductName is null or @Quantity is null
	begin
		print 'All parameters must be entered';
		return -1;
	end
	if not exists (select 1 from Requests where Id = @RequestId)
	begin
		print 'Request not found';
		return -2;
	end
	if not exists (select 1 from products where Name = @ProductName)
	begin
		print 'Product not found';
		return -3;
	end
	if @Quantity < 1
	begin
		print 'Quantity must be > 0';
		return -4;
	end
	-- all parameters are checked at this point
	declare @ProductId int;
	select @ProductId = Id from Products where Name = @ProductName
	-- Do the insert
	insert Requestlines (RequestId, ProductId, Quantity)
		values (@RequestId, @ProductId, @Quantity);
	print 'Insert Successful!';
	return 0;
end
go
exec AddRequestline @RequestId = 1, @ProductName = 'Plastic spork', @Quantity = 10;

--select * from Requestlines