CREATE Table Topics (
	Id int not null primary key identity(1,1),
	Description varchar(30) not null,
	Sequence int not null unique,
	TooEasy bit not null default 1
)
go

INSERT into Topics 
	(Description, Sequence, TooEasy)
	values
	('Git/GitHub', 1, 1),
	('SQL Server', 2, 1),
	('C#', 3, 1),
	('EntityFrameworkCore', 4, 1),
	('Java', 5, 1),
	('Spring', 6, 1),
	('HTML', 7, 1),
	('CSS', 8, 1),
	('JavaScript', 9, 1),
	('Bootstrap', 10, 1),
	('jQuery', 11, 1),
	('Typescript', 12, 1),
	('Angular', 13, 1)
go;

select *
	from Topics