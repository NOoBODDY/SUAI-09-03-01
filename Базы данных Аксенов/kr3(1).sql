-- ��������� ������������ ����������� ��������� �����������
PRAGMA foreign_keys = ON;
-- ������� ����� ������
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
������ VARCHAR(25),
������ VARCHAR(25),
����� VARCHAR(25),
PRIMARY KEY (������, ������)
);
CREATE TABLE R2(
������������� INT PRIMARY KEY,
������ VARCHAR(25),
���������� DATE,
������������� DATE
);
CREATE TABLE R3(
������������� INT PRIMARY KEY,
������ VARCHAR(25),
������ VARCHAR(25)
);

INSERT INTO R1 VALUES (1,'main', 'Russia', 'Moscow'), (2, 'abroad', 'Germany', 'Berlin'), (3, 'country', 'Nigeria', 'Abuja'), (4,'SecondMain', 'Russia', 'SPB');
INSERT INTO R2 VALUES (1, 'main', '2021-03-20', '2021-03-27'), (2, 'abroad', '2021-03-17', '2021-04-05'), (3, 'country', '2021-03-21', '2021-04-21'),(4, 'main', '2021-04-30', '2021-05-20'), (5, 'abroad', '2021-05-02', '2021-05-11');
INSERT INTO R3 VALUES (1, 'fil', 'China'), (2,'Kreker', 'Germany') , (3,'Abfulah', 'USA'),(4,'Abfulah', 'USA'), (5,'Kreker', 'Germany');

CREATE VIEW view1 AS
SELECT R3.������
FROM R1, R2, R3
WHERE R1.������ = R2.������ AND R2.������������� = R3.������������� AND R1.������ <> R3.������;

CREATE VIEW view2 AS
SELECT ������ 
FROM R2 INNER JOIN R3
     USING(�������������)
GROUP BY ������
HAVING COUNT(*) > 1
EXCEPT
SELECT ������
FROM R2 INNER JOIN R3
     USING(�������������)
GROUP BY ������ , ������
HAVING COUNT(*) > 1;

CREATE VIEW view3 AS
SELECT DISTINCT ������
FROM R3
WHERE ������ NOT IN (
                 SELECT ������ 
                 FROM R1
                 );
                 
CREATE VIEW view4 AS
SELECT �����
FROM R1
WHERE ����� NOT IN (
                SELECT �����
                FROM R1 INNER JOIN R2 USING (������) INNER JOIN R3 USING (�������������)
                );
                
CREATE VIEW view5 AS
SELECT R3.������
FROM R1 INNER JOIN R2 USING (������) INNER JOIN R3 USING (�������������)
GROUP BY R3.������
HAVING COUNT(DISTINCT R1.������) = 1; 