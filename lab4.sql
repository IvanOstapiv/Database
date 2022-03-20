1. Заповнити таблиці вашої БД в режимі одиночного і групового доповнення.
INSERT INTO clinic VALUES (7, 'Олександр`', 'Берзар', 'Олександрович', '18', 'Програміст', 'Чернівці', 'Бульвар', '101', '380982231143', 'sasha@gmail.com'),;

2. Створити файли з даними (будь-якого сумісного типу) і заповнити ними решту таблиць баз
даних шляхом імпорту.
LOAD DATA INFILE 'd:\clinic.txt' INTO TABLE clinic LINES
TERMINATED BY '\r\n';


3. Виконати модифікацію значень у будь-яких таблицях БД для одного поля та групи полів за
певною умовою.
UPDATE clinic SET number_house = '10'
WHERE city = 'Чернівці';

UPDATE clinic SET clinicID  = clinicID + 1
ORDER BY clinicID DESC;


4. Видалити записи з таблиць вашої БД.

DELETE FROM clinic
WHERE (number_house>62 && number_house<80);