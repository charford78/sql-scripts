use master;
go
drop database if exists BcDb;
go
create database BcDb;
go
use BcDb;
go
	create table Customers (
		Id int primary key identity(1,1),
		Code varchar(10) not null unique,
		Name varchar(30) not null,
		Sales decimal(9,2) not null default 0 check (Sales >= 0),
		Active bit not null default 1,
		Created datetime not null default getdate()
	)
-- Create the table(s) here
go
	insert Customers
		(Code, Name, Sales)
		values
		('BBUTCH', 'Billys Butcher Shop', 55555.55),
		('SSWAT', 'Swine Swatsons', 44444.44),
		('PBUTT', 'Pork Butts R Us', 33333.33),
		('BBACON', 'Body by Bacon', 22222.22),
		('TBPIG', 'T Boone Piggens', 11111.11);
-- Do your inserts here
go
ALTER TABLE Customers
	add Updated DateTime;

ALTER TABLE Customers
	alter column Note varchar(30) not null;

Update Customers Set
	Note = 'Default note',
	Updated = getdate(),
	Name = 'Billy''s Butcher Shop'
		where Code = 'BBUTCH';

Update Customers Set
	Updated = getdate(),
	Name = 'Swine Swatson''s'
		where Code = 'SSWAT';

Update Customers Set
	Updated = getdate(),
	Name = 'Pork Butts R'' Us'
		where Code = 'PBUTT';

select *
	from Customers
