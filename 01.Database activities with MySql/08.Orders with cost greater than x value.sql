USE littlelemondb;

# information about orders that cost more than $150
SELECT 
	cust.Id
    ,cust.FullName
    ,od.OrderId
    ,sum(od.Cost) AS Cost
    ,LEFT(group_concat(m.Name, ', '), char_length(group_concat(m.Name, ', ')) - 2) as Menus
    ,LEFT(group_concat(crs.Name, ', '), char_length(group_concat(crs.Name, ', ')) - 2) as Courses
FROM OrderDetails od
    INNER JOIN Menus m
		on m.Id = od.MenuId
    INNER JOIN Courses crs
		ON crs.Id = m.CourseId
	INNER JOIN Orders o 
		ON o.Id = od.OrderId
	INNER JOIN Customers cust
		ON cust.Id = o.CustomerId
GROUP BY od.OrderId
HAVING sum(od.Cost) > 150
ORDER BY Cost ASC;
