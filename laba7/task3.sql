/*Напишите процедуру, которая считает окупаемость каждого объекта
 клуба на основании оплаты аренд за месяц. Применить ее к июлю 2012 года. */
USE cd;
DELIMITER //
DROP PROCEDURE IF EXISTS paymentin //
CREATE PROCEDURE paymentin(yourdate DATE)
  BEGIN
    SELECT IF (SUM(p.payment) - f.monthlymaintenance = 0, 798987979,
            f.initialoutlay / (SUM(p.payment) - f.monthlymaintenance)) AS occupate
	FROM bookings AS b
	INNER JOIN payments AS p ON b.bookid = p.bookid
	INNER JOIN facilities AS f ON b.facid = f.facid
	WHERE DATE_FORMAT(starttime, '%y %m') = DATE_FORMAT(yourdate, '%y %m')
	GROUP BY b.facid 
    ORDER BY b.facid;
  END //
DELIMITER ;

CALL paymentin('2012-07-01');