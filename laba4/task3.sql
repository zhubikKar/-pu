/* добавляем еще одно спа с такими же характеристиками как в задании 1, сгенерировав новое айди */
USE cd;
INSERT facilities
SELECT (SELECT MAX(facid)+1 FROM facilities), facility, membercost, guestcost, initialoutlay, monthlymaintenance FROM facilities 
WHERE facility = 'spa' LIMIT 1;
SELECT * FROM facilities;