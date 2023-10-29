/*вывод объектов, пользование которых платно, 
то есть membercost > 0 */
SELECT * FROM cd.facilities
WHERE membercost > 0;