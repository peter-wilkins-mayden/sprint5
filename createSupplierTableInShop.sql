CREATE TABLE supplier (
  `id`                INT(11) PRIMARY KEY                NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(50)                        NOT NULL,
  `contact_name`        VARCHAR(150)                        NOT NULL,
  `email`             VARCHAR(320) NOT NULL,
  `telephone`         VARCHAR(12) NOT NULL,
  `website`             VARCHAR(320) ,
  `date_created`      DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `date_last_updated` DATETIME                                    DEFAULT CURRENT_TIMESTAMP
);