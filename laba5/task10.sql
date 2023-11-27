/*Создайте список общего количества мест, забронированных на один объект 
в месяц в 2012 году. Включите выходные строки, содержащие итоговые суммы 
за все месяцы по каждому объекту а также итоговые суммы за все месяцы для 
всех объектов. Выходная таблица должна состоять из идентификатора объекта, 
месяца и слотов, отсортированных по идентификатору и месяцу. При вычислении 
агрегированных значений для всех месяцев и всех facid возвращайте нулевые 
значения в столбцах месяца и facid.*/
USE cd; 
SELECT 	IFNULL(table1.facid, 'Total') AS facid, IFNULL(table1.Month, 'Total') AS Month, SUM(table1.slots) AS 'Количество броней' 
FROM (SELECT f.facid AS facid, MONTH(b.starttime) AS month, SUM(b.slots) AS slots
FROM facilities AS f
INNER JOIN bookings book ON f.facid = b.facid
WHERE YEAR(b.starttime) = 2012 
GROUP BY facid, Month, slots) AS table1
GROUP BY facid, Month WITH ROLLUP;