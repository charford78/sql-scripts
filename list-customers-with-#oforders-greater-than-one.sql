select c.Name, count(*) Orders
	from Customers c
	join Orders o
		on o.CustomerId = c.Id
	group by c.id, c.name
		having count(*) > 1;
