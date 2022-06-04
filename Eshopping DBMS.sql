create database Online_Shopping_System ;
use Online_shopping_system ;
create table Customer(Cust_id integer NOT NULL, 
Name varchar(50), 
Contact char(11), 
Address varchar(50),
PRIMARY KEY(Cust_id));
insert into Customer values (1,"Aryan Karkra", 9999888877, "Gurugram") ;
delete from Customer where cust_id=1;
create table Shopping_Order(Order_id integer NOT NULL,
Customer_id integer NOT NULL,
Date_of_order DATE,
PRIMARY KEY(Order_id),
FOREIGN KEY(Customer_id) REFERENCES Customer(Cust_id) ) ;
create table Categories(Cat_id integer NOT NULL, 
Cat_name varchar(50), 
Cat_type varchar(50),
PRIMARY KEY(Cat_id));
insert into Categories values(100, "ABC", "XYZ") ;
delete from Categories where Cat_id=100 ;
select * from Categories ;
alter table Categories drop Cat_type ; 
select * from categories ;
create table Delivery(delivery_id integer NOT NULL,
Cust_id integer NOT NULL,
Date_of_delivery DATE,
PRIMARY KEY(delivery_id),
FOREIGN KEY(Cust_id) REFERENCES Customer(Cust_id) );

create table Products(P_id integer NOT NULL,
P_name varchar(50),
category_id integer NOT NULL,
PRIMARY KEY(P_id),
FOREIGN KEY(category_id) REFERENCES Categories(Cat_id) );
create table Seller(Seller_id integer NOT NULL,
s_name varchar(50),
product_id integer NOT NULL,
PRIMARY KEY(Seller_id),
FOREIGN KEY(product_id) REFERENCES Products(P_id) );
create table Payment(Pay_id integer NOT NULL,
date_of_payment DATE,
customer_id integer NOT NULL,
PRIMARY KEY(Pay_id),
FOREIGN KEY(customer_id) REFERENCES Customer(Cust_id) );
create table Transaction_details(report_id integer NOT NULL,
customer_id integer NOT NULL,
order_id integer NOT NULL,
product_id integer NOT NULL,
payment_id integer NOT NULL,
PRIMARY KEY(report_id),
FOREIGN KEY(customer_id) REFERENCES Customer(Cust_id),
FOREIGN KEY(order_id) REFERENCES Shopping_order(order_id),
FOREIGN KEY(product_id) REFERENCES Products(P_id),
FOREIGN KEY(product_id) REFERENCES Products(P_id) );

show tables ;

insert into delivery
values (201,1,"2022-01-10"),(202,2,"2022-01-19"),(203,4,"2022-02-09"),(204,5,"2022-02-25"),(205,8,"2022-03-06");
select * from delivery;
insert into categories
values (101,"apparels"),(102,"electronics"),(103,"footwear"),(104,"jewellary"),(105,"Fashion Accessories"),(106,"cosmetics"),(107,"home decor"),(108,"books");
select * from categories;
insert into Customer values
(1,'Aryan karkra',9871777857,'gurugram'),
(2,'ishita',9871633227,'pitampura'),
(3,'mehak garg',9575523857,'vaishali'),
(4,'raavi singh',9800525257,'Kanhaiya nagar'),
(5,'gaurav garg',8871752527,'Rohtak'),
(6,'mayank',9972525267,'saket'),
(7,'japkirat singh',9185785195,'chattarpur'),
(8,'piyush kumar',9572285025,'chandi chowk'),
(9,'rajkumar chauhan',8499952892,'Noida'),
(10,'prashant tiwari',9992588529,'Panipat');
select * from Customer;

insert into Shopping_Order values
(1001,1,'2022-01-03'),
(1002,2,'2022-01-15'),
(1003,4,'2022-02-04'),
(1004,5,'2022-02-21'),
(1005,8,'2022-02-27'),
(1006,10,'2022-03-05');
select * from shopping_order;

insert into Products values
(301,'lewis jeans',101),
(302,'Monte carlo Tshirts',101),
(303,'apple',102),
(304,'samsung',102),
(305,'bata',103),
(306,'nike',103),
(307,'tanishq',104),
(308,'gucci',105),
(309,'lakme',106),
(310,'himalaya',106),
(311,'Gulmohar lane',107),
(312,'penguin',108);
select * from Products;

insert into Transaction_details values
(801,1,1001,301,501),
(802,2,1002,308,502),
(803,4,1003,310,503),
(804,5,1004,303,504),
(805,8,1005,306,505),
(806,10,1006,312,506);
select * from Transaction_details;
insert into Payment values
(501,'2022-01-03',1),
(502,'2022-01-15',2),
(503,'2022-02-04',4),
(504,'2022-02-21',5),
(505,'2022-02-27',8),
(506,'2022-03-05',10);
select * from Payment;

select Cust_id,Name,Contact,Address from Customer,Payment where date_of_payment>"2022-02-22" and Cust_id=customer_id; 

select P_id,P_name,category_id from products,Categories where Categories.cat_id=products.category_id and (cat_name="footwear" or cat_name="jewellary");

select P_id,P_name,category_id from products,Categories as Ca,Transaction_details as tr where tr.product_id=products.P_id and Ca.cat_id=products.category_id and cat_name="footwear";

select Name,P_id,P_name,Date_of_delivery from Customer,delivery,products,Transaction_details as tr where Date_of_delivery>"2022-02-09" and delivery.Cust_id=customer_id and P_id=product_id and Customer.cust_id=customer_id;
select * from Customer where Cust_id NOT IN (select Customer_id from shopping_order );
select category_id,count(*) as "Number of Products" from products group by category_id;

select P_id,P_name,shopping_order.Order_id,Name from products,shopping_order,Customer,Transaction_details where Name="prashant tiwari" and Transaction_details.order_id=shopping_order.Order_id and P_id=product_id and Customer.Cust_id=shopping_order.customer_id; 
  



