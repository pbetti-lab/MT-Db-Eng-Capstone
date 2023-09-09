USE littlelemondb;

# information about tables on all customers with orders that cost more than $150
SELECT * 
FROM (
	SELECT 
		c.Id AS CustomerId
		,concat(c.Name, " ", c.Surname) AS CustomerName
		,o.Id AS OrderId
		,sum(m.Cost) AS Cost
		,m.Name as MenuName
	FROM orders o
		INNER JOIN orders_has_menus ohm
			ON ohm.OrderId = o.Id
		 INNER JOIN menus m
			ON m.Id = ohm.MenuId
		INNER JOIN Customers c
			ON c.Id = o.Id
	GROUP BY o.Id, m.Name
) innerQ
WHERE innerQ.Cost > 150;
