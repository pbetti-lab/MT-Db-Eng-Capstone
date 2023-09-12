USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(IN __bookingId INT)
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
			DELETE 
            FROM Bookings
			WHERE Id = __bookingId;
			
			SELECT concat("Booking ", __bookingId, " cancelled") AS Confirmation;
		ELSE
			SELECT concat("Booking ", __bookingId, " not found. Unable to cancel booking") AS Confirmation;
		END IF;
	COMMIT;
END //
DELIMITER ;

CALL CancelBooking(10); 
