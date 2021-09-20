CREATE Table Students (
	Id int not null primary key identity(1,1),
	Name varchar(50) not null,
	FavNumber int not null,
	FavColor varchar(20) null default 'Grey',
	Milk bit null default 0
);
go
INSERT into Students 
	(Name, FavNumber, FavColor, Milk)
	values
	('Matt', 144, 'Green', 1),
	('Parth', 84, 'Blue', 1),
	('Caroline', 25, null, 0)
go
