-- Sales Transction
BEGIN TRAN
INSERT INTO SalesTrans VALUES ('SL006', 'CU001', 'ST005', '12/19/2017')
INSERT INTO SalesTransDetail VALUES ('SL006', 'RA001', 6)
ROLLBACK

BEGIN TRAN
UPDATE Ingredient 
SET IngredientStock = IngredientStock - 6
FROM Ingredient 
WHERE IngredientID = 'RI002'

UPDATE Ingredient 
SET IngredientStock = IngredientStock - 6
FROM Ingredient 
WHERE IngredientID = 'RI005'
ROLLBACK

--Purchase Transaction
BEGIN TRAN
INSERT INTO PurchaseTrans VALUES ('PU015', 'ST002', 'SP010', '12/31/2019')
INSERT INTO PurchaseTransDetail VALUES ('PU001', 'RI006', 2)
ROLLBACK 

BEGIN TRAN
UPDATE Ingredient 
SET IngredientStock = IngredientStock + 2 
FROM Ingredient 
WHERE IngredientID = 'RI007'
ROLLBACK