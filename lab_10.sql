mysql> CREATE TABLE IF NOT EXISTS `Metros` (
    ->     `metro_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `metro_name` VARCHAR(255) NOT NULL
    -> );

mysql> CREATE TABLE IF NOT EXISTS `Stations` (
    ->     `station_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `station_name` VARCHAR(255) NOT NULL,
    ->     `metro_id` INT NOT NULL,
    ->     FOREIGN KEY (`metro_id`) REFERENCES `Metros`(`metro_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `MetroLines` (
    ->     `line_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `line_name` VARCHAR(255) NOT NULL,
    ->     `line_color` VARCHAR(50) NOT NULL,
    ->     `metro_id` INT NOT NULL,
    ->     FOREIGN KEY (`metro_id`) REFERENCES `Metros`(`metro_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `StationLines` (
    ->     `station_id` INT NOT NULL,
    ->     `line_id` INT NOT NULL,
    ->     `station_position_on_line` INT NOT NULL,
    ->     PRIMARY KEY (`station_id`, `line_id`),
    ->     FOREIGN KEY (`station_id`) REFERENCES `Stations`(`station_id`),
    ->     FOREIGN KEY (`line_id`) REFERENCES `MetroLines`(`line_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `Transfers` (
    ->     `transfer_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `station_from_id` INT NOT NULL,
    ->     `station_to_id` INT NOT NULL,
    ->     `transfer_type` ENUM('DIRECT', 'INDIRECT') NOT NULL,
    ->     `transfer_distance` DECIMAL(5,2) NOT NULL,
    ->     FOREIGN KEY (`station_from_id`) REFERENCES `Stations`(`station_id`),
    ->     FOREIGN KEY (`station_to_id`) REFERENCES `Stations`(`station_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `LineExtensions` (
    ->     `extension_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `line_id` INT NOT NULL,
    ->     `station_id` INT NOT NULL,
    ->     `extension_action` ENUM('ADD', 'REMOVE') NOT NULL,
    ->     `extension_date` DATE NOT NULL,
    ->     FOREIGN KEY (`line_id`) REFERENCES `MetroLines`(`line_id`),
    ->     FOREIGN KEY (`station_id`) REFERENCES `Stations`(`station_id`)
    -> );

mysql> Terminal close -- exit!
