CREATE OR ALTER Procedure CalculateRequestTotal
	@RequestId int = NULL
-- separate any additional parameters by commas
AS
BEGIN
	-- Check for missing RequestId
	if @RequestId is NULL
	BEGIN
		print 'RequestId is required';
		return -1;
	END
	-- Check the RequestId exists
	if not exists (SELECT 1 from Requests
		where Id = @RequestId)
	BEGIN
		print 'Request not found';
		return -2;
	END
	
	/* creating a variable that will only
		be used inside of this stored procedure */
	DECLARE @Total decimal (9,2);
	
	/* This puts the total calculated by the query
		into the variable called @Total */
	Select @Total = Sum(rl.quantity * p.price)
		from Requests r
		join Requestlines rl
			on rl.RequestId = r.Id
		join Products p
			on p.Id = rl.ProductId
		where r.Id = @RequestId
	
	/* this will display the value saved into @Total
	   by the previous query with the column name(alias)
	   'Total' 
	Select @Total 'Total' */

	-- now update the request
	UPDATE Requests set
		Total = @Total
		where Id = @RequestId
	print 'Updated!';
	Return 0;
END
Go
Declare @rc int;
EXEC @rc = CalculateRequestTotal @RequestId = 1;
Print @rc;
Go