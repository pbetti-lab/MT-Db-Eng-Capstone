USE littlelemondb;

# information about all menu for which more than 2 orders have been placed
SELECT * 
FROM (
	SELECT
		count(m.Id) AS OrderedMenu
		,m.Name
	FROM Orders_has_Menus ohm
		JOIN Menus m
			ON m.Id = ohm.MenuId
	GROUP BY m.Id, m.Name
) innerQ
WHERE innerQ.OrderedMenu > 2

