USE LittleLemonDB;

PREPARE GetOrderDetailsById 
FROM "
	SELECT 
		OrderId 
        ,Quantity 
        ,Cost 
	FROM OrderDetails 
    WHERE OrderId = ?
";

SET @Id = 4;
EXECUTE GetOrderDetailsById USING @Id;