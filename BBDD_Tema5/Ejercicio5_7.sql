CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');



CONSULTAS SOBRE UNA TABLA
a. SELECT nombre FROM productos;

b. SELECT nombre AS "nombre de producto", precio AS "euros", precio*1.12 AS "dolares" FROM productos;

c. SELECT UPPER(nombre), precio FROM productos;

d. SELECT LOWER(nombre), precio FROM productos;

e. SELECT nombre, ROUND(precio) FROM productos;

f. SELECT nombre, TRUNC(precio) FROM productos;

g. SELECT id_fabricante FROM productos;

h. SELECT DISTINCT id_fabricante FROM productos;

i. SELECT nombre FROM fabricantes ORDER BY nombre ASC;

j. SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;

k. SELECT nombre FROM productos WHERE precio>=400;

l. SELECT nombre FROM productos WHERE precio<400;

m. SELECT nombre FROM productos WHERE precio>=80 AND precio<=300;

n. SELECT nombre FROM productos WHERE precio BETWEEN 60 AND 200;

o. SELECT nombre FROM productos WHERE precio>200 AND id_fabricante=6;

p. SELECT nombre FROM productos WHERE id_fabricante IN(1, 3, 5);

q. SELECT nombre FROM fabricantes WHERE nombre LIKE 'S%';

r. SELECT nombre FROM fabricantes WHERE nombre LIKE '%e';

s. SELECT nombre FROM fabricantes WHERE nombre LIKE '%w%';


CONSULTAS MULTITABLA(Composición interna)
1) SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id;

2) SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id ORDER BY fabricantes.nombre;

3) SELECT productos.id, productos.nombre, fabricantes.id, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id;

4) SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id ORDER BY productos.precio ASC LIMIT 1;

5) SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id ORDER BY productos.precio DESC LIMIT 1;

6) SELECT productos.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre='Lenovo';

7) SELECT productos.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre='Crucial' AND productos.precio>200;

8) SELECT productos.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre='Asus' OR fabricantes.nombre='Hewlett-Packard' OR fabricantes.nombre='Seagate';

9) SELECT productos.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre IN('Asus', 'Hewlett-Packard', 'Seagate');

10) SELECT productos.nombre, productos.precio FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre LIKE '%e';

11) SELECT productos.nombre, productos.precio FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE fabricantes.nombre LIKE '%w%';

12) SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos JOIN fabricantes ON productos.id_fabricante=fabricantes.id WHERE productos.precio>=180 ORDER BY productos.precio DESC, productos.nombre ASC;


CONSULTAS MULTITABLA(Composición externa)
A. SELECT fabricantes.nombre, productos.nombre FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante;

B. SELECT nombre FROM fabricantes LEFT JOIN productos WHERE id IS NULL ON fabricantes.id=productos.id_fabricante;

C. No, ya que el id_fabricante es foreingn key de productos.


CONSULTAS RESUMEN
1) SELECT COUNT(*) FROM productos;

2) SELECT COUNT(DISTINCT id_fabricante) FROM productos;

3) SELECT AVG(precio) FROM productos;

4) SELECT MIN(precio) FROM productos;

5) SELECT nombre, precio FROM productos WHERE precio = (SELECT MAX(precio) FROM productos);

6) SELECT SUM(precio) FROM productos;

7) SELECT COUNT(*) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

8) SELECT AVG(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

9) SELECT MIN(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

10) SELECT MAX(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

11) SELECT SUM(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

12) SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Crucial');

13) SELECT fabricantes.nombre, COUNT(fabricantes.id) FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante GROUP BY fabricantes.nombre ORDER BY COUNT(productos.id) DESC;

14) SELECT fabricantes.nombre, MAX(precio), MIN(precio), AVG(precio) FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante GROUP BY fabricantes.nombre;

15) SELECT id_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM productos GROUP BY id_fabricante HAVING AVG(precio)>200;

16) SELECT fabricantes.nombre, MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante GROUP BY fabricantes.nombre HAVING AVG(precio)>200;

17) SELECT COUNT(*) FROM productos WHERE precio>=180;

18) SELECT fabricantes.nombre, COUNT(*) FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante WHERE precio>=180 GROUP BY fabricantes.nombre;

19) SELECT id_fabricante, AVG(precio) FROM productos GROUP BY id_fabricante;

20) SELECT fabricantes.nombre, AVG(precio) FROM fabricantes LEFT JOIN productos ON fabricantes.id=productos.id_fabricante GROUP BY fabricantes.nombre;

21) SELECT nombre FROM fabricantes WHERE id IN(SELECT id_fabricante FROM productos GROUP BY id_fabricante HAVING AVG(precio)>=150);

22) SELECT nombre FROM fabricantes WHERE id IN(SELECT id_fabricante FROM productos GROUP BY id_fabricante HAVING COUNT(*)>=2);


SUBCONSULTAS(En la cláusula WHERE)
1. SELECT * FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo');

2. SELECT * FROM productos WHERE precio = (SELECT MAX(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo'));

3. SELECT nombre FROM productos WHERE precio = (SELECT MAX(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo')) AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo');

4. SELECT nombre FROM productos WHERE precio = (SELECT MIN(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Hewlett-Packard')) AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Hewlett-Packard');

5. SELECT nombre FROM productos WHERE precio >= (SELECT MAX(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo'));

6. SELECT nombre FROM productos WHERE precio > (SELECT AVG(precio) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus')) AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');


SUBCONSULTAS(Con ALL y ANY)
7. SELECT nombre FROM productos WHERE precio >= ALL(SELECT precio FROM productos);

8. SELECT nombre FROM productos WHERE precio <= ALL(SELECT precio FROM productos);

9. SELECT nombre FROM fabricantes WHERE id = ANY(SELECT id_fabricante FROM productos);

10. SELECT nombre FROM fabricantes WHERE id <> ALL(SELECT id_fabricante FROM productos);


SUBCONSULTAS(Con IN y NOT IN)
11. SELECT nombre FROM fabricantes WHERE IN(SELECT id_fabricante FROM productos);

12. SELECT nombre FROM fabricantes WHERE NOT IN(SELECT id_fabricante FROM productos);


SUBCONSULTAS(Con EXISTS y NOT EXISTS)
13. SELECT nombre FROM fabricantes WHERE EXISTS(SELECT * FROM productos WHERE productos.id_fabricante=fabricantes.id);

14. SELECT nombre FROM fabricantes WHERE NOT EXISTS(SELECT * FROM productos WHERE productos.id_fabricante=fabricantes.id);


SUBCONSULTAS CORRELACIONADAS
15. SELECT F.nombre, P.nombre, P.precio FROM fabricantes F, productos P WHERE P.id_fabricante=F.id AND precio = (SELECT MAX(precio) FROM productos P2 WHERE P2.id_fabricante=F.id);

16. SELECT nombre FROM productos P WHERE precio >= (SELECT AVG(precio) FROM productos P2 WHERE P.id_fabricante=P2.id_fabricante);

17. SELECT P.nombre FROM productos P, fabricantes F WHERE precio = (SELECT MAX(precio) FROM productos P2 WHERE F.nombre='Lenovo' AND P.id_fabricante=P2.id_fabricante);


SUBCONSULTAS(En la cláusula HAVING)
18. SELECT productos, fabricantes.nombre FROM fabricantes, productos GROUP BY productos HAVING(COUNT(*) = (SELECT COUNT(*) FROM productos P, fabricantes F WHERE P.id_fabricante=F.id AND fabricantes.nombre='Lenovo'));
