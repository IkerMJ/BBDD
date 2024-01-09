CREATE TABLE FABRICANTE(
    CODFAB NUMBER(4) NOT NULL,
    FABRICANTE VARCHAR(42) NOT NULL,
    CONSTRAINT PK_FABRICANTE PRIMARY KEY(CODFAB)
);                                                                          //NO ESTA ACABADO!!!!

CREATE TABLE MARCA(
    CODMARCA NUMBER(4) NOT NULL,
    MARCA VARCHAR(255) NOT NULL,
    CONSTRAINT PK_MARCA PRIMARY KEY(CODMARCA)
);

CREATE TABLE VEHICULO(
    CODVEH NUMBER(4) NOT NULL,
    MODELO VARCHAR(42) NOT NULL,
    TIPO VARCHAR(24) NOT NULL,
    COLOR VARCHAR(90) NOT NULL,
    CODFAB NUMBER(4) NOT NULL,
    CODMARCA NUMBER(4) NOT NULL,
    CONSTRAINT PK_VEHICULO PRIMARY KEY(CODVEH),
    CONSTRAINT FK_FABRICANTE FOREIGN KEY(CODFAB) REFERENCES FABRICANTE(CODFAB),
    CONSTRAINT FK_MARCA FOREIGN KEY(CODMARCA) REFERENCES MARCA(CODMARCA)
);

CREATE TABLE CLIENTE(
    DNI_CLIENTE VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(41) NOT NULL,
    AP1 VARCHAR(35) NOT NULL,
    AP2 VARCHAR(35) NULL,
    DOMICILIO VARCHAR(20) NOT NULL,
    NUMTARJETA VARCHAR(20) NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY(DNI_CLIENTE)
);

CREATE TABLE EMPLEADO(
    DNI_EMPLEADO VARCHAR(9) NOT NULL,
    NOMBRE VARCHAR(41) NOT NULL,
    AP1 VARCHAR(35) NOT NULL,
    AP2 VARCHAR(35) NULL,
    DOMICILIO VARCHAR(20) NOT NULL,
    NUMCUENTA VARCHAR(20) NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY(DNI_EMPLEADO)

);

CREATE TABLE ALQUILER(
    CODALQUILER
    FECHA
    NUMDIAS
    KMACTUAL
    KMENTREGA
    DNI_CLIENTE
    DNI_EMPLEADO
    CODVEH
    CONSTRAINT PK_VEHICULO PRIMARY KEY(CODVEH),
    CONSTRAINT FK_FABRICANTE FOREIGN KEY(CODFAB) REFERENCES FABRICANTE(CODFAB),
    CONSTRAINT FK_MARCA FOREIGN KEY(CODMARCA) REFERENCES MARCA(CODMARCA),
    CONSTRAINT FK_MARCA FOREIGN KEY(CODMARCA) REFERENCES MARCA(CODMARCA),

);
