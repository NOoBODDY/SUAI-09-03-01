USE FIRST;

SET TRANSACTION ISOLATION LEVEL
READ UNCOMMITTED;
BEGIN;
SELECT *
FROM Пользователь
WHERE АдресПочты LIKE '%@mail.ru';

SELECT SLEEP(10);

SELECT *
FROM Пользователь
WHERE АдресПочты LIKE '%@gmail.com';
