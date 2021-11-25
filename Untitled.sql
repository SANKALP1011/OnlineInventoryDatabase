/*
- This is an online shop inventory databse which consists of two tables which are Order and Customer.
- Tuples in the relations are less because this is just a demo databse to demonstrate the use of sql.
- This database would consist of almost all the querys.
- Query would be divided into three categories depending on their difficulty level.
- Three categories are-:
  *Easy
  *Medium
  *Hard
- I'll try to cover as many queries as possible so that it would be easy for the user to refer the query for their own use.
- Souce code would be uploaded on github.
*/


##Creating a database -:

create database OnlineShopInventorydb;
use  OnlineShopInventorydb;

create table Orders(
    OrderId int primary key,                   ##Use primary key for the attribute OrderId because orderId would always be unique.
    OrderName varchar(70),
    OrderDate date,                            ##MySql provides us with a date function to declare date.
    OrderPrice int
);
describe Orders;                               ##Describe Function shows the table to the user.

 
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
foreign key(OrderId) references Orders(OrderId)    ##Refrencing the oookId as foreign key  from Orders(OrderId).  
);

insert into Customers
values("John","2021-09-12","Spain",1003),
("David","2000-09-18","France",1005),
("Sarah","1995-03-16","New Jersey",1007),
("Paul","1989-10-1","London",1002),
("Amy","1992-04-08","Texas",1006)
;
select*from customers;

/*
                                QUERY EXECUTION STARTS FROM HERE-:
                                       Category - Easy
*/

##When we run this query then we get all the value from the table Customer because we are using * operation-:
select* from Customer;  
select* from Orders;  

##Describe table Customer and Order-:
describe Customer;
describe Orders;

/*
                                     SELECT OPERATIONS-:
*/

##This query select all the name from the CustomerTable-:
select Custname 
from Customers;

##This query selects all the name where address is equal to France from the Customer Table-:
select Custname
from Customers
where Address = "France";

##This query selects all the OrderName along with their price using where condition-:
select OrderName , OrderPrice 
from Orders 
where OrderName = "watch"
and
OrderPrice = 20000;

##This query selects all the tuple which have attribute OrderName and OrderPrice where date is equal to "2021-07-12"-:
select OrderName , OrderPrice 
from orders
where OrderDate = "2020-07-12";

##This query uses alias for cutomer and order table and returns value using the condition C.OrderID = O.OrderId-:
##Note - This query returns all the tuples.
select C.CustName,C.Address,C.OrderId,O.OrderId
from Customers C , Orders O
where c.OrderId = O.OrderId;

##This query returns the all the tuples ( * returns all the values ) from orders table using the where clause-:
select*from orders
where OrderPrice > 30000;

/* This query returns the tuples using the where clause where it uses two conditions for returning tuples-: */
select o.orderName , o.orderId , c.CustName , c.Address ,c.OrderId
from orders o , customers c
where c.CustName = "John"
and c.OrderId = o.OrderId;

/* This query uses another subquery in the where clause and returns only one Row where Customer.OrderId = Orders.OrderId -: */
select * from Customers c
where c.OrderId =
(
select o.OrderId                              /* Subquery part */
from Orders o
where OrderName = "GameBox"
);

/* This query returns one row and uses subquery inorder to return the value -: */
select c.CustName , c.CustDob 
from Customers c
where c.CustName = 
(
select C.CustName
from Customers C
where C.CustName = "Paul"
);

/* This query uses another subquery and returns one row using the subquery */
select* 
from Customers c
where c.OrderId =
(
select O.OrderId 
from Orders O
where O.OrderName = "Speaker"
);

/* This is a simple query that returns two tuples using the Address condition -: */
select*
from Customers
where Address = "France"
or
Address = "Spain";

/* This query returns all the tuples from both the relation -:*/
select*
from Customers c , Orders o
where c.OrderId = O.OrderId;








   

