SELECT *, 'A' 'ABC'
	from Student
	where SAT > 1200
union
SELECT *, 'B' 'ABC'
	from Student
	where SAT <= 1200 and SAT >= 1000
union
SELECT *, 'C' 'ABC'
	from Student
	where SAT < 1000
	order by ABC;
