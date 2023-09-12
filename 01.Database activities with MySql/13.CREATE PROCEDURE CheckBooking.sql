USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN __date DATE, IN __tableNumber INT)
BEGIN 
	DECLARE _tableBookedCount INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
		SELECT "Error. Unable to complete the request." AS Error;
        ROLLBACK;
    END;
	
	START TRANSACTION;		
		SELECT count(*) INTO _tableBookedCount
		FROM Bookings b
		WHERE b.Date = __date
			AND b.TableNumber = __tableNumber
			AND BookingStateId = (
				SELECT Id
                FROM BookingStates
                WHERE Name = "Confirmed"
            );
		
		SELECT 
			CASE 
				WHEN _tableBookedCount = 0 THEN concat("Table ", __tableNumber, " is available")
				ELSE concat("Table ", __tableNumber, " is NOT available")
			END AS BookingStatus;
	COMMIT;
END //
DELIMITER ;


CALL CheckBooking("2023-09-07", 3); -- result: "Table 3 is NOT available"    
    
CALL CheckBooking("2023-09-07", 6); -- result: "Table 6 is available"
