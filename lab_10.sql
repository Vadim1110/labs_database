mysql> CREATE TABLE IF NOT EXISTS `metros` (
    ->     `id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `metro_name` VARCHAR(255) NOT NULL
    -> );

mysql> CREATE TABLE IF NOT EXISTS `stations` (
    ->     `station_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `station_name` VARCHAR(255) NOT NULL,
    ->     `metro_id` INT NOT NULL,
    ->     FOREIGN KEY (`metro_id`) REFERENCES `metros`(`metro_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `metro_lines` (
    ->     `line_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `line_name` VARCHAR(255) NOT NULL,
    ->     `line_color` VARCHAR(50) NOT NULL,
    ->     `metro_id` INT NOT NULL,
    ->     FOREIGN KEY (`metro_id`) REFERENCES `metros`(`metro_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `station_lines` (
    ->     `station_id` INT NOT NULL,
    ->     `line_id` INT NOT NULL,
    ->     `station_position_on_line` INT NOT NULL,
    ->     PRIMARY KEY (`station_id`, `line_id`),
    ->     FOREIGN KEY (`station_id`) REFERENCES `stations`(`station_id`),
    ->     FOREIGN KEY (`line_id`) REFERENCES `metro_lines`(`line_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `transfers` (
    ->     `transfer_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `station_from_id` INT NOT NULL,
    ->     `station_to_id` INT NOT NULL,
    ->     `transfer_type` ENUM('DIRECT', 'INDIRECT') NOT NULL,
    ->     `transfer_distance` DECIMAL(5,2) NOT NULL,
    ->     FOREIGN KEY (`station_from_id`) REFERENCES `stations`(`station_id`),
    ->     FOREIGN KEY (`station_to_id`) REFERENCES `stations`(`station_id`)
    -> );

mysql> CREATE TABLE IF NOT EXISTS `line_extensions` (
    ->     `extension_id` INT PRIMARY KEY AUTO_INCREMENT,
    ->     `line_id` INT NOT NULL,
    ->     `station_id` INT NOT NULL,
    ->     `extension_action` ENUM('ADD', 'REMOVE') NOT NULL,
    ->     `extension_date` DATE NOT NULL,
    ->     FOREIGN KEY (`line_id`) REFERENCES `metro_lines`(`line_id`),
    ->     FOREIGN KEY (`station_id`) REFERENCES `stations`(`station_id`)
    -> );
    