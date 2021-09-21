/*
INSERT Rating (
	Stars, Comment, StudentId, TopicId -- 'Comment' column is not necessary 
		--to add since the value can be NULL and will default to NULL if no 
		--value is defined.
)
	values (
		3, null,
		(select Id from Students where Name = 'Matt'),
		(select Id from Topics where Description like '%Git%') -- will search 
			--for a string with 'Git' contained in it.
	);
*/

	select *
		from Rating