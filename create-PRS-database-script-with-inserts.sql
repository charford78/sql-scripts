use master
go
drop database if exists PRSDb;
go
create database PRSDb;
go
use PRSDb;
go
create table Users (
	Id int primary key identity (1,1),
	Username varchar(30) not null unique,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12) null,
	Email varchar(255) null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);
create table Vendors (
	Id int primary key identity (1,1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State char(2) not null,
	Zip char(5) not null,
	Phone varchar(12) null,
	Email varchar(255) null
);
create table Products (
	Id int primary key identity (1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(40) not null,
	Price decimal(9,2) not null default 0,
	Unit varchar(30) not null default 'Each',
	PhotoPath varchar(255) null,
	VendorId int not null foreign key references Vendors(Id)
);
create table Requests (
	Id int primary key identity (1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80) null,
	DeliveryMode varchar(20) not null default 'Pickup',
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId int not null foreign key references Users(Id)
);
create table Requestlines (
	Id int primary key identity (1,1),
	RequestId int not null foreign key references Requests(Id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
		check (Quantity > 0)
);
go

INSERT Users
	(Username, Password, Firstname, Lastname, IsReviewer, IsAdmin)
	values
	('charford78', 'watermelon', 'Charlie', 'Ford', 1, 1),
	('bradsharp77', 'orange', 'Bradford', 'Sharpless', 1, 0),
	('bossman99', 'beefy', 'Brick', 'Slabchest', 0, 0),
	('cheeselover101', 'gouda', 'Jack', 'Muenster', 0, 0);

INSERT Vendors
	(Code, Name, Address, City, State, Zip)
	values
	('AMZ', 'Amazon', '333 Amazon Way', 'Lebanon', 'OH', '45036'),
	('KRG', 'Kroger', '532 Kroger Lane', 'West Chester', 'OH', '45069'),
	('CAVU', 'Cavu Coffee', '789 Buddy Drive', 'West Chester', 'OH', '45069');

INSERT Products
	(PartNbr, Name, Price, Unit, VendorId)
	values
	('spk42', 'Plastic Spork', 0.29, 'Each', 
		(SELECT Id from Vendors
			where Code = 'KRG')),
	('dell35', 'Dell 3500 Laptop', 999.99, 'Each', 
		(SELECT Id from Vendors
			where Code = 'AMZ')),
	('coldrk6', 'Columbian Dark Roast Ground', 12.99, 'Bag', 
		(SELECT Id from Vendors
			where Code = 'CAVU')),
	('1gmilk2p', 'Gallon 2% Milk', 3.29, 'Each', 
		(SELECT Id from Vendors
			where Code = 'KRG')),
	('medrstbn', 'Medium Roast Coffee Beans', 10.99, 'Bag', 
		(SELECT Id from Vendors
			where Code = 'CAVU')),
	('prtpap100', '8x10 Wht Prntr Paper, 100 shts', 24.99, 'Pack', 
		(SELECT Id from Vendors
			where Code = 'AMZ'));




