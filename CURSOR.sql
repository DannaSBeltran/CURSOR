
CREATE DATABASE tallerc;
USE tallerc;
CREATE TABLE productos (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  precio INT,
  stock INT
);


INSERT INTO productos (id,nombre, precio, stock) VALUES
  ('1','manzanas', 3000, 200),
  ('2','leche', 5000, 250),
  ('3','jamon', 6000, 200);
  
  USE tallerc;

DELIMITER //

CREATE PROCEDURE productos_cursor()
BEGIN
 DECLARE done INT DEFAULT FALSE;
 DECLARE id INT;
 DECLARE nombre VARCHAR(100);
 DECLARE precio INT;
 DECLARE stock INT;

 DECLARE cur CURSOR FOR SELECT id, nombre, precio, stock FROM productos;

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 OPEN cur;

 read_loop: LOOP
    FETCH cur INTO id, nombre, precio, stock;

    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT id, nombre, precio, stock;
 END LOOP;

 CLOSE cur;
 END//

DELIMITER ;
CALL productos_cursor();
select * from productos;





