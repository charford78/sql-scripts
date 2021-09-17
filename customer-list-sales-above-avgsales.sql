select *
	from Customers
	where sales > (select avg(sales) from customers)
	order by sales desc
