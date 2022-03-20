1. Запит на виконання проекції (відображення) для таблиць вашої БД.

CREATE VIEW employees2 AS SELECT DISTINCT employeeID, name, age, position
FROM employees;

2. Запит на виконання селекції з використанням будь-якої складної умови відбору для
таблиць вашої БД.

SELECT *
FROM employees2
WHERE number_house > 1 AND number_house < 3

3. Запит на виконання натурального з’єднання у будь-яких таблицях вашої БД.

SELECT labtest1.clinicID, labtest1.name_clinic, labtest1.number_house, 
employees2.name, employees2.position
FROM labtest1, employees2
WHERE labtest1.clinicID = employees2.employeeID


4. Запит на виконання умовного з’єднання для таблиць вашої БД.

SELECT labtest1.clinicID, labtest1.name_clinic, labtest1.number_house, 
employees2.name, employees2.age
FROM labtest1, employees2
WHERE labtest1.clinicID = employees2.employeeID AND employees2.age < labtest1.number_house