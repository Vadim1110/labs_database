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

mysql> DROP TABLE IF EXISTS `regions`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE `regions` (
    ->   `uuid` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
    ->   `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    ->   `area_quantity` int(10) unsigned NOT NULL,
    ->   PRIMARY KEY (`uuid`)
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
Query OK, 0 rows affected, 5 warnings (0.01 sec)

mysql> 
mysql> INSERT INTO `regions` (`uuid`, `name`, `area_quantity`) VALUES
    -> ('C',	'Center',	5),
    -> ('E',	'East',	3),
    -> ('N',	'Nord',	4),
    -> ('S',	'South',	5),
    -> ('W',	'West',	8);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT c.name AS city_name, r.name AS region_name
    -> FROM cities c
    -> JOIN regions r ON c.region = r.uuid
    -> WHERE c.population > 350000;
+------------------------+-------------+
| city_name              | region_name |
+------------------------+-------------+
| Київ                   | Nord        |
| Харків                 | East        |
| Одеса                  | South       |
| Дніпро                 | Center      |
| Донецьк                | East        |
| Запоріжжя              | East        |
| Львів                  | West        |
| Кривий Ріг             | South       |
| Миколаїв               | South       |
| Маріуполь              | South       |
| Луганськ               | East        |
| Севастополь            | South       |
| Вінниця                | West        |
+------------------------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT c.name AS city_name
    -> FROM cities c
    -> JOIN regions r ON c.region = r.uuid
    -> WHERE r.name = 'Nord';
+-----------------------+
| city_name             |
+-----------------------+
| Київ                  |
| Чернігів              |
| Житомир               |
| Біла Церква           |
| Бровари               |
+-----------------------+
5 rows in set (0.00 sec)