USE FIRST;
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
BEGIN;
UPDATE Пользователь
SET Пароль = '22834'
WHERE АдресПочты LIKE '%@gmail.com';