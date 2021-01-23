USE RamenShop

-- 01
SELECT rd.RamenID, r.RamenName, CONVERT(VARCHAR,COUNT(rd.IngredientID)) +' Ingredients' AS 'Total Ingredient' 
FROM Ramen r, RecipeDetail rd, Ingredient i
WHERE r.RamenID = rd.RamenID AND
	  rd.IngredientID = i.IngredientID AND
	  i.IngredientStock < 25
GROUP BY r.RamenName, rd.RamenID
HAVING COUNT(rd.IngredientID) > 1

-- 02
SELECT 'Number of Sales' = COUNT(st.SalesTransID), c.CustomerName, LEFT(c.CustomerGender, 1) AS 'Gender', s.StaffName
FROM SalesTrans st, Customer c, Staff s
WHERE st.CustomerID = c.CustomerID AND
	  st.StaffID = s.StaffID AND
	  s.StaffGender = 'Female' AND DATEDIFF(YEAR, s.StaffDOB, c.CustomerDOB) > 5
GROUP BY c.CustomerName, s.StaffName, c.CustomerGender

--03
SELECT CONVERT(VARCHAR, pt.PurchaseTransDate, 103) AS 'Purchase Date', s.StaffName, su.SupplierName, COUNT(ptd.IngredientID) AS 'Total Ingredient', SUM(ptd.IngredientQty) AS 'Total Quantity'
FROM PurchaseTrans pt, Staff s, Supplier su, PurchaseTransDetail ptd
WHERE pt.StaffID = s.StaffID AND 
	  pt.SupplierID = su.SupplierID AND
	  ptd.PurchaseTransID = pt.PurchaseTransID AND
	  YEAR(pt.PurchaseTransDate) = '2016' AND
	  LEN(su.SupplierName) < 15
GROUP BY pt.PurchaseTransDate, s.StaffName, su.SupplierName

-- 04 
SELECT c.CustomerName, c.CustomerPhoneNum, DATENAME(weekday, st.TransDate) AS 'Sales Day',COUNT(std.RamenID) AS 'Variant Ramen Sold'
FROM Customer c, SalesTrans st, SalesTransDetail std
WHERE st.CustomerID = c.CustomerID AND
	  std.SalesTransID = st.SalesTransID AND
	  MONTH(st.TransDate) = '3'
GROUP BY c.CustomerName,c.CustomerPhoneNum,st.TransDate
HAVING SUM(std.RamenQty) > 10

-- 05
SELECT pt.PurchaseTransID AS 'PurchaseID', i.IngredientName AS 'RamenIngredientName', ptd.IngredientQty AS 'Quantity', s.StaffName, STUFF(s.StaffPhoneNum, 1, 1, '+62') AS 'Staff Phone', 'Rp' + CONVERT(VARCHAR, s.StaffSalary) AS 'Staff Salary'
FROM PurchaseTransDetail ptd
	 JOIN PurchaseTrans pt ON pt.PurchaseTransID = ptd.PurchaseTransID
	 JOIN Ingredient i ON i.IngredientID = ptd.IngredientID
	 JOIN Staff s ON s.StaffID = pt.StaffID,
		(SELECT Average = AVG(StaffSalary)
		 From Staff) AS Avrg
WHERE YEAR(pt.PurchaseTransDate) = '2017' AND  s.StaffSalary > Avrg.Average
GROUP BY pt.PurchaseTransID, i.IngredientName, ptd.IngredientQty, s.StaffName, s.StaffPhoneNum, s.StaffSalary


-- 06
SELECT REPLACE(s.StaffID, 'ST', 'Staff ') AS 'Staff ID', s.StaffName, CONVERT(VARCHAR, st.TransDate, 107) AS 'Sales Date', std.RamenQty AS 'Quantity'
FROM SalesTransDetail std
	 JOIN SalesTrans st ON st.SalesTransID = std.SalesTransID
	 JOIN Staff s ON s.StaffID = st.StaffID,
		(SELECT Average = AVG(StaffSalary)
		 FROM Staff) AS Avrg
WHERE LEN(s.StaffName) - LEN(REPLACE(s.StaffName, ' ', '')) > 1 AND
	  s.StaffSalary < Avrg.Average
GROUP BY s.StaffID, s.StaffName, st.TransDate, std.RamenQty


-- 07
SELECT 'Total Ramen Sold' = COUNT(std.RamenQty), 'Customer Last Name' =  RIGHT(c.CustomerName, LEN(c.CustomerName) - CHARINDEX (' ', c.CustomerName,1)), s.StaffName, st.TransDate
FROM SalesTransDetail std
	 JOIN SalesTrans st ON st.SalesTransID = std.SalesTransID
 	 JOIN Customer c ON c.CustomerID = st.CustomerID
	 JOIN Staff s ON s.StaffID = st.StaffID,
		(SELECT Average = AVG(RamenQty)
		 FROM SalesTransDetail) AS Avrg
WHERE std.RamenQty < Avrg.Average AND
	  LEN(LTRIM(RTRIM(c.CustomerName))) > 15
GROUP BY c.CustomerName, s.StaffName, st.TransDate


-- 08
SELECT st.SalesTransID, c.CustomerName, 'Gender' = LEFT(c.CustomerGender, 1), r.RamenName, 'Total Price' = CONVERT(VARCHAR,SUM(r.RamenPrice)) + ' IDR'
FROM SalesTransDetail std
JOIN SalesTrans st ON st.SalesTransID = std.SalesTransID
JOIN Customer c ON c.CustomerID = st.CustomerID
JOIN Ramen r ON  r.RamenID = std.RamenID,
	 (SELECT Minimum = MIN(RamenPrice)
	  FROM Ramen) AS m
WHERE r.RamenPrice >= m.Minimum AND DATEDIFF(YEAR, GETDATE(), c.CustomerDOB) < 17  
GROUP BY st.SalesTransID, c.CustomerName, c.CustomerGender, r.RamenName 


-- 09 
CREATE VIEW ViewSales AS
	SELECT c.CustomerName, 'Number of Sales' = COUNT(st.SalesTransID), 'Total Price' = SUM(r.RamenPrice * std.RamenQty)
	FROM SalesTransDetail std
		 JOIN Ramen r ON r.RamenID = std.RamenID
		 JOIN SalesTrans st ON st.SalesTransID = std.SalesTransID
		 JOIN Customer c ON c.CustomerID = st.CustomerID
	WHERE YEAR(st.TransDate) < 2017 AND c.CustomerAddress LIKE 'Pasar%'
	GROUP BY c.CustomerName

SELECT * FROM ViewSales


-- 10
CREATE VIEW PurchaseDetail AS
	SELECT 'Number of Item Purchased' = CONVERT(VARCHAR, SUM(ptd.IngredientQty)) + ' Pcs', 'Number of Transaction' = COUNT(pt.PurchaseTransID), sp.SupplierName, s.StaffName
	FROM PurchaseTransDetail ptd
		 JOIN PurchaseTrans pt ON pt.PurchaseTransID = ptd.PurchaseTransID
		 JOIN Staff s ON s.StaffID = pt.StaffID
		 JOIN Supplier sp ON sp.SupplierID = pt.SupplierID
	WHERE YEAR(pt.PurchaseTransDate) = 2016 AND StaffGender = 'Male' 
	GROUP BY sp.SupplierName, s.StaffName

SELECT * FROM PurchaseDetail