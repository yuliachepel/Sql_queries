//Создание базы данных

CREATE DATABASE test1;

//Создание таблиц

CREATE TABLE Salespeople
(snum int PRIMARY KEY,
sname varchar (20),
city varchar (20),
comm decimal (3,2)
);


CREATE TABLE Customers
(cnum int PRIMARY KEY,
cname varchar (20),
city varchar (20),
rating int,
snum int,
FOREIGN KEY (snum) REFERENCES Salespeople (snum)
);

CREATE TABLE Orders
(
onum int PRIMARY KEY,
amt decimal (10,2),
odate date,
cnum int,
snum int,
FOREIGN KEY (cnum) REFERENCES Customers (cnum),
FOREIGN KEY (snum) REFERENCES Salespeople (snum)
);
