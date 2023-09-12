USE LittleLemonDB;

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN __bookingId INT, IN __date DATE)
BEGIN 
	DECLARE _bookingIdExist BOOLEAN;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
		SELECT "Error. Unable to complete the request." AS Error;
        ROLLBACK;
    END;
	
	START TRANSACTION;		
		# check if booking id exist
		SELECT count(*) = 1 INTO _bookingIdExist 
		FROM Bookings
		WHERE Id = __bookingId;

		# update booking if exists
		IF _bookingIdExist = TRUE THEN
			UPDATE Bookings
			SET Date = __date
			WHERE Id = __bookingId;
			
			SELECT concat("Booking ", __bookingId, " updated") AS Confirmation;
		ELSE
			SELECT concat("Booking ", __bookingId, " not found. Unable to update booking") AS Confirmation;
		END IF;
	COMMIT;
END //
DELIMITER ;

CALL UpdateBooking(10, "2023-09-15"); 
