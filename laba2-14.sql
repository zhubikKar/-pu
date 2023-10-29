/* Выберите самый дорогой и самый дешевый объект.*/
USE cd;
SELECT max(monthlymaintenance), 'дорогой' FROM facilities;
SELECT facility,'дешевый' FROM facilities WHERE monthlymaintenance = (SELECT max(monthlymaintenance) FROM facilities)
OR monthlymaintenance = (SELECT min(monthlymaintenance) FROM facilities);