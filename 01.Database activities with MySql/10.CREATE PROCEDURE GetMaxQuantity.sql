USE LittleLemonDB;

DROP PROCEDURE IF EXISTS GetMaxQuantity;

CREATE PROCEDURE GetMaxQuantity()
SELECT 
	max(Quantity) as MaxQuantityInOrders
FROM OrderDetails;

CALL GetMaxQuantity();
