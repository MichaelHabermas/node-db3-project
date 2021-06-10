-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName 
FROM product as p
JOIN Category as c ON p.CategoryId = c.id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, companyName, OrderDate
FROM [Order] AS o
JOIN shipper As s
    ON o.ShipVia = s.id
WHERE OrderDate < '2012-08-09'
ORDER BY OrderDate
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Id, ProductName, Quantity 
FROM [Order] AS o
JOIN OrderDetail as od
    ON o.Id = od.OrderId
JOIN Product as p
    ON od.ProductId = p.Id
WHERE o.Id = 10251
ORDER BY ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id as OrderID ,CompanyName, LastName
from [order] as o
join customer as c
    on o.customerid = c.id
join employee as e
    on o.employeeid = e.id;