/* увеличили стоимость аренды корта 1 (facid=0) на 10% для членов и гостей */
USE cd;
UPDATE facilities
SET membercost = membercost * 1.1, guestcost = guestcost * 1.1
WHERE facid = 0;
SELECT * FROM facilities;