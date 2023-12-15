----1) Create two Databases Name :- Brands , and  Products


CREATE DATABASE PRODUCTS;
CREATE DATABASE BRANDS;

----2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.


USE BRANDS;

CREATE TABLE ITEMS_TABLE (
ITEM_ID INT,
item_description VARCHAR(150),
vendor_nos INT,
vendor_name VARCHAR(150),
bottle_size INT,
bottle_price DECIMAL(10,2),

);


SELECT * FROM ITEMS_TABLE;

----3)  After Creating both the tables Add records in that tables (records are available above)

INSERT INTO ITEMS_TABLE 
VALUES (1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,9.77),
(2,'D aristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,14.12),
(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.50),
(4,'Oak Cross Whisky',305,'Mhw Ltd',750,25.33),
(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,1.97),
(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37),
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,5.06),
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,23.61);

SELECT * FROM ITEMS_TABLE;

USE PRODUCTS;

CREATE TABLE PRODUCT_Table (
Product_Id INT,
Country VARCHAR(50),
Product VARCHAR(100),
Units_Sold DECIMAL (10,2),
Manufacturing_Price DECIMAL (10,2),
Sale_Price DECIMAL (10,2),
Gross_Sales DECIMAL (10,2),
Sales DECIMAL (10,2),
COGS DECIMAL (10,2),
Profit DECIMAL (10,2),
Date DATE,
);

select * from PRODUCT_Table;

alter table product_table
drop column date;

insert into PRODUCT_Table
values(1,'Canada','carretera',1618.50,3.00,20.00,32370.00,32370.00,16185.00,16185.00,
2,'Germany','Carretera',1321.00,3.00,20.00,26420.00,26420.00,13210.00,13210.00,
3,'France','Carretera',2178,3.00,15.00,32670.00,32,670.00,21,780.00,10,890.00,
4,'Germany','Carretera',888,3.00,15.00,13320.00,13,320.00,8,880.00,4,440.00,
5,'Mexico','Carretera',2470,3.00,15.00,37050.00,37,050.00,24,700.00,12,350.00,
6,'Germany','Carretera',1513,3.00,350.00,529550.00,529550.00,393380.00,136170.00,
7,'Germany','Montana',921,5.00,15.00,13815.00,13,815.00,9,210.00,4,605.00,
8,'Canada','Montana',2518,5.00,12.00,30216.00,30216.00,7554.00,22662.00);

----4)Delete those product having the Units Sold 1618.5 , 888 and 2470.....

DELETE FROM PRODUCT_Table WHERE Units_Sold = 1618.5;
DELETE FROM PRODUCT_Table WHERE Units_Sold = 888;
DELETE FROM PRODUCT_Table WHERE Units_Sold = 2470;

SELECT * FROM PRODUCT_Table;

----5) DROP the table and Create it again.

DROP TABLE PRODUCT_Table;

CREATE TABLE PRODUCT_Table (
Product_Id INT,
Country VARCHAR(50),
Product VARCHAR(100),
Units_Sold DECIMAL (10,2),
Manufacturing_Price DECIMAL (10,2),
Sale_Price DECIMAL (10,2),
Gross_Sales DECIMAL (10,2),
Sales DECIMAL (10,2),
COGS DECIMAL (10,2),
Profit DECIMAL (10,2),
Date DATE,
MonthNumber INT,
MonthName VARCHAR(50),
Year INT,
);


SELECT * FROM PRODUCT_Table;


insert into PRODUCT_Table
values(3,'France','Carretera','2178','3.00','15.00','32670.00','32670.00','21780.00','10890.00','6/1/2014','6','June','2016'),
(4,'Germany','Carretera','888','3.00','15.00','13320.00','13320.00','8880.00','4440.00','6/1/2014','6','June','2017'),
(5,'Mexico','Carretera','2470','3.00','15.00','37050.00','37050.00','24700.00','12350.00','6/1/2014','6','June','2018'),
(6,'Germany','Carretera','1513','3.00','350.00','529550.00','529550.00','393380.00','136170.00','12/1/2014','12','December','2019'),
(7,'Germany','Montana','921','5.00','15.00','13815.00','13815.00','9210.00','4605.00','3/1/2014','3','March','2020'),
(8,'Canada','Montana','2518','5.00','12.00','3016.00','30216.00','7554.00','22662.00','6/1/2014','6','June','2021');




SELECT * FROM PRODUCT_Table;

-----1) Find the Total Sale Price  and  Gross Sales 


SELECT SUM(SALE_PRICE) FROM PRODUCT_Table;
-----462.00
SELECT SUM(GROSS_SALES) FROM PRODUCT_Table;
---688211.00

-----2) In which year we have got the highest sales

SELECT YEAR FROM PRODUCT_Table WHERE Sales = (SELECT MAX(Sales) FROM PRODUCT_Table);
---2019---

----3)  Which Product having the sales of $ 37,050.00

SELECT PRODUCT FROM PRODUCT_Table WHERE Sales = 37050.00;

--- CARRETERA

-----4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00

SELECT PROFIT FROM PRODUCT_Table WHERE PROFIT BETWEEN 4605 AND 22662;

-----16185.00
-----13210.00
-----10890.00
-----12350.00
-----4605.00
-----22662.00

----5) Which Product Id having the sales of $ 24 , 700.00

SELECT * FROM PRODUCT_Table;

SELECT Product_Id FROM PRODUCT_Table 
WHERE Sale_Price = 24700;

---NULL--





