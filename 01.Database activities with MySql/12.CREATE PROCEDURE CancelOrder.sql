USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN __orderId INT)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
		SET foreign_key_checks = 1;
		SELECT "Error. Unable to complete the request." AS Error;
        ROLLBACK;
    END;

	START TRANSACTION;		
		DELETE 
        FROM OrderDetails 
        WHERE OrderId = __orderId;
		
		SET foreign_key_checks = 0;

		DELETE 
		FROM DeliveryDetails
		WHERE Id = (
			SELECT DeliveryDetailsId
			FROM Orders
			WHERE Id = __orderId
		);
        
        SET foreign_key_checks = 1;

		DELETE 
		FROM Orders
		WHERE Id = __orderId;
	COMMIT;
END //
DELIMITER ;

SET @orderId = 5;
CALL CancelOrder(@orderId);

SELECT * 
FROM OrderDetails od
    INNER JOIN Orders o
		ON o.Id = od.OrderId
	INNER JOIN DeliveryDetails dd
		ON dd.Id = o.DeliveryDetailsId
WHERE OrderId != @orderId;
