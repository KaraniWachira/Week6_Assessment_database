
--query to retrieve the list of orders
-- with CustomerName CustomerID
-- StaffName StaffID  
-- Order asso with OrderID


SELECT o.CustomerName, o.CustomerID, o.StaffID, s.StaffName, o.OrderID
FROM myhotel.Orders AS O 
INNER JOIN myhotel.Customers AS c 
ON o.CustomerID = c.CustomerID 
INNER JOIN myhotel.Staff AS s 
ON o.StaffID = s.StaffId


-- a view that returns the total quantity 
-- sales amount for each product

CREATE VIEW myhotel.ProductSales
AS 
SELECT Product_Name,
       Product_ID,
       Total_Quantity,
       Price_per_unit
       Total_Sales = (Total_Quantity * Price_per_unit)
FROM myhotel.Products
GROUP BY Product_Name, Product_ID, Total_Sales


-- stored procedure to accept: CustomerID, TotalOrders
-- OrderID, CustomerID

CREATE PROCEDURE myhotel.TotalOrders (
    @CustomerID INT
)
AS BEGIN 
DECLARE
@TotalOrders INT;
SELECT @TotalOrders = COUNT(*)
FROM myhotel.Orders
WHERE @CustomerID = @CustomerID;

RETURN @TotalOrders;


--
-- query to find the top 5 customer
-- who placed the most orders

SELECT
 CustomerID,
 CustomerName
COUNT (OrderID) AS TotalOrders
FROM myhotel,Orders
GROUP BY 
CustomerID, CustomerName
ORDER BY 
 TotalOrders DESC 
 LIMIT 5; 



 -- A View that shows the product details 
 -- with the total sales quantity & revenue for each product

 CREATE VIEW myhotel.ProductSales
 AS
 SELECT
 p.ProductID,
 p.ProductName,
 p.Quantity,
 p.Price,
 SUM (0.Quantity) AS TotaSalesQuantity,
 SUM (o.Quantity * Price) AS TotalSalesRevenue
 FROM myhotel.Products AS p 
 INNER JOIN myhotel.Orders AS o 
 ON p.ProductID
 GROUP BY
 p.ProductID
 p.ProductName
 p.Quantity
 p.Price

--view the product details

SELECT 
productID
productName
TotalSalesQuantity
TotalSalesRevenue
FROM myhotel.ProductSales
ORDER BY
TotalSalesRevenue ASC














