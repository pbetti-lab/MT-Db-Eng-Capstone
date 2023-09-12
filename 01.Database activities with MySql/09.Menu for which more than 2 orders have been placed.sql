USE littlelemondb;

# information about all menu for which more than 2 orders have been placed
SELECT
	m.Name
FROM OrderDetails od
	INNER JOIN Menus m
		ON m.Id = od.MenuId
GROUP BY od.MenuId
HAVING Count(od.MenuId) > 2
ORDER BY od.MenuId;
