SELECT *
	from Customers c
	join Orders o
		on o.CustomerId = c.id
	where c.name = 'Kroger'