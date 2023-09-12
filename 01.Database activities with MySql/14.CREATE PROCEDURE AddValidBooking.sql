USE LittleLemonDB;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(
	IN __date DATE
    ,IN __tableNumber INT
    ,IN __guests INT
    ,IN __customerId INT)
BEGIN 
	DECLARE _bookingStateConfirmedId INT;
	DECLARE _newBookingId INT;
	DECLARE _tableBookedCount INT;

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

	# get the new booking id
    SELECT max(Id) + 1 INTO _newBookingId
    FROM Bookings;
    
    # insert new booking record
    INSERT INTO Bookings
    VALUES(_newBookingId, __tableNumber, __guests, __date, __customerId, _bookingStateConfirmedId);
	
    # check for integrity
	SELECT count(*) INTO _tableBookedCount
	FROM Bookings b
	WHERE b.Date = __date
		AND b.TableNumber = __tableNumber
		AND BookingStateId = _bookingStateConfirmedId;
    
    IF _tableBookedCount = 1 THEN
		COMMIT;
        SELECT concat("Table ", __tableNumber, " is free - booking confirmed.") AS "BookingStatus";
	ELSE
		ROLLBACK;
        SELECT concat("Table ", __tableNumber, " is alredy booked - booking cancelled.") AS "BookingStatus";
	END IF;
END //
DELIMITER ;


CALL AddValidBooking("2023-09-07", 5, 3, 1); -- result: "Table 5 is alredy booked - booking cancelled."

CALL AddValidBooking("2023-09-07", 7, 3, 1); -- result: "Table 7 is free - booking confirmed."

