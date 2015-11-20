SET NAMES utf8;

USE shop;
DROP TABLE IF EXISTS `address`;
CREATE TABLE address (
  `id`                INT(11)                        NOT NULL PRIMARY KEY,
  `user_id`           INT(11)                        NOT NULL,
  `organisation`      VARCHAR(60),
  `address_line_1`    VARCHAR(50)                    NOT NULL,
  `address_line_2`    VARCHAR(60),
  `town`              VARCHAR(35)                    NOT NULL,
  `county`            VARCHAR(20)                    NOT NULL,
  `post_code`         VARCHAR(7)                     NOT NULL,
  `country`           VARCHAR(50)                    NOT NULL,
  `date_created`      DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `date_last_updated` DATETIME DEFAULT CURRENT_TIMESTAMP
);