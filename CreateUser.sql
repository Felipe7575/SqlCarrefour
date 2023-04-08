USE carrefour;

CREATE USER 'juan'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT  ON * . *  TO 'juan'@'localhost';

SHOW GRANTS FOR 'juan'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';

GRANT CREATE, SELECT, INSERT, UPDATE  ON * . *  TO 'admin'@'localhost';

SHOW GRANTS FOR 'admin'@'localhost';