use master;
go
drop database if exists PrsDbApi22;
go
create database PrsDbApi22;
go
use PrsDbApi22;
go
	create table Users (
		Id int primary key identity(1,1),
		Username nvarchar(30) not null unique,
		Password nvarchar(30) not null,
		Firstname nvarchar(30) not null,
		Lastname nvarchar(30) not null,
		Phone nvarchar(12) null,
		Email nvarchar(255) null,
		IsReviewer bit not null,
		IsAdmin bit not null
	)

	create table Vendors (
		Id int primary key identity(1,1),
		Code nvarchar(30) not null unique,
		Name nvarchar(30) not null,
		Address nvarchar(30) not null,
		City nvarchar(30) not null,
		State nvarchar(2) not null,
		Zip nvarchar(5) not null,
		Phone nvarchar(12) null,
		Email nvarchar(255) null
	)

	create table Products (
		Id int primary key identity(1,1),
		PartNbr nvarchar(30) not null unique,
		Name nvarchar(30) not null,
		Price decimal(11,2) not null default 0,
		Unit nvarchar(30) not null,
		PhotoPath nvarchar(255) null,
		VendorId int not null foreign key
			references Vendors(Id)
	)

	create table Requests (
		Id int primary key identity(1,1),
		Description nvarchar(80) not null,
		Justification nvarchar(80) not null,
		RejectionReason nvarchar(80) null,
		DeliveryMode nvarchar(20) not null,
		Status nvarchar(10) not null,
		Total decimal(11,2) not null default 0,
		UserId int not null foreign key
			references Users(Id)
	)

	create table Requestlines (
		Id int primary key identity(1,1),
		RequestId int not null foreign key
			references Requests(Id),
		ProductId int not null foreign key
			references Products(Id),
		Quantity int not null default 0
	)
go
	insert Users
		(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
		values
		('cford', 'blah78', 'Charles', 'Ford', '867-5309', 'guy@email.com', 1, 1),
		('bross', 'HappyTree101', 'Bob', 'Ross', '123-4567', 'babysquirrel@email.com', 1, 0),
		('asandler', 'flamingpoo!', 'Adam', 'Sandler', '969-9696', 'drunkpenguin@school.com', 0, 0);

	insert Vendors
		(Code, Name, Address, City, State, Zip)
		values
		('AMZN', 'Amazon', '111 Amazon Dr.', 'Bezosville', 'CA', '23456'),
		('TARG', 'Target', '222 Target Cir.', 'Red Ball', 'TN', '67776'),
		('WALM', 'WalMart', '333 WalMart Way', 'Low Rent', 'GA', '43783');

	insert Products
		(PartNbr, Name, Price, Unit, VendorId)
		values
		('PlSpk50', 'Plastic Sporks - 50 ct', 5.00, 'box', 2),
		('PlSpk500', 'Plastic Sporks - 500 ct', 40.00, 'box', 2),
		('CanPrtr2000', 'Canon Printer 2000', 79.99, 'each', 1),
		('EchDt20', 'Amazon Echo Dot', 59.99, 'each', 1),
		('LegoCstl515', 'Lego Castle - 515 pc', 49.99, 'each', 3),
		('BntyPPT6', 'Bounty Paper Towels - 6pk', 8.99, 'each', 3),
		('AudCbl8', 'Amazon Basics Audio Cable 8ft.', 8.79, 'each', 1);

