CREATE TABLE PRODUCTO(
CODPRODUCTO NUMBER(5) NOT NULL,
NOMBRE VARCHAR2(40) NOT NULL,
TIPO VARCHAR2(2) NOT NULL,
PRECIOCOSTE NUMBER(5,2) NOT NULL,
PRECIOVENTA NUMBER(5,2) NOT NULL,
IVA NUMBER(2) NOT NULL,
CONSTRAINT pk_PRODUCTO PRIMARY KEY (CODPRODUCTO)
);

CREATE TABLE VENTA(
CODVENTA NUMBER(5) NOT NULL,
FECHA DATE NOT NULL,
CONSTRAINT pk_VENTA PRIMARY KEY(CODVENTA)
);

CREATE TABLE LINEAVENTA(
CODPRODUCTO NUMBER(5) NOT NULL,
CODVENTA NUMBER(5) NOT NULL,
CANTIDAD NUMBER(2) NOT NULL,
CONSTRAINT pk_lineaventa PRIMARY KEY(CODPRODUCTO,CODVENTA),
CONSTRAINT fk_lineaventa FOREIGN KEY (CODVENTA) REFERENCES VENTA(CODVENTA),
CONSTRAINT fk_linea FOREIGN KEY(CODPRODUCTO) REFERENCES PRODUCTO(CODPRODUCTO)
);

INSERT INTO VENTA(CODVENTA, FECHA) VALUES(10000, '21/01/2023');
INSERT INTO VENTA(CODVENTA, FECHA) VALUES(10001, '20/02/2023');
INSERT INTO VENTA(CODVENTA, FECHA) VALUES(10002, '16/03/2023');
INSERT INTO VENTA(CODVENTA, FECHA) VALUES(10005, '01/01/2023');
INSERT INTO VENTA(CODVENTA, FECHA) VALUES(10010, '23/02/2023');

INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50000, 'QUESO', 'L', 10.52, 25.63, 10);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50005, 'LECHE', 'L', 10.56, 12.55, 4);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50010, 'HUEVOS', 'H', 26.03, 35.20, 10);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50015, 'CARNE POLLO', 'C', 11.20, 40.90, 2);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50020, 'CARNE TERNERA', 'C', 50.79, 64.52, 4);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50025, 'YOGURT', 'L', 2.56, 7.55, 10);
INSERT INTO PRODUCTO(CODPRODUCTO, NOMBRE, TIPO, PRECIOCOSTE, PRECIOVENTA, IVA) VALUES(50030, 'JUDIAS', 'V', 18.90, 20.00, 4);

INSERT INTO LINEAVENTA(CODPRODUCTO, CODVENTA, CANTIDAD) VALUES(50000, 10000, 2);
INSERT INTO LINEAVENTA(CODPRODUCTO, CODVENTA, CANTIDAD) VALUES(50005, 10001, 5);
INSERT INTO LINEAVENTA(CODPRODUCTO, CODVENTA, CANTIDAD) VALUES(50010, 10002, 10);
INSERT INTO LINEAVENTA(CODPRODUCTO, CODVENTA, CANTIDAD) VALUES(50015, 10005, 11);
INSERT INTO LINEAVENTA(CODPRODUCTO, CODVENTA, CANTIDAD) VALUES(50020, 10010, 9);

SELECT COUNT(*) FROM PRODUCTO WHERE PRECIOCOSTE<(PRECIOVENTA/2);

SELECT MAX(PRECIOCOSTE) FROM PRODUCTO WHERE IVA=10;

SELECT MIN(PRECIOCOSTE) FROM PRODUCTO;

SELECT COUNT(*) FROM PRODUCTO WHERE TIPO='C' AND PRECIOCOSTE<(PRECIOVENTA/3);

SELECT SUM((PRECIOVENTA-PRECIOCOSTE)*LINEAVENTA.CANTIDAD) FROM PRODUCTO, LINEAVENTA WHERE PRODUCTO.CODPRODUCTO=LINEAVENTA.CODPRODUCTO AND TIPO='L';

SELECT AVG((PRECIOVENTA-PRECIOCOSTE)*LINEAVENTA.CANTIDAD) FROM PRODUCTO, LINEAVENTA WHERE PRODUCTO.CODPRODUCTO=LINEAVENTA.CODPRODUCTO AND TIPO IN('L','C','V','H');

SELECT TRUNC(PRECIOCOSTE, 1), TRUNC(PRECIOVENTA, 1) FROM PRODUCTO WHERE NOMBRE LIKE 'L%';

SELECT ROUND(PRECIOCOSTE, 1) FROM PRODUCTO WHERE TIPO IN('H', 'L') AND PRECIOVENTA>(PRECIOCOSTE*1.2);

SELECT MOD(PRECIOVENTA, PRECIOCOSTE) FROM PRODUCTO WHERE IVA IN(4,10);

SELECT COUNT(*) FROM LINEAVENTA;

SELECT LOWER(NOMBRE) FROM PRODUCTO WHERE TIPO='L';
