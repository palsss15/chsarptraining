create database SALESs

create table Salesmann
(
SalesmanID int primary key,
name varchar(30),
city varchar(35),
commision real
)

insert into Salesmann values(5001, 'James Hoog', 'New York', 0.15)
insert into Salesmann values(5002, 'Nail Knite', 'Paris', 0.13)
insert into Salesmann values(5005, 'Pit Alex', 'London', 0.11)
insert into Salesmann values(5006, 'Mc Lyon', 'Paris', 0.14)
insert into Salesmann values(5007, 'Paul Adam', 'Rome', 0.13)
insert into Salesmann values(5003, 'Lauson Hen', 'San Jose', 0.12)


select *from Salesmann


create table customer
(
customerID int primary key,
customerName varchar(30),
city varchar(15),
grade int,
SalesmanID int references Salesmann(SalesmanID)
)

insert into customer values(3002, 'Nick Rimando', 'New York', 100, 5001)
insert into customer values(3007, 'Brad Davis', 'New York', 200, 5001)
insert into customer values(3005, 'Graham Zusi', 'California', 200, 5002)
insert into customer values(3008, 'Julian Green', 'London', 300, 5002)
insert into customer values(3004, 'Fabian Johnson', 'Paris', 300, 5006)
insert into customer values(3009, 'Geoff Cameron', 'Berlin', 100, 5003)
insert into customer values(3003, 'Jozy Altidor', 'Moscow', 200, 5007)
insert into customer values(3001, 'Brad Guzan', 'London', 100, 5005)

select *from customer



create table orderss
(
order_no int primary key, 
purch_amt real,
order_date date, 
customerID int references customer(customerID),
SalesmanID int references Salesmann(SalesmanID)
)

insert into orderss values(70001, 150.5, '2012-10-05', 3005, 5002)
insert into orderss values(70009, 270.65, '2012-09-10', 3001, 5005)
insert into orderss values(70002, 65.26, '2012-10-05', 3002, 5001)
insert into orderss values(70004, 110.5, '2012-08-17', 3009, 5003)
insert into orderss values(70007, 948.5, '2012-09-10', 3005, 5002)
insert into orderss values(70005, 2400.6, '2012-07-27', 3007, 5001)
insert into orderss values(70008, 5760, '2012-09-10', 3002, 5001)
insert into orderss values(70010, 1983.43, '2012-10-10', 3004, 5006)
insert into orderss values(70003, 2480.4, '2012-10-10', 3009, 5003)
insert into orderss values(70012, 250.45, '2012-06-27', 3008, 5002)
insert into orderss values(70011, 75.29, '2012-08-17', 3003, 5007)
insert into orderss values(70013, 3045.6, '2012-04-25', 3002, 5001)

select *from orderss

select order_no, order_date, purch_amt from orderss where SalesmanID=5001

select customerID, customerName, city, grade, SalesmanID from customer where grade=200

select name, city from Salesmann where city='Paris'

select avg(purch_amt) from orderss

select count(DISTINCT SalesmanID) from orderss

select count(*) from customer

select max(purch_amt) from orderss

select city,max(grade) from customer group by city

select order_date,max(purch_amt) as max from orderss group by order_date, customerID

select order_date, SalesmanID,COUNT(*) as count from orderss group by order_date, SalesmanID

select COUNT(*) as count from Salesmann where city IS NOT NULL

select COUNT(*) as count from orderss where order_date='2012-08-17'

select SalesmanID,MAX(purch_amt) as max from orderss group by SalesmanID having SalesmanID BETWEEN 5003 AND 5008
