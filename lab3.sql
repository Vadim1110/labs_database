mysql> CREATE DATABASE lab3;
Query OK, 1 row affected (0.00 sec)

mysql> USE lab3;
Database changed
mysql> SET NAMES utf8;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> SET time_zone = '+00:00';
Query OK, 0 rows affected (0.00 sec)

mysql> SET foreign_key_checks = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DROP TABLE IF EXISTS `cities`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE `cities` (
    ->   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    ->   `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    ->   `population` int(10) unsigned DEFAULT NULL,
    ->   `region` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
    ->   PRIMARY KEY (`id`)
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
Query OK, 0 rows affected, 6 warnings (0.01 sec)

mysql> 
mysql> INSERT INTO `cities` (`id`, `name`, `population`, `region`) VALUES
    -> (1,	'Київ',	2888470,	'N'),
    -> (2,	'Харків',	1444540,	'E'),
    -> (3,	'Одеса',	1010000,	'S'),
    -> (4,	'Дніпро',	984423,	'C'),
    -> (5,	'Донецьк',	932562,	'E'),
    -> (6,	'Запоріжжя',	758011,	'E'),
    -> (7,	'Львів',	728545,	'W'),
    -> (8,	'Кривий Ріг',	646748,	'S'),
    -> (9,	'Миколаїв',	494381,	'S'),
    -> (10,	'Маріуполь',	458533,	'S'),
    -> (11,	'Луганськ',	417990,	'E'),
    -> (12,	'Севастополь',	412630,	'S'),
    -> (13,	'Вінниця',	372432,	'W'),
    -> (14,	'Макіївка',	348173,	'E'),
    -> (15,	'Сімферополь',	332608,	'S'),
    -> (16,	'Херсон',	296161,	'S'),
    -> (17,	'Полтава',	294695,	'E'),
    -> (18,	'Чернігів',	294522,	'N'),
    -> (19,	'Черкаси',	284459,	'C'),
    -> (20,	'Суми',	268409,	'E'),
    -> (21,	'Житомир',	268000,	'N'),
    -> (22,	'Хмельницький',	267891,	'W'),
    -> (23,	'Чернівці',	264427,	'W'),
    -> (24,	'Горлівка',	250991,	'E'),
    -> (25,	'Рівне',	249477,	'W'),
    -> (26,	'Кам\'янське',	240477,	'C'),
    -> (27,	'Кропивницький',	232052,	'C'),
    -> (28,	'Івано-Франківськ',	229447,	'W'),
    -> (29,	'Кременчук',	224997,	'C'),
    -> (30,	'Тернопіль',	217950,	'W'),
    -> (31,	'Луцьк',	217082,	'W'),
    -> (32,	'Біла Церква',	211080,	'N'),
    -> (33,	'Краматорськ',	160895,	'E'),
    -> (34,	'Мелітополь',	156719,	'S'),
    -> (35,	'Керч',	147668,	'S'),
    -> (36,	'Сєвєродонецьк',	130000,	'E'),
    -> (37,	'Хрустальний',	124000,	'E'),
    -> (38,	'Нікополь',	119627,	'C'),
    -> (39,	'Бердянськ',	115476,	'S'),
    -> (40,	'Слов\'янськ',	115421,	'E'),
    -> (41,	'Ужгород',	115195,	'W'),
    -> (42,	'Алчевськ',	111360,	'E'),
    -> (43,	'Павлоград',	110144,	'E'),
    -> (44,	'Євпаторія',	106115,	'S'),
    -> (45,	'Лисичанськ',	103459,	'E'),
    -> (46,	'Кам\'янець-Подільський',	101590,	'W'),
    -> (47,	'Бровари',	100374,	'N'),
    -> (48,	'Дрогобич',	98015,	'W'),
    -> (49,	'Кадіївка',	92132,	'E'),
    -> (50,	'Конотоп',	92000,	'E');
Query OK, 50 rows affected (0.00 sec)
Records: 50  Duplicates: 0  Warnings: 0

mysql> SELECT name
    -> FROM cities
    -> WHERE name LIKE '%ськ';
+---------------------------------+
| name                            |
+---------------------------------+
| Луганськ                        |
| Івано-Франківськ                |
| Краматорськ                     |
| Бердянськ                       |
| Слов'янськ                      |
| Алчевськ                        |
| Лисичанськ                      |
+---------------------------------+
7 rows in set (0.00 sec)

mysql> SELECT name
    -> FROM cities
    -> WHERE name LIKE '%донец%';
+----------------------------+
| name                       |
+----------------------------+
| Донецьк                    |
| Сєвєродонецьк              |
+----------------------------+
2 rows in set (0.00 sec)

mysql> SELECT CONCAT(name, ' (', region, ')') AS city_region
    -> FROM cities
    -> WHERE population > 100000
    -> ORDER BY name;
+----------------------------------------------+
| city_region                                  |
+----------------------------------------------+
| Алчевськ (E)                                 |
| Бердянськ (S)                                |
| Біла Церква (N)                              |
| Бровари (N)                                  |
| Вінниця (W)                                  |
| Горлівка (E)                                 |
| Дніпро (C)                                   |
| Донецьк (E)                                  |
| Євпаторія (S)                                |
| Житомир (N)                                  |
| Запоріжжя (E)                                |
| Івано-Франківськ (W)                         |
| Кам'янець-Подільський (W)                    |
| Кам'янське (C)                               |
| Керч (S)                                     |
| Київ (N)                                     |
| Краматорськ (E)                              |
| Кременчук (C)                                |
| Кривий Ріг (S)                               |
| Кропивницький (C)                            |
| Лисичанськ (E)                               |
| Луганськ (E)                                 |
| Луцьк (W)                                    |
| Львів (W)                                    |
| Макіївка (E)                                 |
| Маріуполь (S)                                |
| Мелітополь (S)                               |
| Миколаїв (S)                                 |
| Нікополь (C)                                 |
| Одеса (S)                                    |
| Павлоград (E)                                |
| Полтава (E)                                  |
| Рівне (W)                                    |
| Севастополь (S)                              |
| Сєвєродонецьк (E)                            |
| Сімферополь (S)                              |
| Слов'янськ (E)                               |
| Суми (E)                                     |
| Тернопіль (W)                                |
| Ужгород (W)                                  |
| Харків (E)                                   |
| Херсон (S)                                   |
| Хмельницький (W)                             |
| Хрустальний (E)                              |
| Черкаси (C)                                  |
| Чернівці (W)                                 |
| Чернігів (N)                                 |
+----------------------------------------------+
47 rows in set (0.00 sec)

mysql> SELECT name, population, 
    -> ROUND((population / 40000000) * 100, 2) AS population_percentage
    -> FROM cities
    -> ORDER BY population DESC
    -> LIMIT 10;
+---------------------+------------+-----------------------+
| name                | population | population_percentage |
+---------------------+------------+-----------------------+
| Київ                |    2888470 |                  7.22 |
| Харків              |    1444540 |                  3.61 |
| Одеса               |    1010000 |                  2.53 |
| Дніпро              |     984423 |                  2.46 |
| Донецьк             |     932562 |                  2.33 |
| Запоріжжя           |     758011 |                  1.90 |
| Львів               |     728545 |                  1.82 |
| Кривий Ріг          |     646748 |                  1.62 |
| Миколаїв            |     494381 |                  1.24 |
| Маріуполь           |     458533 |                  1.15 |
+---------------------+------------+-----------------------+
10 rows in set (0.00 sec)

mysql> SELECT CONCAT(name, ' - ', ROUND((population / 40000000) * 100, 2), ' %') AS city_population_percentage
    -> FROM cities
    -> WHERE (population / 40000000) * 100 >= 0.1
    -> ORDER BY (population / 40000000) * 100 DESC;
+---------------------------------------------------+
| city_population_percentage                        |
+---------------------------------------------------+
| Київ - 7.22 %                                     |
| Харків - 3.61 %                                   |
| Одеса - 2.53 %                                    |
| Дніпро - 2.46 %                                   |
| Донецьк - 2.33 %                                  |
| Запоріжжя - 1.90 %                                |
| Львів - 1.82 %                                    |
| Кривий Ріг - 1.62 %                               |
| Миколаїв - 1.24 %                                 |
| Маріуполь - 1.15 %                                |
| Луганськ - 1.04 %                                 |
| Севастополь - 1.03 %                              |
| Вінниця - 0.93 %                                  |
| Макіївка - 0.87 %                                 |
| Сімферополь - 0.83 %                              |
| Херсон - 0.74 %                                   |
| Полтава - 0.74 %                                  |
| Чернігів - 0.74 %                                 |
| Черкаси - 0.71 %                                  |
| Суми - 0.67 %                                     |
| Житомир - 0.67 %                                  |
| Хмельницький - 0.67 %                             |
| Чернівці - 0.66 %                                 |
| Горлівка - 0.63 %                                 |
| Рівне - 0.62 %                                    |
| Кам'янське - 0.60 %                               |
| Кропивницький - 0.58 %                            |
| Івано-Франківськ - 0.57 %                         |
| Кременчук - 0.56 %                                |
| Тернопіль - 0.54 %                                |
| Луцьк - 0.54 %                                    |
| Біла Церква - 0.53 %                              |
| Краматорськ - 0.40 %                              |
| Мелітополь - 0.39 %                               |
| Керч - 0.37 %                                     |
| Сєвєродонецьк - 0.33 %                            |
| Хрустальний - 0.31 %                              |
| Нікополь - 0.30 %                                 |
| Бердянськ - 0.29 %                                |
| Слов'янськ - 0.29 %                               |
| Ужгород - 0.29 %                                  |
| Алчевськ - 0.28 %                                 |
| Павлоград - 0.28 %                                |
| Євпаторія - 0.27 %                                |
| Лисичанськ - 0.26 %                               |
| Кам'янець-Подільський - 0.25 %                    |
| Бровари - 0.25 %                                  |
| Дрогобич - 0.25 %                                 |
| Кадіївка - 0.23 %                                 |
| Конотоп - 0.23 %                                  |
+---------------------------------------------------+
50 rows in set (0.00 sec)

mysql> tee D:\open_server\lab_4\lab4.sql
