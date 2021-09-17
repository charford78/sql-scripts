select *
	from Student
	where SAT > (select avg(SAT)
					from Student)
