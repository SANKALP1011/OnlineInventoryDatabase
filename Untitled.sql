create database OnlineShopInventorydb;
use  OnlineShopInventorydb;

create table Orders(
    OrderId int primary key,
    OrderName varchar(70),
    OrderDate date,
    OrderPrice int
);

insert into Orders
values(1002,"Phone","2021-04-10",57000),
(1003,"GameBox","2021-09-16",38000),
(1005,"Watch","2020-07-12",20000),
(1006,"Speaker","2020-07-12",25000),
(1007,"Oven","2020-07-12",30000)
;
select* from orders;

create table Customers(
CustName varchar(90),
CustDob date,
Address varchar(120),
OrderId int,
foreign key(OrderId) references Orders(OrderId)
);


