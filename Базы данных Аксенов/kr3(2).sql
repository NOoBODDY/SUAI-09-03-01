-- Включение форсирования ограничений ссылочной целостности
PRAGMA foreign_keys = ON;
-- Очистка схемы данных
DROP TABLE IF EXISTS R3;
DROP TABLE IF EXISTS R2;
DROP TABLE IF EXISTS R1;

DROP VIEW IF EXISTS view1;
DROP VIEW IF EXISTS view2;
DROP VIEW IF EXISTS view3;
DROP VIEW IF EXISTS view4;
DROP VIEW IF EXISTS view5;

CREATE TABLE R1 (
ФИОпреподавателя VARCHAR(40) PRIMARY KEY,
Кафедра INT
);

CREATE TABLE R2 (
ID INT PRIMARY KEY,
ФИОпреподавателя VARCHAR(40),
Дисциплина VARCHAR(25),
ТипЗанятия VATCHAR(25)
);

CREATE TABLE R3 (
ID INT PRIMARY KEY,
Дисциплина VARCHAR(25),
Курс INT 
);

INSERT INTO R1 VALUES ('Иванов', 44), ('Петров',44), ('Сидоров',41), ('Олег',41);
INSERT INTO R2 VALUES (1, 'Иванов', 'БД', 'Лекция'), (2, 'Петров', 'БД', 'Лекция'), (3, 'Петров', 'БД', 'Лаба'), (4, 'Сидоров', 'ОП', 'Курсовая'), (5, 'Сидоров', 'ОП', 'Лекция'),(6, 'Олег', 'БД', 'Лекция');
INSERT INTO R3 VALUES (1,'БД',2),(2,'БД',3),(3,'ОП',1);

CREATE VIEW view1 AS
SELECT ФИОпреподавателя
FROM R2
EXCEPT
SELECT ФИОпреподавателя
FROM R2
WHERE ТипЗанятия <> 'Лекция';

CREATE VIEW view2 AS
SELECT Кафедра
FROM R1
EXCEPT 
SELECT Кафедра
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя)
WHERE ТипЗанятия = 'Курсовая';

CREATE VIEW view3 AS
SELECT DISTINCT Курс
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя) INNER JOIN R3 USING (Дисциплина)
WHERE Кафедра = 44;

CREATE VIEW view4 AS
SELECT Кафедра
FROM R1
WHERE ФИОпреподавателя NOT IN (
                               SELECT ФИОпреподавателя
                               FROM R2 INNER JOIN R3 USING (Дисциплина)
                               WHERE Курс <> 1 AND Курс <> 2
                               );
                               
CREATE VIEW view5 AS
SELECT Дисциплина
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя)
GROUP BY Дисциплина 
HAVING COUNT(DISTINCT Кафедра)>1;