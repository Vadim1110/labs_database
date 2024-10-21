mysql> CREATE TABLE categories (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE news (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(255) NOT NULL,
    ->     content TEXT NOT NULL,
    ->     category_id INT,
    ->     publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (category_id) REFERENCES categories(id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE comments (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     news_id INT,
    ->     comment_text TEXT NOT NULL,
    ->     user_ip VARCHAR(45),
    ->     comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (news_id) REFERENCES news(id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE ratings (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     news_id INT,
    ->     user_ip VARCHAR(45),
    ->     rating TINYINT CHECK (rating >= 1 AND rating <= 5),
    ->     UNIQUE(news_id, user_ip),
    ->     FOREIGN KEY (news_id) REFERENCES news(id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO categories (name)
    -> VALUES
    -> ('Sports'),
    -> ('News'),
    -> ('eSport');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO news (title, content, category_id) VALUES 
    -> ('title 1 news', 'text 1 news', 1),
    -> ('title 2 news', 'text 2 news', 2);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO comments (news_id, comment_text, user_ip) VALUES 
    -> (1, 'Great news!', '192.168.0.1'),
    -> (2, 'I disagree with the author', '192.168.0.2');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO ratings (news_id, user_ip, rating) VALUES 
    -> (1, '192.168.0.1', 5),
    -> (2, '192.168.0.2', 4);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT n.title, n.content, c.name AS category, 
    ->        GROUP_CONCAT(com.comment_text SEPARATOR '; ') AS comments,
    ->        AVG(r.rating) AS average_rating
    -> FROM news n
    -> LEFT JOIN categories c ON n.category_id = c.id
    -> LEFT JOIN comments com ON n.id = com.news_id
    -> LEFT JOIN ratings r ON n.id = r.news_id
    -> GROUP BY n.id;
+--------------+-------------+----------+----------------------------+----------------+
| title        | content     | category | comments                   | average_rating |
+--------------+-------------+----------+----------------------------+----------------+
| title 1 news | text 1 news | Sports   | Great news!                |         5.0000 |
| title 2 news | text 2 news | News     | I disagree with the author |         4.0000 |
+--------------+-------------+----------+----------------------------+----------------+
2 rows in set (0.00 sec)

mysql> Terminal close -- exit!
