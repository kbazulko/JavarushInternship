CREATE DATABASE IF NOT EXISTS intern ;

DROP TABLE IF EXISTS intern.users;
CREATE TABLE intern.users (
  id INT(8) NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  age INT NOT NULL,
  is_admin BIT NOT NULL DEFAULT false,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID));

INSERT INTO intern.users (name, age) VALUES ('Bender', '25');
INSERT INTO intern.users (name, age) VALUES ('Leela', '23');
INSERT INTO intern.users (name, age) VALUES ('Fry', '27');
INSERT INTO intern.users (name, age, is_admin) VALUES ('Admin', '28', b'1');
