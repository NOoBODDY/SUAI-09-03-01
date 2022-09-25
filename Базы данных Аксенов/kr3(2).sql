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

CREATE TABLE R1 (
���������������� VARCHAR(40) PRIMARY KEY,
������� INT
);

CREATE TABLE R2 (
ID INT PRIMARY KEY,
���������������� VARCHAR(40),
���������� VARCHAR(25),
���������� VATCHAR(25)
);

CREATE TABLE R3 (
ID INT PRIMARY KEY,
���������� VARCHAR(25),
���� INT 
);

INSERT INTO R1 VALUES ('������', 44), ('������',44), ('�������',41), ('����',41);
INSERT INTO R2 VALUES (1, '������', '��', '������'), (2, '������', '��', '������'), (3, '������', '��', '����'), (4, '�������', '��', '��������'), (5, '�������', '��', '������'),(6, '����', '��', '������');
INSERT INTO R3 VALUES (1,'��',2),(2,'��',3),(3,'��',1);

CREATE VIEW view1 AS
SELECT ����������������
FROM R2
EXCEPT
SELECT ����������������
FROM R2
WHERE ���������� <> '������';

CREATE VIEW view2 AS
SELECT �������
FROM R1
EXCEPT 
SELECT �������
FROM R1 INNER JOIN R2 USING (����������������)
WHERE ���������� = '��������';

CREATE VIEW view3 AS
SELECT DISTINCT ����
FROM R1 INNER JOIN R2 USING (����������������) INNER JOIN R3 USING (����������)
WHERE ������� = 44;

CREATE VIEW view4 AS
SELECT �������
FROM R1
WHERE ���������������� NOT IN (
                               SELECT ����������������
                               FROM R2 INNER JOIN R3 USING (����������)
                               WHERE ���� <> 1 AND ���� <> 2
                               );
                               
CREATE VIEW view5 AS
SELECT ����������
FROM R1 INNER JOIN R2 USING (����������������)
GROUP BY ���������� 
HAVING COUNT(DISTINCT �������)>1;