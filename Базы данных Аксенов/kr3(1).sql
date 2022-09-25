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

CREATE TABLE R1(
ID INT,
Филиал VARCHAR(25),
Страна VARCHAR(25),
Город VARCHAR(25),
PRIMARY KEY (Филиал, Страна)
);
CREATE TABLE R2(
НомерДоговора INT PRIMARY KEY,
Филиал VARCHAR(25),
ДатаНачала DATE,
ДатаОкончания DATE
);
CREATE TABLE R3(
НомерДоговора INT PRIMARY KEY,
Клиент VARCHAR(25),
Страна VARCHAR(25)
);

INSERT INTO R1 VALUES (1,'main', 'Russia', 'Moscow'), (2, 'abroad', 'Germany', 'Berlin'), (3, 'country', 'Nigeria', 'Abuja'), (4,'SecondMain', 'Russia', 'SPB');
INSERT INTO R2 VALUES (1, 'main', '2021-03-20', '2021-03-27'), (2, 'abroad', '2021-03-17', '2021-04-05'), (3, 'country', '2021-03-21', '2021-04-21'),(4, 'main', '2021-04-30', '2021-05-20'), (5, 'abroad', '2021-05-02', '2021-05-11');
INSERT INTO R3 VALUES (1, 'fil', 'China'), (2,'Kreker', 'Germany') , (3,'Abfulah', 'USA'),(4,'Abfulah', 'USA'), (5,'Kreker', 'Germany');

CREATE VIEW view1 AS
SELECT R3.Клиент
FROM R1, R2, R3
WHERE R1.Филиал = R2.Филиал AND R2.НомерДоговора = R3.НомерДоговора AND R1.Страна <> R3.Страна;

CREATE VIEW view2 AS
SELECT Клиент 
FROM R2 INNER JOIN R3
     USING(НомерДоговора)
GROUP BY Клиент
HAVING COUNT(*) > 1
EXCEPT
SELECT Клиент
FROM R2 INNER JOIN R3
     USING(НомерДоговора)
GROUP BY Клиент , Филиал
HAVING COUNT(*) > 1;

CREATE VIEW view3 AS
SELECT DISTINCT Страна
FROM R3
WHERE Страна NOT IN (
                 SELECT Страна 
                 FROM R1
                 );
                 
CREATE VIEW view4 AS
SELECT Город
FROM R1
WHERE Город NOT IN (
                SELECT Город
                FROM R1 INNER JOIN R2 USING (Филиал) INNER JOIN R3 USING (НомерДоговора)
                );
                
CREATE VIEW view5 AS
SELECT R3.Страна
FROM R1 INNER JOIN R2 USING (Филиал) INNER JOIN R3 USING (НомерДоговора)
GROUP BY R3.Страна
HAVING COUNT(DISTINCT R1.Страна) = 1; 