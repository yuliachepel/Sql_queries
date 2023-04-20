# SQL-запросы

Задачи по SQL с сайта [http://www.itmathrepetitor.ru/](http://www.itmathrepetitor.ru/zadachi-po-sql-chast-1-iz-3/)

В базе данных 3 таблицы

## Таблица salespeople
![](https://github.com/yuliachepel/Sql_queries/blob/main/assets/salespeople.png)

_snum - уникальный номер, назначенный каждому продавцу ("номер служащего"); sname - имя продавца; city - расположение продавца (город); comm - комиссионные продавцов в десятичной форме._

## Таблица customers
![](https://github.com/yuliachepel/Sql_queries/blob/main/assets/customers.png)

_cnum - уникальный номер назначенный каждому заказчику; cname - имя заказчика; city - расположение заказчика (город); rating - код, указывающий уровень предпочтения данного заказчика перед другими. Более высокий номер указывают на большее предпочтение (рейтинг); snum - номер продавца, назначенного этому заказчику (из таблицы Продавцов)_


## Таблица orders

![](https://github.com/yuliachepel/Sql_queries/blob/main/assets/orders.png)

_onum - уникальный номер данный каждому приобретению; amt - значение суммы приобретений; odate - дата приобретения; cnum - номер заказчика делающего приобретение (из таблицы Заказчиков); snum - номер продавца продающего приобретение (из таблицы Продавцов)_