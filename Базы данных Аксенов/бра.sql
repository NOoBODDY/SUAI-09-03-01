
-- ��������� ������������ ����������� ��������� �����������
PRAGMA foreign_keys = ON;
-- ������� ����� ������
DROP TABLE IF EXISTS �����������������;
DROP TABLE IF EXISTS �����������;
DROP TABLE IF EXISTS ���;
DROP TABLE IF EXISTS ���������;
DROP TABLE IF EXISTS ����;
DROP TABLE IF EXISTS ��������������;
DROP TABLE IF EXISTS �����;
DROP TABLE IF EXISTS ����������������������;
DROP TABLE IF EXISTS ���������;
DROP TABLE IF EXISTS �������������;
DROP TABLE IF EXISTS ����;
DROP TABLE IF EXISTS ���������;

--�������� ������
CREATE TABLE ���������
(
�������� VARCHAR(25) PRIMARY KEY,
��� VARCHAR(4),
���������� INT,
�������� VARCHAR(50),
��������������� MONEY  
);

CREATE TABLE �����
(
��� VARCHAR(50) PRIMARY KEY
);

CREATE TABLE ��������������
(
��� VARCHAR(50),
����������������� VARCHAR(25),
FOREIGN KEY (���) REFERENCES �����(���),
FOREIGN KEY (�����������������) REFERENCES ���������(��������)
);

CREATE TABLE ���������
(
�������� VARCHAR(25),
���������������� INT PRIMARY KEY,
��������� VARCHAR(25)
);

CREATE TABLE ����������������������
(
����������������� VARCAHR(25),
���������������� INT,
FOREIGN KEY (�����������������) REFERENCES ���������(��������),
FOREIGN KEY (����������������) REFERENCES ���������(����������������)
);

CREATE TABLE ���� 
(
�������� VARCHAR(25) PRIMARY KEY
);

CREATE TABLE �������������
(
����������������� VARCHAR(25),
������������� VARCHAR(25),
FOREIGN KEY (�����������������) REFERENCES ���������(��������),
FOREIGN KEY (�������������) REFERENCES ����(��������)
);

CREATE TABLE ���� 
(
�������� VARCHAR(25) PRIMARY KEY,
�����������������,
FOREIGN KEY (�����������������) REFERENCES ���������(��������)
);

CREATE TABLE ���������
(
��� VARCHAR(25),
������������� VARCHAR(12) PRIMARY KEY,
��������� VARCHAR(25),
����� VARCHAR(25),
������� VARCHAR(11),
��������������� VARCHAR(11),
CHECK (������� IS NOT NULL OR ��������������� IS NOT NULL)
);

CREATE TABLE ���
(
����� INT PRIMARY KEY
);

CREATE TABLE �����������
(
��������� DATETIME PRIMARY KEY, 
�������� VARCHAR(25),
��������� INT,
��� VARCHAR(25), 
FOREIGN KEY (��������) REFERENCES ���������(��������),
FOREIGN KEY (���������) REFERENCES ���(�����)
);

CREATE TABLE ����������������� 
(
������������ VARCHAR(25),
������������� VARCHAR(12),
����������������� VARCHAR(25),
������������� DATETIME,
��������� INT,
FOREIGN KEY (������������) REFERENCES ����(��������),
FOREIGN KEY (�������������) REFERENCES ���������(�������������),
FOREIGN KEY (�����������������) REFERENCES ���������(��������),
FOREIGN KEY (�������������) REFERENCES �����������(���������),
FOREIGN KEY (���������) REFERENCES �����������(���������)
);
--���������� ������
