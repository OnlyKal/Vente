CREATE TABLE IF NOT EXISTS `users` (`id`	INTEGER PRIMARY KEY AUTOINCREMENT, `name`	varchar ( 100 ) DEFAULT NULL,`username`	varchar ( 100 ) DEFAULT NOT NULL,`password`	varchar ( 50 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL,`role`	varchar ( 20 ) DEFAULT NULL);


CREATE TABLE IF NOT EXISTS `exircise` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`start_date`	TIMESTAMP ,`end_date`	TIMESTAMP,`Statut`	BOOLEAN NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS `config_general` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 50 ) DEFAULT NULL,`value`	text);

CREATE TABLE IF NOT EXISTS `etablishement` (`name`	varchar ( 100 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL,`email`	varchar ( 100 ) DEFAULT NULL,`description`	varchar ( 100 ) DEFAULT NULL);

CREATE TABLE IF NOT EXISTS `unit_of_measure` (`id`	INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 100 ) DEFAULT NULL,`symbole`	varchar (5) DEFAULT NULL);
CREATE TABLE IF NOT EXISTS `currencies` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`varchar ( 50 ) DEFAULT NULL,`symbole`varchar ( 50 ) DEFAULT NULL);

CREATE TABLE IF NOT EXISTS `clients` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 100 ) DEFAULT NULL,`adress`	varchar ( 255 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL);

CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 255 ) DEFAULT NULL);
CREATE TABLE IF NOT EXISTS `product` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 255 ) DEFAULT NULL,`description`	varchar ( 255 ) DEFAULT NULL,`id_categorie`	INTEGER );
CREATE TABLE IF NOT EXISTS `supply` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date_supply` TIMESTAMP, `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, `amount`	float DEFAULT 0,`currency_id`	INTEGER, `user_id`	INTEGER,`exercise_id` INTEGER);

CREATE TABLE IF NOT EXISTS `stock` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT,`supply_id`	INTEGER ,`product_id`	INTEGER,`code`	varchar ( 50 ) DEFAULT NULL, `currency_id`	INTEGER,`quantity`	float DEFAULT NULL,`unit_price`	float DEFAULT NULL,`unit_of_measure`	INTEGER,`expiration_date`	TIMESTAMP, `manufacturing_date`	TIMESTAMP ,`exercise_id` INTEGER,`lot_number`	varchar ( 100 ) DEFAULT ' ');


CREATE TABLE IF NOT EXISTS `invoince` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`client_id`	INTEGER,`invoince_date`	TIMESTAMP,`create_at`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`Description`	text,`user_id`	INTEGER ,`exercise_id`	INTEGER );

CREATE TABLE IF NOT EXISTS `services` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`currency_id`	INTEGER,`invoince_id`	INTEGER ,`quantity`	float,`unit_price`	float,`description`	varchar ( 255 ),`served_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`id_product`	INTEGER);
CREATE TABLE IF NOT EXISTS `note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`number`	VARCHAR ( 10 ) NOT NULL,`invoice_id`	INTEGER ,`amount`	float DEFAULT 0,`currency_id`	INTEGER,`note_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id`	INTEGER ,`user_id`	INTEGER);
CREATE TABLE IF NOT EXISTS `sales` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`stock_id`	INTEGER,`currency_id`	INTEGER,`invoince_id`	INTEGER,`unit_of_measure_id`	int ( 10 ) DEFAULT NULL,`quantity`	float DEFAULT NULL,`unite_price`	float DEFAULT NULL,`sale_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id`	INTEGER );

CREATE TABLE IF NOT EXISTS `cash` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`curreny_id`	INTEGER,`date_cash`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id` INTEGER,`courier`	varchar ( 30 ) NOT NULL COMMENT 'le coursier ou la personne envoyer par le client pour payer a son compte',`amount`	float DEFAULT 0,`exercise_id`	INTEGER ,`user_id`	INTEGER,`comment`	varchar ( 100 ) );

CREATE TABLE IF NOT EXISTS `inventories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`exercise_id`	INTEGER,`product_id`	INTEGER,`theoretical_inventory`	float DEFAULT 0,`physical_inventory`	float DEFAULT 0,`inventory_cash`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`user_id`	INTEGER);


