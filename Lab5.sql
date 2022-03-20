1.Запит на виконання об’єднання Author1 i Author2:

SELECT * FROM labtest1
UNION SELECT * FROM labtest2


2.Запит на виконання перетину:

SELECT * FROM labtest1
WHERE clinicID IN (SELECT clinicID FROM labtest2);


3. Запит на виконання різниці Author2 i Author1

SELECT * FROM labtest2
WHERE clinicID NOT IN (SELECT clinicID FROM labtest1);


4. Запит на виконання декартового добутку двох таблиць:

SELECT * FROM labtest1, labtest2;