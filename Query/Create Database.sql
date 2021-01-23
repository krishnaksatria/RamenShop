CREATE DATABASE RamenShop

USE RamenShop

CREATE TABLE Customer(
	CustomerID CHAR(5) NOT NULL PRIMARY KEY 
		CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50),
	CustomerDOB DATE,
	CustomerGender VARCHAR(6)
		CHECK(CustomerGender IN('Male','Female')),
	CustomerAddress VARCHAR(50)
		CHECK(CustomerAddress LIKE '% Street'),
	CustomerPhoneNum VARCHAR(15)
)

CREATE TABLE Staff(
	StaffID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50),
	StaffGender VARCHAR(10)
		CHECK(StaffGender IN('Male','Female')),
	StaffDOB DATE,
	StaffPhoneNum VARCHAR(15),
	StaffAddress VARCHAR(100)
		CHECK(StaffAddress LIKE '% Street'),
	StaffSalary INT
		CHECK(StaffSalary >= 1500000 AND StaffSalary <= 3500000)
)

CREATE TABLE Ramen(
	RamenID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(RamenID LIKE 'RA[0-9][0-9][0-9]'),
	RamenName VARCHAR(50),
		CHECK(RamenName LIKE '% %'),
	RamenPrice INT
)

CREATE TABLE Supplier(
	SupplierID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(SupplierID LIKE 'SP[0-9][0-9][0-9]'),
	SupplierName VARCHAR(50)
		CHECK(LEN(SupplierName) >= 5 AND LEN(SupplierName) <= 50),
	SupplierAddress VARCHAR(100)
		CHECK(SupplierAddress LIKE '% Street'),
	SupplierPhone VARCHAR(15)
)

CREATE TABLE Ingredient(
	IngredientID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(IngredientID LIKE 'RI[0-9][0-9][0-9]'),
	IngredientName VARCHAR(50),
	IngredientStock INT,
)

CREATE TABLE RecipeDetail(
	RamenID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Ramen(RamenID),
	IngredientID CHAR(5) NOT NULL 
		FOREIGN KEY REFERENCES Ingredient(IngredientID),
	IngredientQty INT
)

CREATE TABLE SalesTrans(
	SalesTransID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(SalesTransID LIKE 'SL[0-9][0-9][0-9]'),
	StaffID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Staff(StaffID),
	CustomerID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Customer(CustomerID),
	TransDate DATE
)

CREATE TABLE PurchaseTrans(
	PurchaseTransID CHAR(5) NOT NULL PRIMARY KEY
		CHECK(PurchaseTransID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Staff(StaffID),
	SupplierID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Supplier(SupplierID),
	PurchaseTransDate DATE
)

CREATE TABLE SalesTransDetail(
	SalesTransID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES SalesTrans(SalesTransID),
	RamenID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Ramen(RamenID),
	RamenQty INT NOT NULL,
	PRIMARY KEY(SalesTransID, RamenID)
)

CREATE TABLE PurchaseTransDetail(
	PurchaseTransID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES PurchaseTrans(PurchaseTransID),
	IngredientID CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES Ingredient(IngredientID),
	IngredientQty INT NOT NULL,
	PRIMARY KEY(PurchaseTransID, IngredientID)	
)