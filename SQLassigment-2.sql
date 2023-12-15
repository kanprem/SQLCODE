---Q1) Create   Database Name as Order_Stores_Data 

CREATE DATABASE ORDER_STORE_DATA;

USE ORDER_STORE_DATA;

---Q2) Create two Table names as Orders_Table and Stores_Table

CREATE TABLE ORDERS_TABLE(
ORDER_DATE DATE,
REGION VARCHAR(50),
REP VARCHAR(50),
ORDER_ITEM VARCHAR(50),
UNITS INT,
UNIT_COST DECIMAL(10,2),
TOTAL_PRICE DECIMAL(10,2),
ORDER_ID INT PRIMARY KEY
);

CREATE TABLE STORES_TABLE (
STORE_ID INT PRIMARY KEY,
STORE_TYPE VARCHAR(50),
ASSORTMENT VARCHAR(50),
Competition_Distance VARCHAR(50),
Month VARCHAR(50),
Year INT,
Promo_Interval VARCHAR(50)
);

---Q3) Insert All records present here in the Orders_table and Stores_Table.

INSERT INTO ORDERS_TABLE
VALUES ('1-6-21','East','Aruna','Pencil',95	,1.99,189.05,1),
('1-23-21','Central','Kivell','Eraser',50,19.99,999.50,2),
('2-9-21','Central','Ganesh','NULL',36,4.99,179.64,3),
('2-26-21','Central','Payal','NULL',27,19.99,539.73,4),
('3-15-21','West','Sorvino','NULL',56,2.99,167.44,5),
('4-1-21','East','Hitesh','Pencil',60,4.99,299.40,6),
('4-18-21','Central','Akshita','NULL',75,1.99,149.25,7),
('5-5-21','Central','Ruchika','Books',90,4.99,449.10,8),
('5-22-21','West','Surbhi','NULL',32,1.99,63.68,9),
('6-8-21','East','Jones','Suitcase',60,8.99,539.40,10)

SELECT * FROM ORDERS_TABLE;

INSERT INTO STORES_TABLE
VALUES (1,'c',34,1270,9,2008,'Jan'),
(2,'a',14,570,11,2007,'Feb'),
(3,'a',43,14130,12,2006,'Mar'),
(4,'c',12,620,9,2009,'NULL'),
(5,'a',41,29910,4,2015,'May'),
(6,'a',32,310,12,2013,'June'),
(7,'a',35,24000,4,2013,'NULL'),	
(8,'a',10,7520,10,2014,'Aug'),
(9,'a',42,2030,8,2000,'NULL'),
(10,'a',14,3160,9,2009,'Oct')

SELECT * FROM STORES_TABLE;

--Q3) Make Order_Id  Column as Primary Key.

---ORDER_ID INT PRIMARY KEY ALLREDY EXIST

---Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.

ALTER TABLE STORES_TABLE ADD STORE_NAMES VARCHAR(50);

SELECT * FROM STORES_TABLE;

UPDATE STORES_TABLE SET STORE_NAMES = 'Hardware' WHERE STORE_ID = 3
UPDATE STORES_TABLE SET STORE_NAMES = 'Electrics' WHERE STORE_ID = 4
UPDATE STORES_TABLE SET STORE_NAMES = 'Fibers' WHERE STORE_ID = 5
UPDATE STORES_TABLE SET STORE_NAMES = 'Elastics' WHERE STORE_ID = 6
UPDATE STORES_TABLE SET STORE_NAMES = 'Books' WHERE STORE_ID = 7
UPDATE STORES_TABLE SET STORE_NAMES = 'Shoes' WHERE STORE_ID = 8
UPDATE STORES_TABLE SET STORE_NAMES = 'Clothes' WHERE STORE_ID = 9
UPDATE STORES_TABLE SET STORE_NAMES = 'Scraps' WHERE STORE_ID = 10

SELECT * FROM ORDERS_TABLE;

--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 

ALTER TABLE ORDERS_TABLE 
ADD FOREIGN KEY (ORDER_ID) REFERENCES ORDERS_TABLE(ORDER_ID);

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

SELECT * FROM ORDERS_TABLE;

UPDATE ORDERS_TABLE SET ORDER_ITEM = 'Compass' WHERE ORDER_ID=3;
UPDATE ORDERS_TABLE SET ORDER_ITEM = 'Torch' WHERE ORDER_ID=4;
UPDATE ORDERS_TABLE SET ORDER_ITEM = 'Phone' WHERE ORDER_ID=5;
UPDATE ORDERS_TABLE SET ORDER_ITEM = 'Laptop' WHERE ORDER_ID=7;
UPDATE ORDERS_TABLE SET ORDER_ITEM = 'BOX' WHERE ORDER_ID=9;

--Q7) Update the missing records in the PromoInterval Column in Stores Table.

SELECT * FROM STORES_TABLE;

UPDATE STORES_TABLE SET Promo_Interval= 'SEP' WHERE STORE_ID=9;

--APRIL--JULY--SEP

---Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.

 SELECT * FROM STORES_TABLE;

 EXEC sp_rename 'STORES_TABLE.ASSORTMENT','STORE_NOS','COLUMN';

 ---Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.

 SELECT * FROM ORDERS_TABLE;


  EXEC sp_rename 'ORDERS_TABLE.ORDER_ITEM','ITEM_NAME','COLUMN';
  EXEC sp_rename 'ORDERS_TABLE.REP','CUSTOMERS_NAME','COLUMN';

  SELECT * FROM ORDERS_TABLE;

----Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.

	SELECT * FROM ORDERS_TABLE;

SELECT * FROM ORDERS_TABLE
ORDER BY UNIT_COST DESC;

SELECT * FROM ORDERS_TABLE
ORDER BY ORDER_DATE , UNITS , TOTAL_PRICE , ORDER_ID ASC;

---Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region

SELECT * FROM ORDERS_TABLE;


EXEC sp_rename 'ORDERS_TABLE.CUSTOMERS_NAME','CUS_NAME','COLUMN';

SELECT REGION,
COUNT(*) AS 'CUS_NAME' FROM ORDERS_TABLE GROUP BY REGION;

---Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 

SELECT * FROM ORDERS_TABLE;
SELECT SUM(TOTAL_PRICE) AS TOTAL_PRICE ,SUM(UNIT_COST) AS UNIT_COST FROM ORDERS_TABLE;

---Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.


CREATE TABLE ORDER_STORES_TABLE(
ORDERDATE DATE,
UNITCOST DECIMAL(10,2),
STORETYPE VARCHAR(50)
);

SELECT * FROM ORDER_STORES_TABLE;


---Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9


SELECT * FROM ORDERS_TABLE;

SELECT ITEM_NAME , REGION , ORDER_ID FROM ORDERS_TABLE WHERE ORDER_ID = 4
SELECT ITEM_NAME , REGION , ORDER_ID FROM ORDERS_TABLE WHERE ORDER_ID = 5
SELECT ITEM_NAME , REGION , ORDER_ID FROM ORDERS_TABLE WHERE ORDER_ID = 6
SELECT ITEM_NAME , REGION , ORDER_ID FROM ORDERS_TABLE WHERE ORDER_ID = 9

---Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160

SELECT * FROM STORES_TABLE;

	SELECT Year FROM STORES_TABLE WHERE Competition_Distance = 29910;
	SELECT Year FROM STORES_TABLE WHERE Competition_Distance = 310;
	SELECT Year FROM STORES_TABLE WHERE Competition_Distance = 3160;

	--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400

	SELECT * FROM ORDERS_TABLE;

	SELECT ITEM_NAME FROM ORDERS_TABLE WHERE TOTAL_PRICE BETWEEN 200 AND 400;

--ANS PENCIL

---Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

SELECT * FROM STORES_TABLE;

EXEC sp_rename 'STORES_TABLE.COMPETITION_DISTANCE','CD','COLUMN';

SELECT SUM(CD) FROM STORES_TABLE;

--ANS 83520

---Q18) What is the Total Count of Stores_Type and CD columns

SELECT * FROM STORES_TABLE;

SELECT STORE_TYPE,
COUNT(*) AS 'CD' FROM STORES_TABLE GROUP BY STORE_TYPE;

--A = 8
--C = 2

--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.

SELECT * FROM STORES_TABLE;
SELECT * FROM ORDERS_TABLE;

SELECT STORE_ID
FROM STORES_TABLE
CROSS JOIN ORDERS_TABLE;

--Q20) DROP both the databases

DROP ORDER_STORE_DATA;
























