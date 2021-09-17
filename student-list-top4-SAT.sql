declare @SatScore int = 1494;

SELECT *
	from Student
	where SAT > @SatScore
	order by SAT desc;