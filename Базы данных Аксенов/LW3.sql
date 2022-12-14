PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS ??????????????;
DROP TABLE IF EXISTS ?????;
DROP TABLE IF EXISTS ???????????????;
DROP TABLE IF EXISTS ????????????;
DROP TABLE IF EXISTS ??????????????;
DROP TABLE IF EXISTS ??????????;
DROP TABLE IF EXISTS ?????;
DROP TABLE IF EXISTS ?????????;
DROP TABLE IF EXISTS ????????????;
DROP TABLE IF EXISTS ?????;

CREATE TABLE ????? (
???????? VARCHAR(25),
???? MONEY,
ISBN VARCHAR(13) PRIMARY KEY,
???????????? VARCHAR(50) REFERENCES ????????????(????????),
??? VARCHAR(4),
???????? VARCHAR(255),
?????????? INT CHECK(?????????? >= 0)
);

CREATE TABLE ?????????????? (
????????????????? VARCHAR(25),
ISBN VARCHAR(13),
PRIMARY KEY (?????????????????, ISBN),
FOREIGN KEY (ISBN) REFERENCES ?????(ISBN)
);

CREATE TABLE ????????? (
????????????????? VARCHAR(25) PRIMARY KEY,
???????? VARCHAR(255) 
);

CREATE TABLE ?????????? (
ID INT ,
ISBN VARCHAR(13),
FOREIGN KEY (ISBN) REFERENCES ?????(ISBN),
FOREIGN KEY (ID) REFERENCES ?????(ID)
);

CREATE TABLE ?????(
ID INT PRIMARY KEY,
??? VARCHAR(255)
);

CREATE TABLE ?????????????? (
ID INT,
ISBN VARCHAR(13),
FOREIGN KEY (ISBN) REFERENCES ?????(ISBN),
FOREIGN KEY (ID) REFERENCES ?????(ID)
);

CREATE TABLE ????? (
ID INT PRIMARY KEY,
?????????????? DATE,
?????????????? DATE,
????????????? VARCHAR(255),
????????? VARCHAR(20),
?????????????? INT,
????? VARCHAR(50) REFERENCES ????????????(?????),
CHECK (?????????????? >= ?????????????? )
);

CREATE TABLE ????????????(
????? VARCHAR(50) PRIMARY KEY,
?????? VARCHAR(50),
??? VARCHAR(255),
?????????? VARCHAR(50)
);

CREATE TABLE ??????????????? (
????? VARCHAR(50),
ISBN VARCHAR(13),
????????????????????? INT,
FOREIGN KEY (ISBN) REFERENCES ?????(ISBN),
FOREIGN KEY (?????) REFERENCES ????????????(?????)
);

CREATE TABlE ????????????(
???????? VARCHAR(50) PRIMARY KEY
);

INSERT INTO ????? VALUES (1, '?????? ?????') , (2, '???? ????'), (3, '?????????? ??????? ?????????') , (4, '?????????? ????? ?????????');

INSERT INTO ???????????? VALUES ('???'), ('???? ????????? ??????');

INSERT INTO ????????? VALUES ('???????????? ?????', '????????????? ????? ? ?????? ????????????, ??????????? ??????????? ??? ??? ??? ???? ?????.'),
('??????????', '??????????? ? ???? ? ?????????? ????? ? ?????????????? ??????????, ??????????????? ?????????????? ??????????????? ?????????, ????????? ?????????????, ?????????? ?????? ??????????, ???????? ???????????. ?
?????????? ?????????? ???????? ? ???? ????? ????? ??? ??????? ??????????, ???????, ?????');

INSERT INTO ????? VALUES ('1984', 286, '9785170801152', '???', '2016', '???????????? ??????? ?????? ??????? ?????????? XX ???? - "? ?????? ????? ???" ?????? ??????. ???, ? ????????, ????????: ?????????? ?? ??????? "???????? ???????????" - ??? ?????????? ?? ???????? "???????? ????"?
?? ???????, ??? ? ?? ????? ???? ?????? ??????? ????????? ??????????', 30),
('?????? ?? ???????', 274, '9785170886470', '???', '2015', '???????, ? ??????? ??????????? ??????? ?????????? ???????? ?? ??? ????? ????????????, ??????? ?????????? ?? ??????????? ????? ?????? ?????. ??????? ????????? ??????? ?????????? ?????? ??????????? "???????"',45),
('?????? ???? ?????', 433, '9785171186395','???', '2019', '????????, ????? ????????? ?? ???????????? ??????? ??????????. ???? ?? ????? ????????????? ???????? ????????????? ??????????. ?????????????, ?????? ?????????? ??????? ?????, ????? ? ??????????? ???? ?????? ?? ??????????? ??????? ?? ??????? ??????? ? ?????? ? ????? ??????, ??? ?????? ???????? ?????????? ?????, ???????? ? ??????? ?????.', 16 ),
('???????????????? ???????', 786, '9786171279216', '???? ????????? ??????', '2020', '??? - ??????? ??????, ??????? ??????? ? ???????????? ?? ?????????? ??????? ?????????. ? ??? ???, ???????? ????, ???????? ??????????? ?????... ?????????! ????????? ????????? ?????????? ????? "????????". ?????? ??, ???????????????? ??????, ?????? ???????? ???? ? ??????? ????????????', 25);

INSERT INTO ?????????? VALUES (1 , '9785170801152'),( 2, '9786171279216'),( 3, '9785170886470'),( 3, '9785171186395'),( 4, '9785170886470'),( 4, '9785171186395');

INSERT INTO ?????????????? VALUES ('???????????? ?????','9785170801152'), ('???????????? ?????','9785170886470'), ('???????????? ?????','9785171186395'), ('???????????? ?????','9786171279216'), ('??????????','9785170886470'), ('??????????','9785171186395');

INSERT INTO ???????????? VALUES ('login','password','?????? ???? ????????','ivanov@gmail.com'),('NewPerson','newPassword','???????? ?????? ??????????','stepanov@mail.ru');

INSERT INTO ??????????????? VALUES ('login', '9785170801152', 1), ('login', '9785170886470', 2), ('NewPerson', '9785170886470', 1), ('NewPerson', '9785171186395', 1);

INSERT INTO ????? VALUES (1 , '2021-03-20', '2021-03-24', '?? ??????, ??? 54, ?? 17', '?????????',433 , 'login'), ( 2, '2021-03-21', NULL, '?? ???????, ??? 21, ?? 18', '????????', 433 , 'NewPerson'), ( 3, '2021-03-22', '2021-03-23', '?? ???????, ??? 21, ?? 18', '?????????', 786 , 'NewPerson');

INSERT INTO ?????????????? VALUES (1, '9785171186395'), (2, '9785171186395'), (3, '9786171279216');