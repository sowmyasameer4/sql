Online Shopping Database

Tables:

Products (ProductID, Name, Price, Stock, Category)

Customers (CustomerID, Name, Email, Phone)

Orders (OrderID, CustomerID, OrderDate, TotalAmount)

OrderDetails (OrderDetailID, OrderID, ProductID, Quantity);

create database online_shopping;

use online_shopping;

create table products(productID int,
name varchar(100) not null,
price int,
stock int,
category varchar(50));

select * from products;

INSERT INTO Products (ProductID, Name, Price, Stock, Category) VALUES
(1, 'Laptop Pro 15"', 1200.00, 25, 'Electronics'),
(2, 'Wireless Mouse', 25.00, 150, 'Accessories'),
(3, 'Noise Cancelling Headphones', 199.99, 80, 'Audio'),
(4, 'Mechanical Keyboard', 89.99, 60, 'Accessories'),
(5, '4K Monitor 27"', 350.00, 40, 'Electronics'),
(6, 'USB-C Hub', 45.00, 100, 'Accessories'),
(7, 'Gaming Chair', 275.00, 30, 'Furniture'),
(8, 'External SSD 1TB', 130.00, 70, 'Storage'),
(9, 'Smartphone X12', 999.00, 50, 'Electronics'),
(10, 'Smartwatch Z5', 249.00, 65, 'Wearables');

alter table products rename column name to product_name;

create table Customers(CustomerID int,Name varchar(100)not null,Email varchar(100),Phone VARCHAR(100)
);
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(1, 'Alice Johnson', 'alice.johnson@email.com', '+1-202-555-0173'),
(2, 'Brian Smith', 'brian.smith@email.com', '+1-202-555-0118'),
(3, 'Carol Davis', 'carol.davis@email.com', '+1-202-555-0139'),
(4, 'David Lee', 'david.lee@email.com', '+1-202-555-0192'),
(5, 'Emily Clark', 'emily.clark@email.com', '+1-202-555-0187');




create table orders(OrderID int,
CustomerID int,
Order_date VARCHAR(50),
Total_amount int)
;

INSERT INTO Orders (OrderID, CustomerID, Order_date, Total_amount) VALUES
(1, 1, '2025-10-01', 1225.00),
(2, 3, '2025-10-03', 1749.00),
(3, 2, '2025-10-05', 274.99),
(4, 5, '2025-10-06', 1449.00),
(5, 4, '2025-10-07', 375.00);


create table OrderDetails (OrderDetailID int, OrderID int, ProductID int, Quantity int);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 9, 1),
(4, 2, 10, 3),
(5, 3, 3, 1),
(6, 3, 4, 1),
(7, 4, 5, 1),
(8, 4, 6, 2),
(9, 5, 7, 1),
(10, 5, 2, 2);

Queries

1.Find top 5 selling products;

select product_name,quantity from products
right join orderdetails
on products.productID=orderdetails.productID
order by quantity desc
LIMIT 3;


2.Get all orders made in the last 30 days;

select * from orders
order by order_date desc
limit 3;

3.Calculate total sales revenue;

select sum(Total_amount)
from orders;
