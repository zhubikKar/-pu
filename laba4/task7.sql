/* Удалите все записи об аренде объектов в транзакции, выведите список аренд,
завершите транзакция с отказом от всех произведенных изменений. Повторите запрос списка аренд. Сравните результат. */
USE cd;
START TRANSACTION;
DELETE FROM bookings;
SELECT * FROM bookings;
ROLLBACK;
SELECT * FROM bookings;