--Напишите команду SELECT, которая бы вывела номер заказа, сумму, и дату для всех строк из таблицы Заказов

SELECT onum, amt, odate FROM Orders;

--Напишите запрос, который вывел бы все строки из таблицы Заказчиков, для которых номер продавца равен 1001

SELECT * FROM customers
WHERE snum = 1001;

--Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm

SELECT city, sname, snum, comm FROM salespeople;

--Напишите команду SELECT которая вывела бы оценку (rating), сопровождаемую именем каждого заказчика в San Jose

SELECT cname, rating FROM customers
WHERE city = 'San Jose';

--Напишите запрос, который вывел бы значения snum всех продавцов в текущем порядке из таблицы Заказов без каких бы то ни было повторений

SELECT DISTINCT snum FROM orders;

--Напишите запрос, который отображает все заказы со значениями суммы выше чем $1,000 (сортировка заказов по увеличению суммы заказа)

SELECT * FROM orders
WHERE amt > 1000
ORDER BY amt;

--Напишите запрос, который находит  sname и city для всех продавцов в Лондоне с комиссионными выше 0.1

SELECT sname, city FROM salespeople
WHERE city = 'London' AND comm > 0.1;

--Напишите запрос к таблице Заказчиков для отображения всех заказчиков с рейтингом не более 100, если они не находятся в Риме

SELECT * FROM customers 
WHERE rating <=100 AND city != 'Rome';

--Напишите 2 запроса которые могли бы вывести все заказы за 10 марта или 10 апреля 2015

SELECT * FROM orders
WHERE odate IN ('2015-03-10', '2015-04-10');

SELECT * FROM orders 
WHERE odate = '2015-03-10' OR odate ='2015-04-10';

--Напишите запрос который выберет всех заказчиков обслуживаемых продавцами Peel (snum=1001) или Motika (snum=1004)

SELECT * FROM customers
WHERE snum IN (1001, 1004);

--Напишите запрос, который может вывести всех заказчиков, чьи имена начинаются с буквы попадающей в диапазон от A до G.

SELECT * FROM customers
WHERE cname REGEXP '^[A-G]';

--Напишите запрос который выберет всех пользователей чьи имена начинаются с буквы C

SELECT * FROM customers
WHERE cname LIKE 'C%';

--Напишите запрос, который сосчитал бы все суммы приобретений на 10 марта

SELECT sum(amt) FROM orders
WHERE odate = '2015-03-10';

--Напишите запрос, который сосчитал бы число различных не-NULL значений поля city в таблице Заказчиков

SELECT count(DISTINCT city) FROM customers;

--Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.

SELECT min(amt), cnum FROM orders
GROUP BY cnum;

--Напишите запрос, который бы выбирал заказчиков в алфавитном порядке, чьи имена начинаются с буквы G

SELECT * FROM customers
WHERE cname LIKE 'G%'
ORDER BY cname;

--Напишите запрос, который выбрал бы высшую оценку в каждом городе.

SELECT max(rating), city FROM customers
GROUP BY city;

--Напишите запрос, который сосчитал бы число заказчиков, регистрирующих каждый день свои заказы.
--(Если продавец имел более одного заказа в данный день, он должен учитываться только один раз.)

SELECT odate, count(DISTINCT cnum) FROM orders
GROUP BY odate;

--Предположим что каждый продавец имеет 12% комиссионных. Напишите запрос к таблице заказов, 
--который мог бы вывести номер заказа, номер продавца, и сумму комиссионных продавца для этого заказа.

SELECT onum, snum, amt*0.12 AS commission FROM orders;

--Напишите запрос к таблице Заказчиков который мог бы найти высшую оценку в каждом городе.  
--Вывод должен быть в такой форме: For the city [city], the highest rating is: 

SELECT concat('For the city ', city, ' the highest rating is ', max(rating)) AS HighestRating  FROM customers
GROUP BY city;

--Напишите запрос, который выводил бы список заказчиков в нисходящем порядке. 
--Вывод поля оценки (rating) должен сопровождаться именем заказчика и его номером.

SELECT rating, cname, cnum FROM customers
ORDER BY rating DESC, cname DESC;

--Напишите запрос, который бы вывел список номеров заказов, сопровождающихся именем заказчика, который создавал эти заказы.

SELECT o.onum, c.cname FROM orders o, customers c 
WHERE o.cnum = c.cnum
ORDER BY onum;

--Напишите запрос, который бы выдавал имена продавца и заказчика для каждого заказа после номера заказа

SELECT o.onum, s.sname, c.cname FROM orders o, customers c, salespeople s
WHERE o.snum = s.snum AND o.cnum = c.cnum
ORDER BY onum;

-- второй вариант

SELECT o.onum, s.sname, c.cname FROM orders o 
JOIN customers c ON c.cnum = o.cnum
JOIN salespeople s ON s.snum = o.snum
ORDER BY onum;

--Напишите запрос, который бы выводил всех заказчиков, обслуживаемых продавцом с комиссионными выше 12%. 
--Выведите имя заказчика, имя продавца и ставку комиссионных продавца

SELECT c.cname, s.sname, s.comm  FROM customers c 
JOIN salespeople s ON s.snum = c.snum 
WHERE s.comm > 0.12;

--Напишите запрос, который вычислил бы сумму комиссионных продавца для каждого заказа заказчика с оценкой выше 100.

SELECT o.onum, o.amt*s.comm AS commission FROM orders o 
JOIN salespeople s ON s.snum = o.snum 
JOIN customers c ON c.cnum = o.cnum 
WHERE c.rating > 100;

--Напишите запрос, который бы вывел все пары продавцов, живущих в одном и том же городе. 
--Исключите комбинации продавцов с ними же, а также дубликаты строк, выводимых в обратным порядке

SELECT s.sname, s2.sname, s.city FROM salespeople s, salespeople s2
WHERE s.city =s2.city  AND s.sname < s2.sname;

--Напишите запрос, который вывел бы имена (cname) и города (city) всех заказчиков с такой же оценкой (rating) как у Hoffmanа. 
--Напишите запрос, использующий поле cnum Hoffmanа, а не его оценку, так чтобы оно могло быть использовано, если его оценка вдруг изменится

SELECT cname, city, rating FROM customers
WHERE rating = (SELECT rating FROM customers WHERE cnum = 2001);

--Напишите запрос, который бы использовал подзапрос для получения всех заказов для заказчика с именем Cisneros. 
--Предположим, что вы не знаете номера этого заказчика, указываемого в поле cnum.

SELECT * FROM orders o
WHERE o.cnum = (SELECT c.cnum FROM customers c WHERE c.cname = 'Cisneros');

--Напишите команду SELECT, которая выберет имена и номера всех заказчиков с максимальными для их городов оценками

SELECT c.cnum, c.cname FROM customers c 
WHERE c.rating = (SELECT max(rating) FROM customers c2 WHERE c.city = c2.city);

--Напишите запрос, который выберет всех продавцов (по их имени и номеру) которые, в своих городах имеют заказчиков,
--которых они не обслуживают.

SELECT s.snum, s.sname  FROM salespeople s
WHERE s.city IN (SELECT c.city FROM customers c WHERE c.city = s.city AND s.snum != c.snum);

--Напишите запрос который бы использовал оператор EXISTS для извлечения всех продавцов, которые имеют заказчиков с оценкой 300

SELECT sname, snum FROM salespeople s 
WHERE EXISTS (SELECT * FROM customers c WHERE c.snum = s.snum AND c.rating = 300);

--Напишите запрос, использующий оператор EXISTS, который выберет всех продавцов с заказчиками, 
--размещенными в их городах, которые ими не обслуживаются

SELECT * FROM salespeople s WHERE EXISTS (SELECT * FROM customers c WHERE c.city = s.city AND s.snum != c.snum);

--Напишите запрос, который бы выбирал всех заказчиков, чьи оценки равны или больше, чем какая-нибудь (ANY) оценка заказчика Serres

SELECT * FROM customers
WHERE rating >= ANY(SELECT c.rating FROM customers c WHERE c.snum = (SELECT s.snum FROM salespeople s  WHERE s.sname = 'Serres'));

--Напишите запрос, который бы выбирал все заказы с суммой больше, чем любая из сумм для заказчиков в San Jose

SELECT * FROM orders o 
WHERE amt > ALL (SELECT o2.amt FROM orders o2 WHERE o2.cnum = ANY (SELECT c.cnum  FROM customers c WHERE c.city = 'San Jose'));

--Напишите предыдущий запрос с использованием MAX

SELECT * FROM orders
WHERE amt > (SELECT max(o.amt) FROM orders o, customers c
where c.cnum = o.cnum AND c.city = 'San Jose');

--Создайте объединение из двух запросов, которое показало бы имена, города, и оценки всех заказчиков. 
--Те из них, которые имеют поле rating=200 и более, должны, кроме того, иметь слова "Высокий Рейтинг", 
--а остальные должны иметь слова "Низкий Рейтинг".

SELECT cname, city, rating, 
IF(rating>=200, 'Высокий Рейтинг', 'Низкий Рейтинг') AS category
FROM customers;

--Напишите команду, которая бы вывела имена и номера каждого продавца и каждого заказчика, 
--которые имеют больше чем один текущий заказ. Результат представьте в алфавитном порядке.

-- //решение с помощью подзапросов
SELECT s.sname AS name, s.snum AS num FROM salespeople s 
WHERE s.snum IN (SELECT o.snum FROM orders o 
GROUP BY o.snum
HAVING count(o.snum) > 1)
UNION
SELECT c.cname AS name, c.cnum AS num FROM customers c
WHERE c.cnum  IN (SELECT o.cnum  FROM orders o
GROUP BY o.cnum
HAVING count(o.cnum) > 1)
ORDER BY name;

--//решение с помощью неявного соединения таблиц

select o.snum AS num, count(s.sname) as Qty, s.sname as Fname from orders o, salespeople s
where o.snum = s.snum 
group by o.snum
having count(s.sname) > 1
union
select o.cnum AS num, count(c.cname) as Qty, c.cname as Fname from orders o, customers c
where o.cnum = c.cnum
group by o.cnum
having count(c.cname) > 1
Order by Fname;


