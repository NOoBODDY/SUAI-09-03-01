USE FIRST;

SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
BEGIN;
UPDATE Пользователь
SET Пароль = NULL
WHERE АдресПочты LIKE '%@mail.ru';

SELECT SLEEP(20);

UPDATE Пользователь
SET Пароль = NULL
WHERE АдресПочты LIKE '%@mail.ru';