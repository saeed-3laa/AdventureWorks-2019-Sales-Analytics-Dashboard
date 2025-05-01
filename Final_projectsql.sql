--Explor

select * from sales.SalesOrderDetail

select * from sales.SalesOrderHeader

SELECT 
    -- Order Details
    sd.SalesOrderDetailID AS OrderDetailID,
    sh.SalesOrderID AS OrderID,
    sh.OrderDate,
    sh.DueDate,
    sh.ShipDate,
    sh.Status AS StatusID,
    sh.Status,  
    sh.OnlineOrderFlag,

    -- Customer Information
	P.BusinessEntityID,
	p.FirstName,
	p.LastName,
	p.PersonType,
    sp.Name AS StateName,
    cr.CountryRegionCode,
    cr.Name AS CountryName,

    -- Sales Person and Territory
    sh.SalesPersonID,
    sh.TerritoryID,
    st.Name AS Territory,
    st.[Group] AS TerritoryGroup,

    -- Shipping Information
    sm.ShipMethodID,
    sm.Name AS ShipMethod,

    -- Product Information
    pp.ProductID,
    pp.Name AS Product,
    psc.Name AS ProductSubCategory,
    pc.Name AS ProductCategory,

    -- Pricing and Quantity
    sd.OrderQty,
    sd.UnitPrice,
    sd.LineTotal,
    sh.TaxAmt,
    sh.Freight,
    sh.TotalDue
FROM 
    Sales.SalesOrderHeader sh
JOIN 
    Sales.SalesOrderDetail sd ON sh.SalesOrderID = sd.SalesOrderID
JOIN 
    Sales.SalesTerritory st ON sh.TerritoryID = st.TerritoryID
JOIN 
    Purchasing.ShipMethod sm ON sm.ShipMethodID = sh.ShipMethodID
JOIN 
    Production.Product pp ON pp.ProductID = sd.ProductID
JOIN 
    Production.ProductSubcategory psc ON pp.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN 
    Sales.Customer SC ON sh.CustomerID = SC.CustomerID
JOIN 
    Person.Person P ON SC.CustomerID = P.BusinessEntityID
left JOIN 
    Person.BusinessEntityAddress bea ON P.BusinessEntityID = bea.BusinessEntityID
left JOIN 
    Person.Address a ON bea.AddressID = a.AddressID
left JOIN 
    Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
left JOIN 
    Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode;

Alter VIEW vw AS
SELECT 
    -- Order Details
    sd.SalesOrderDetailID AS OrderDetailID,
    sh.SalesOrderID AS OrderID,
    sh.OrderDate,
    sh.DueDate,
    sh.ShipDate,
    sh.Status AS StatusID,
    sh.Status,  
    sh.OnlineOrderFlag,

    -- Customer Information
	P.BusinessEntityID,
	p.FirstName,
	p.LastName,
	p.PersonType,


    -- Sales Person and Territory
    sh.SalesPersonID,
    sh.TerritoryID,
    st.Name AS Territory,
    st.[Group] AS TerritoryGroup,

    -- Shipping Information
    sm.ShipMethodID,
    sm.Name AS ShipMethod,

    -- Product Information
    pp.ProductID,
    pp.Name AS Product,
    psc.Name AS ProductSubCategory,
    pc.Name AS ProductCategory,

    -- Pricing and Quantity
    sd.OrderQty,
    sd.UnitPrice,
    sd.LineTotal,
    sh.TaxAmt,
    sh.Freight,
    sh.TotalDue
FROM 
    Sales.SalesOrderHeader sh
JOIN 
    Sales.SalesOrderDetail sd ON sh.SalesOrderID = sd.SalesOrderID
JOIN 
    Sales.SalesTerritory st ON sh.TerritoryID = st.TerritoryID
JOIN 
    Purchasing.ShipMethod sm ON sm.ShipMethodID = sh.ShipMethodID
JOIN 
    Production.Product pp ON pp.ProductID = sd.ProductID
JOIN 
    Production.ProductSubcategory psc ON pp.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN 
    Sales.Customer SC ON sh.CustomerID = SC.CustomerID
JOIN 
    Person.Person P ON SC.PersonID = P.BusinessEntityID





