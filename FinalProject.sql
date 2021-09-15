/******CREATING DATABASE******/

CREATE DATABASE PizzaPalace
GO
USE PizzaPalace
GO

/******CREATING TABLES******/

CREATE TABLE Addresses
	(AddressID		int			PRIMARY KEY IDENTITY,
	AddressNumber	varchar(50) NOT NULL,
	StreetName		varchar(50) NOT NULL,
	StreetType		varchar(50) NOT NULL,
	City			varchar(50) NOT NULL,
	State			varchar(50) NOT NULL,
	ZipCode			varchar(50) NOT NULL)
GO

CREATE TABLE Customers
	(CustomerID		int			PRIMARY KEY IDENTITY,
	FName			varchar(50) NOT NULL,
	LName			varchar(50) NOT NULL,
	PhoneNumber		varchar(50) NOT NULL,
	AddressID		int			NOT NULL REFERENCES Addresses (AddressID)) /*<--SETS FOREIGN KEY*/
GO

CREATE TABLE Employees
	(EmployeeID		int			PRIMARY KEY IDENTITY,
	FName			varchar(50) NOT NULL,
	LName			varchar(50) NOT NULL,
	PhoneNumber		varchar(50) NOT NULL,
	AddressID		int			NOT NULL REFERENCES Addresses (AddressID),
	HireDate		date		NOT NULL)
GO

CREATE TABLE Orders
	(OrderID		int			PRIMARY KEY IDENTITY,
	CustomerID		int			NOT NULL REFERENCES Customers (CustomerID),
	OrderDate		datetime	NOT NULL,
	EmployeeID		int			NOT NULL REFERENCES Employees (EmployeeID))
GO

CREATE TABLE OrderItems
	(OrderItemID	int		PRIMARY KEY IDENTITY,
	OrderID			int		NOT NULL REFERENCES Orders (OrderID),
	ProductID		int		NOT NULL,
	ItemPrice		money	NOT NULL,
	ItemQty			int		NOT NULL)
GO

/******INSERTING DATA INTO TABLES******/
INSERT INTO Addresses
VALUES 
	(N'8725', N'Beech', N'Dr', N'Roseville', N'MN', N'55114'),
	(N'8284', N'Arnold', N'Ave', N'Saint Paul', N'MN', N'55113'),
	(N'2', N'South Mulberry', N'Ln', N'Minneapolis', N'MN', N'55112'),
	(N'8809', N'Glen Eagles', N'Ave', N'Saint Paul', N'MN', N'55113'),
	(N'7729', N'East Pilgrim', N'Dr', N'Saint Paul', N'MN', N'55113'),
	(N'17', N'Boston', N'Dr', N'Roseville', N'MN', N'55114'),
	(N'93', N'Del MOnte', N'Cir', N'Minneapolis', N'MN', N'55112'),
	(N'510', N'James', N'Ave', N'Minneapolis', N'MN', N'55112'),
	(N'24', N'Purple Finch', N'St', N'Saint Paul', N'MN', N'55113'),
	(N'7326', N'Colonial', N'Ave', N'Roseville', N'MN', N'55114'),
	(N'61', N'Canal', N'Dr', N'Minneapolis', N'MN', N'55112'),
	(N'12', N'Strawberry', N'Ln', N'Roseville', N'MN', N'55114'),
	(N'887', N'Raymond', N'Ave', N'Saint Paul', N'MN', N'55113'),
	(N'3424', N'Chestnut', N'Dr', N'Saint Paul', N'MN', N'55113'),
	(N'998', N'University', N'Ave', N'Roseville', N'MN', N'55114'),
	(N'991', N'Yellow Brick', N'Rd', N'Minneapolis', N'MN', N'55112'),
	(N'787', N'Washington', N'Ave', N'Saint Paul', N'MN', N'55113'),
	(N'82923', N'Yankee Doodle', N'Rd', N'Saint Paul', N'MN', N'55113'),
	(N'34', N'Main', N'St', N'Roseville', N'MN', N'55114'),
	(N'292', N'Energy Park', N'Dr', N'Roseville', N'MN', N'55114')
GO

INSERT INTO Customers
VALUES
	(N'John', N'Smith', N'9525551212', 1),
	(N'Mary', N'Anderson', N'6518884575', 2),
	(N'Charlie', N'Decker', N'4532545292', 3),
	(N'Rosanna', N'Whitaker', N'7298138568', 4),
	(N'Rex', N'Fernandez', N'9651385195', 5),
	(N'Amber', N'Riley', N'2585236587', 6),
	(N'Ellen', N'Grey', N'7895832155', 7),
	(N'Dominic', N'Buchanan', N'9522145685', 8),
	(N'Stephanie', N'Mcintyre', N'4458428135', 9),
	(N'Zac', N'Chandler', N'2155254535', 10),
	(N'Elly', N'Mclaughlin', N'3872938447', 11),
	(N'Samuel', N'Shepard', N'9273405987', 12),
	(N'Camille', N'Rasmussen', N'2394578453', 13),
	(N'Xiaowei', N'Zheng', N'2093847590', 14),
	(N'Ivan', N'Allman', N'2349576908', 15),
	(N'Briana', N'Berk', N'2398456890', 11),
	(N'Renee', N'Leigh', N'9038745798', 17),
	(N'Sara', N'Prosser', N'9237598757', 4),
	(N'Owen', N'Olding', N'3448237578', 19),
	(N'Ferdinand', N'Gonzalez', N'4405384749', 2)
GO

INSERT INTO Employees
VALUES 
	(N'Robert', N'Beckman', N'8542313848', 14, CAST(N'1999-07-14' AS Date)),
	(N'Shane', N'Syrette', N'4455487235', 2, CAST(N'2016-11-17' AS Date)),
	(N'Lance', N'Bergstrom', N'8544578752', 16, CAST(N'1986-07-04' AS Date)),
	(N'Barbara', N'Walters', N'9521353546', 7, CAST(N'2010-02-03' AS Date)),
	(N'Becky', N'Beckman', N'7585481538', 14, CAST(N'2000-09-14' AS Date))
GO

INSERT INTO Orders
VALUES
	(12, CAST(N'2021-03-10T20:08:00.000' AS DateTime), 2),
	(1, CAST(N'2021-03-10T21:56:00.000' AS DateTime), 3),
	(14, CAST(N'2021-03-11T11:14:00.000' AS DateTime), 4),
	(6, CAST(N'2021-03-11T12:01:00.000' AS DateTime), 1),
	(7, CAST(N'2021-03-11T12:04:00.000' AS DateTime), 5)
GO


INSERT INTO OrderItems
VALUES
	(1, 1, 5.99, 2),
	(1, 2, 7.99, 1),
	(2, 4, 6.99, 1),
	(2, 3, 8.99, 2),
	(2, 2, 7.99, 1),
	(3, 5, 10.99, 1),
	(4, 4, 6.99, 3),
	(5, 5, 10.99, 4)
GO


/******CREATES FUNCTION THAT SEARCHES BY CUSTOMER NAME FOR THEIR ADDRESS******/
CREATE FUNCTION fnAddressLookup
	(@CustomerName varchar(50) = '%')
	RETURNS table
RETURN
	(SELECT CONCAT(c.FName, ' ', c.LName) AS Name, 
	CONCAT(a.AddressNumber, ' ', a.StreetName, ' ', a.StreetType, ' ', a.City, ' ', a.State, ' ', a.ZipCode) AS Address
	FROM Customers AS c JOIN Addresses AS a ON c.AddressId = a.AddressID
	WHERE FName LIKE @CustomerName OR LName LIKE @CustomerName)
GO

USE PizzaPalace;
GO
--VIEW THAT SHOWS COLUMN INFORMATION FROM TWO RELATED TABLES USING JOIN--
CREATE VIEW CustomerAddresses
AS
SELECT FName, LName, PhoneNumber, AddressNumber, 
StreetName, StreetType, City, State, ZipCode
FROM Customers JOIN Addresses 
ON Customers.AddressID = Addresses.AddressID;
GO
--VIEW FOR EMPLOYEES TABLE--
CREATE VIEW EmployeePhone
AS
SELECT EmployeeID, FName, LName, PhoneNumber
FROM Employees;
GO
--VIEW FOR ORDERS TABLE--
CREATE VIEW OrderList
AS 
SELECT OrderDate, OrderID, CustomerID, EmployeeID
FROM Orders;
GO
--VIEW FOR ADDRESSES TABLE--
CREATE VIEW MplsAddresses
AS
SELECT AddressID, AddressNumber, StreetName, StreetType, ZipCode
FROM Addresses
WHERE City = 'Minneapolis';
GO
--VIEW FOR CUSTOMERS TABLE--
CREATE VIEW CustomerPhone
AS
SELECT CustomerID, FName, LName, PhoneNumber
FROM Customers;
GO
--VIEW FOR ORDERITEMS TABLE--
CREATE VIEW OrderItemsOver10
AS
SELECT *
FROM OrderItems
WHERE ItemPrice > 10;
GO
--QUERY USING DATA FROM 2+ TABLES WITH CALCULATED FIELDS & GROUP BY/HAVING--
SELECT o.OrderID, FName, LName, PhoneNumber, SUM(ItemPrice * ItemQty) AS OrderPrice
FROM Customers AS c
	JOIN Orders AS o ON c.CustomerID = o.CustomerID
	JOIN OrderItems AS oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID, FName, LName, PhoneNumber
HAVING SUM(ItemPrice * ItemQty) > 10
ORDER BY SUM(ItemPrice * ItemQty) DESC;
GO
--QUERY USING DATA FROM 2+ TABLES WITH CALCULATED FIELDS--
SELECT CustomerID, AVG(ItemPrice * ItemQty) AS AverageOrderPrice
FROM Orders JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID
GROUP BY Orders.CustomerID, Orders.OrderID
ORDER BY AVG(ItemPrice * ItemQty) DESC;
GO
--STORED PROCEDURE RETURNS EMPLOYEE CONTACT INFO--
CREATE PROC spEmployeeInfo
AS

SELECT LName, FName, EmployeeID, PhoneNumber,
CONCAT(AddressNumber,' ', StreetName, ' ', StreetType, ' ', City, ' ', State, ' ', ZipCode) AS Address, HireDate
FROM Employees JOIN Addresses 
ON Employees.AddressID = Addresses.AddressID
ORDER BY LName;