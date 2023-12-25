/*Напишите функцию, которая будет рассчитывать увеличение/уменьшение
стоимость аренды объекта на последующие месяцы  для изменения
( увеличения или уменьшения) срока окупаемость на заданную долю
(в процентах) на основании расчета окупаемости за уже оплаченные периоды.
Сохраните расчет в виде csv или sql файла (например, используя временные таблицы). */

USE cd;

DELIMITER //

DROP FUNCTION IF EXISTS changing_occupate //
CREATE FUNCTION changing_occupate(facid INT, source FLOAT, sroktime TIMESTAMP)
    RETURNS DECIMAL(10, 2)
    READS SQL DATA
    NOT DETERMINISTIC
BEGIN
    DECLARE revenue DECIMAL(10, 2);
    DECLARE maintenance DECIMAL(10, 2);
    DECLARE clear_revenue DECIMAL(10, 2);
    DECLARE cost DECIMAL(10, 2);

    SELECT SUM(p.payment) INTO revenue
    FROM payments AS p
    JOIN bookings AS b ON b.bookid = p.bookid
    JOIN facilities AS f ON b.facid = f.facid
    WHERE facid = b.facid AND b.starttime <= sroktime
    GROUP BY b.facid;

    IF revenue IS NULL THEN
        RETURN 1;
    END IF;

    /*Расчет расходов за все время с точностью до дня*/
    SELECT f.monthlymaintenance * (MONTH(sroktime) - MONTH(MIN(b.starttime)) + 1) INTO maintenance
    FROM facilities AS f
    JOIN bookings AS b ON b.facid = f.facid
    WHERE facid = b.facid
    GROUP BY b.facid;

   /*Начальная стоимость*/
    SELECT f.initialoutlay INTO cost
    FROM facilities AS f
    WHERE facid = f.facid
    LIMIT 1;

   /*Прибыль*/
    SET clear_revenue = (revenue - maintenance);

    /*Проверка оккупаемости*/
    IF clear_revenue <= 0 OR cost <= clear_revenue THEN
        RETURN 1;
    END IF;

    /*Коэффициент стоимости аренды*/
    RETURN ((1 / source) * (cost - clear_revenue) / cost * (1 - maintenance / revenue) + maintenance / revenue);
END //

DELIMITER ;

/*Сохранение данных в CSV-файл.*/
SELECT changing_occupate(2, 4, '2012-07-31-23:59:59')
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/func01.csv' 
    FIELDS ENCLOSED BY '"' 
    TERMINATED BY ';' 
    ESCAPED BY '"' 
    LINES TERMINATED BY '\r\n';
