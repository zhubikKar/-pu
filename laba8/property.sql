USE property;

INSERT INTO Owners
    (ID, firstname, surname, email, telegram, vk)
VALUES
    (0, 'Arina', 'Bikova', 'bikova58@gmail.com', '@bik5858', 'vk.com/bikova'),
    (1, 'Zlata', 'Horosheva', 'zoloto_h@yandex.ru', '@15436zol', 'vk.com/zoloto'),
    (2, 'Maksim', 'Strelkov', 'strelec1999@gmail.com', '@max100500', 'vk.com/strelec'),
    (3, 'Ivan', 'Ivanov', 'pepel_i_ogon@mail.ru', '@ivanovka', 'vk.com/ivanovka');

INSERT INTO Realtor
    (ID, firstname, surname, email, telegram, vk)
VALUES
    (0, 'Vasiliy', 'Sorokin', 'sorroka_23@mail.ru', '@sorroka', 'vk.com/sorrroka23'),
    (1, 'Ilya', 'Nikolaev', 'samara2001@yandex.ru', '@nikaolau', 'vk.com/nikolaisamara1987'),
    (2, 'Marina', 'Brekhova', 'sbrekh@gmail.com', '@masah65', 'vk.com/masha565');

INSERT INTO Apartment
    (ID, ownersID, full_area, live_area, kitchen_size, rooms, address, apartment_floors, floor, cost, register_date, update_date)
VALUES
    (0, 0, 24, 16, 4, 1, 'Samara, Karl Marx street, h. 75, ent. 3, 4 floor, 407 room', 7, 4, 24000000, '2007-03-11', '2012-03-01'),
    (1, 2, 18, 11, 3, 1, 'Samara, Samarskaya street, h. 62, ent. 2, 2 floor, 501 room', 9, 2, 20500000, '2010-01-05', '2011-05-10'),
    (2, 1, 46, 34, 8, 2, 'Samara, Revoluchionnaya street, h. 19, ent. 1, 5 floor, 501 room', 5, 4, 73800000, '2011-01-05', '2010-11-30'),
    (3, 2, 28, 16, 5, 2, 'Samara, Karl Marx street, h. 13, ent. 1, 5 floor, 503 room', 5, 4, 33000000, '2009-05-11', '2010-07-02'),
    (4, 3, 24, 14, 4, 2, 'Samara, Polevaya street, h. 27, ent. 1, 5 floor, 504 room', 5, 4, 30000000, '2009-05-11', '2009-05-11');

INSERT INTO Apartment_Realtors
    (apartmentID, realtorID)
VALUES
    (0, 2),
    (1, 0),
    (2, 2),
    (3, 1),
    (4, 0),
    (4, 1);
