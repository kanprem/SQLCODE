
USE BRANDS;

SELECT * FROM ITEMS_TABLE;

INSERT INTO ITEMS_TABLE 
VALUES (1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,9.77),
(2,'D aristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,14.12),
(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.50),
(4,'Oak Cross Whisky',305,'Mhw Ltd',750,25.33),
(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,1.97),
(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37),
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,5.06),
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,23.61);

---1) Find the item_description having the bottle size of 750

select item_description from ITEMS_TABLE
where bottle_size=750;

--Travis Hasse Apple Pie
--D aristi Xtabentun
--Oak Cross Whisky
--Heaven Hill Old Style White Label
--Hyde Herbal Liqueur
--Dupont Calvados Fine Reserve

--2) Find the vendor Name having the vendor_nos 305 , 380 , 391

SELECT * FROM ITEMS_TABLE;

select vendor_name from ITEMS_table
where vendor_nos in(305,380,391)

--Mhw Ltd
--Anchor Distilling (preiss Imports)
--Mhw Ltd
--Phillips Beverage Company

----3) What is total Bottle_price 

SELECT SUM(BOTTLE_PRICE) AS TOTAL FROM ITEMS_TABLE;

--TOTAL 9273

----4) Make Primary Key to Item_id

SELECT * FROM ITEMS_TABLE;

ALTER TABLE ITEMS_TABLE ADD PRIMARY KEY(ITEM_ID);

-----5) Which item id having the bottle_price of BRANDS$ 5.06

SELECT ITEM_ID FROM ITEMS_TABLE WHERE bottle_price = 5.06;

---7--

---1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
---2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 

SELECT * FROM ITEMS_TABLE;
SELECT * FROM PROD

--FULL OUTER

SELECT * FROM 
BRANDS.[dbo].ITEMS_TABLE AS IT
FULL OUTER JOIN
PRODUCTS.[dbo].PRODUCT_Table AS PT
ON IT.ITEM_ID = PT.Product_Id;

---INNER JOIN

SELECT * FROM 
BRANDS.[dbo].ITEMS_TABLE AS IT
INNER JOIN
PRODUCTS.[dbo].PRODUCT_Table AS PT
ON IT.ITEM_ID = PT.Product_Id;

---LEFT JOIN

SELECT * FROM 
BRANDS.[dbo].ITEMS_TABLE AS IT
LEFT JOIN
PRODUCTS.[dbo].PRODUCT_Table AS PT
ON IT.ITEM_ID = PT.Product_Id;

-- RIGHT JOIN

SELECT * FROM 
BRANDS.[dbo].ITEMS_TABLE AS IT
RIGHT JOIN
PRODUCTS.[dbo].PRODUCT_Table AS PT
ON IT.ITEM_ID = PT.Product_Id;

----3) Find the item_description and Product having the gross sales of 13,320.00

SELECT * FROM PRODUCTS.[dbo].PRODUCT_Table WHERE Sales = 13320;

---4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2



























