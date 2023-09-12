USE LittleLemonDB;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking (
	IN __bookingId INT
	,IN __customerId INT
    ,IN __date DATE
    ,IN __tableNumber INT
    ,IN __guests INT)
BEGIN 
	DECLARE _bookingStateConfirmedId INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
		SELECT "Error. Unable to complete the request." AS Error;
        ROLLBACK;
    END;
	
	START TRANSACTION;		
		# get the confirmed state id
		SELECT Id INTO _bookingStateConfirmedId
		FROM BookingStates
		WHERE Name = "Confirmed";

		# insert new booking record
		INSERT INTO Bookings
		VALUES(__bookingId, __tableNumber, __guests, __date, __customerId, _bookingStateConfirmedId);
	COMMIT;
	SELECT "New booking added." AS "BookingStatus";
END //
DELIMITER ;

CALL AddBooking(10, 1, "2023-09-07", 8, 5); 
