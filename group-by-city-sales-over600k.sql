select city, state, sum(sales), count(*)
	from Customers
	where sales > 20000
	group by city, state
	having sum(sales) > 600000;