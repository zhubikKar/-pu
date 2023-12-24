/*Создайте таблицу payments со структурой (payid INT PK, FK on booking.bookid; payment  DECIMAL.)*/
USE cd;
CREATE TABLE payments (
  payid INT PRIMARY KEY AUTO_INCREMENT,
  bookid INT,
  payment DECIMAL,
  FOREIGN KEY (bookid) REFERENCES cd.bookings(bookid)
);

/*Добавьте в таблицу bookings поле payed, смысл которого оплачена или не оплачена аренда.*/

ALTER TABLE bookings ADD COLUMN payed TINYINT DEFAULT 0;

/*Создайте триггеры, которые: 1) Запрещают удаление записей, если они уже оплачены;*/

DELIMITER //

DROP TRIGGER IF EXISTS delete_payment //
CREATE TRIGGER delete_payment 
BEFORE DELETE ON bookings 
FOR EACH ROW 
BEGIN
  IF (OLD.payed = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You can not delete a paid booking!';
  END IF;
END//

DELIMITER ;

/*2) После отметки оплаты, заносят в таблицу payments запись с соответствующим значением PK 
и суммой оплаты, для вычисления которой используется функция созданная в Task-7-1.*/
/*3) При отмене оплаты - удаляет соответствующую запись в таблице payments.*/
DELIMITER //
DROP TRIGGER IF EXISTS payment_cell //
CREATE TRIGGER payment_cell 
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    CASE
        WHEN NEW.payed = OLD.payed THEN BEGIN END;
        WHEN NEW.payed = 1 THEN
            INSERT INTO payments(bookid, payment)
            VALUES(NEW.bookid, Calculater(NEW.memid, NEW.facid, NEW.slots));
        WHEN NEW.payed = 0 THEN
            DELETE FROM payments AS p WHERE p.bookid = NEW.bookid;
    END CASE;
END //

/*В данном триггере мы заполняем таблицу payments, соответственно функции Task 7-1 и соответствующим bookid*/

DROP TRIGGER IF EXISTS payment_bookid //
CREATE TRIGGER payment_bookid 
AFTER INSERT ON bookings 
FOR EACH ROW
BEGIN
    IF NEW.payed = 1 THEN
        INSERT INTO payments(bookid, payment)
        VALUES(NEW.bookid, Calculater(NEW.memid, NEW.facid, NEW.slots));
    END IF;
END //

DELIMITER ;
/*Напишите скрипт, который отмечает, что все аренды июля 2012 года оплачены.*/

UPDATE bookings 
SET payed = 1
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;

/*Посчитайте (написав соответствующий скрипт) оплату на июль 2012 года двумя способами: 1) используя данные таблицы payments*/

SELECT SUM(payment) as paymentJuly1
FROM payments;

/*2) используя только функцию из Task-7-1 и данные таблицы bookings.*/

SELECT SUM(Calculater(memid, facid, slots)) as paymentJuly2
FROM bookings 
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;

/*Вывод: при подсчете paymentJuly1 и paymentJuly2 выдали одинаковые значения*/