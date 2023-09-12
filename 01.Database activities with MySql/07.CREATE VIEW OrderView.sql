USE littlelemondb;

# add a virtual table for orders with quantity greater than 2
CREATE VIEW OrdersWithQuantityGraterThen2View AS 
SELECT 
	o.Id AS OrderId
	,sum(od.Quantity) AS Quantity
	,sum(od.Cost) AS Cost
FROM orders o
	INNER JOIN OrderDetails od
		ON od.OrderId = o.Id
GROUP BY o.Id
HAVING sum(od.Quantity) > 2;

# check the new view
SELECT * FROM OrdersWithQuantityGraterThen2View;