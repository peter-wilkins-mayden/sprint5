CREATE TABLE user (
  `id`                INT(11) PRIMARY KEY                NOT NULL AUTO_INCREMENT,
  `username`          VARCHAR(50)                        NOT NULL,
  `password`          CHAR(40)                           NOT NULL,
  `salt`              CHAR(40)                           NOT NULL,
  `first_name`        VARCHAR(50)                        NOT NULL,
  `last_name`         VARCHAR(50)                        NOT NULL,
  `email`             VARCHAR(320),
  `telephone`         VARCHAR(12),
  `date_created`      DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `date_last_updated` DATETIME                                    DEFAULT CURRENT_TIMESTAMP
);