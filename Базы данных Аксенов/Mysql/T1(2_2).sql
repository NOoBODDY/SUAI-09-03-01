USE FIRST;

SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
BEGIN;
SELECT *
FROM Пользователь
WHERE АдресПочты LIKE '%@mail.ru'LOCK
IN SHARE MODE;