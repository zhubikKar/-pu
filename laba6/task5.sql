/*Выведите наименования всех объектов клуба заглавными буквами, 
если они содержат в названии слово ‘Tennis’*/
USE cd;
SELECT upper(facility) AS объекты_клуба FROM facilities WHERE facility LIKE '%Tennis%';