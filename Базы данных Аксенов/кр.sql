1.1)
SELECT R3.Клиент
FROM R1, R2, R3
WHERE R1.Филиал = R2.Филиал AND R2.НомерДоговора = R3.НомерДоговора AND R1.Страна <> R3.Страна;
2.1)
SELECT Клиент 
FROM R2 INNER JOIN R3
     USING(НомерДоговора)
GROUP BY Клиент
HAVING COUNT(*) > 1
EXCEPT
SELECT Клиент
FROM R2 INNER JOIN R3
     USING(НомерДоговора)
GROUP BY Клиент , Филиал
HAVING COUNT(*) > 1;
3.1)
SELECT DISTINCT Страна
FROM R3
WHERE Страна NOT IN (
                 SELECT Страна 
                 FROM R1
                 );
4.1)
SELECT Город
FROM R1
WHERE Город NOT IN (
                SELECT Город
                FROM R1 INNER JOIN R2 USING (Филиал) INNER JOIN R3 USING (НомерДоговора)
                );
5.1)
SELECT R3.Страна
FROM R1 INNER JOIN R2 USING (Филиал) INNER JOIN R3 USING (НомерДоговора)
GROUP BY R3.Страна
HAVING COUNT(DISTINCT R1.Страна) = 1; 

1.2)
SELECT ФИОпреподавателя
FROM R2
EXCEPT
SELECT ФИОпреподавателя
FROM R2
WHERE ТипЗанятия <> 'Лекция';
2.2)
SELECT Кафедра
FROM R1
EXCEPT 
SELECT Кафедра
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя)
WHERE ТипЗанятия = 'Курсовая';
3.2)
SELECT DISTINCT Курс
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя) INNER JOIN R3 USING (Дисциплина)
WHERE Кафедра = 44;
4.2)
SELECT Кафедра
FROM R1
WHERE ФИОпреподавателя NOT IN (
                               SELECT ФИОпреподавателя
                               FROM R2 INNER JOIN R3 USING (Дисциплина)
                               WHERE Курс <> 1 AND Курс <> 2
                               );
5.2)
SELECT Дисциплина
FROM R1 INNER JOIN R2 USING (ФИОпреподавателя)
GROUP BY Дисциплина 
HAVING COUNT(DISTINCT Кафедра)>1;
