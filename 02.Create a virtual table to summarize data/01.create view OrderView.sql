USE littlelemondb;

# add a view with order detais like quantity and costs
CREATE VIEW OrderView AS 
SELECT 
	o.Id AS OrderId
	,sum(ohm.Quantity) AS Quantity
    ,sum(m.Cost) AS Cost
FROM orders o
	INNER JOIN orders_has_menus ohm
	 	ON ohm.OrderId = o.Id
	 INNER JOIN menus m
	 	ON m.Id = ohm.MenuId
GROUP BY o.Id;

