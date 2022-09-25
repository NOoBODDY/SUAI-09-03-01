
-- Включение форсирования ограничений ссылочной целостности
PRAGMA foreign_keys = ON;
-- Очистка схемы данных
DROP TABLE IF EXISTS УчастиеВспектакле;
DROP TABLE IF EXISTS Мероприятие;
DROP TABLE IF EXISTS Зал;
DROP TABLE IF EXISTS Сотрудник;
DROP TABLE IF EXISTS Роль;
DROP TABLE IF EXISTS АвторСпектакля;
DROP TABLE IF EXISTS Автор;
DROP TABLE IF EXISTS ИспользованныйРеквизит;
DROP TABLE IF EXISTS Декорации;
DROP TABLE IF EXISTS ЖанрСпектакля;
DROP TABLE IF EXISTS Жанр;
DROP TABLE IF EXISTS Спектакль;

--Создание таблиц
CREATE TABLE Спектакль
(
Название VARCHAR(25) PRIMARY KEY,
Год VARCHAR(4),
КолвоАктов INT,
Описание VARCHAR(50),
СтоимостьБилета MONEY  
);

CREATE TABLE Автор
(
ФИО VARCHAR(50) PRIMARY KEY
);

CREATE TABLE АвторСпектакля
(
ФИО VARCHAR(50),
НазваниеСпектакля VARCHAR(25),
FOREIGN KEY (ФИО) REFERENCES Автор(ФИО),
FOREIGN KEY (НазваниеСпектакля) REFERENCES Спектакль(Название)
);

CREATE TABLE Декорации
(
Название VARCHAR(25),
ИнвентарныйНомер INT PRIMARY KEY,
Категория VARCHAR(25)
);

CREATE TABLE ИспользованныйРеквизит
(
НазваниеСпектакля VARCAHR(25),
ИнвентарныйНомер INT,
FOREIGN KEY (НазваниеСпектакля) REFERENCES Спектакль(Название),
FOREIGN KEY (ИнвентарныйНомер) REFERENCES Декорации(ИнвентарныйНомер)
);

CREATE TABLE Жанр 
(
Название VARCHAR(25) PRIMARY KEY
);

CREATE TABLE ЖанрСпектакля
(
НазваниеСпектакля VARCHAR(25),
НазваниеЖанра VARCHAR(25),
FOREIGN KEY (НазваниеСпектакля) REFERENCES Спектакль(Название),
FOREIGN KEY (НазваниеЖанра) REFERENCES Жанр(Название)
);

CREATE TABLE Роль 
(
Название VARCHAR(25) PRIMARY KEY,
НазваниеСпектакля,
FOREIGN KEY (НазваниеСпектакля) REFERENCES Спектакль(Название)
);

CREATE TABLE Сотрудник
(
ФИО VARCHAR(25),
НомерПаспорта VARCHAR(12) PRIMARY KEY,
Должность VARCHAR(25),
Адрес VARCHAR(25),
Телефон VARCHAR(11),
ДомашнийТелефон VARCHAR(11),
CHECK (Телефон IS NOT NULL OR ДомашнийТелефон IS NOT NULL)
);

CREATE TABLE Зал
(
Номер INT PRIMARY KEY
);

CREATE TABLE Мероприятие
(
ДатаВремя DATETIME PRIMARY KEY, 
Название VARCHAR(25),
НомерЗала INT,
Тип VARCHAR(25), 
FOREIGN KEY (Название) REFERENCES Спектакль(Название),
FOREIGN KEY (НомерЗала) REFERENCES Зал(Номер)
);

CREATE TABLE УчастиеВспектакле 
(
НазваниеРоли VARCHAR(25),
НомерПаспорта VARCHAR(12),
НазваниеСпектакля VARCHAR(25),
ДатаСпектакля DATETIME,
НомерЗала INT,
FOREIGN KEY (НазваниеРоли) REFERENCES Роль(Название),
FOREIGN KEY (НомерПаспорта) REFERENCES Сотрудник(НомерПаспорта),
FOREIGN KEY (НазваниеСпектакля) REFERENCES Спектакль(Название),
FOREIGN KEY (ДатаСпектакля) REFERENCES Мероприятие(ДатаВремя),
FOREIGN KEY (НомерЗала) REFERENCES Мероприятие(НомерЗала)
);
--заполнение таблиц
