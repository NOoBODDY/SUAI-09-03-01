USE FIRST;

BEGIN;
UPDATE Пользователь
SET Пароль = '22834'
WHERE АдресПочты LIKE '%@gmail.com';