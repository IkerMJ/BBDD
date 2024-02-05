CREATE TABLE SEDE(
    CODSEDE NUMBER(4) NOT NULL,
    NOMBRE_SEDE VARCHAR(41) NOT NULL,
    DIRECCION_SEDE VARCHAR(20) NOT NULL,
    CONSTRAINT SEDE PRIMARY KEY(CODSEDE)
);

CREATE TABLE DEPARTAMENTO(
    CODDEP NUMBER(4) NOT NULL,
    NOMBRE_DEP VARCHAR(41) NOT NULL,
    UBICACION VARCHAR(20) NOT NULL,
    CODSEDE NUMBER(4) NOT NULL,
    CONSTRAINT DEPARTAMENTO PRIMARY KEY(CODDEP, CODSEDE),
    CONSTRAINT FK_SEDE FOREIGN KEY(CODSEDE) REFERENCES SEDE(CODSEDE)
);

CREATE TABLE PROGRAMADOR(
    SECUENCIA NUMBER(9) NOT NULL,
    NOMBRE_PROG VARCHAR(41) NOT NULL,
    AP1 VARCHAR(35) NOT NULL,
    AP2 VARCHAR(35) NULL,
    DIRECCION_PROG VARCHAR(20) NOT NULL,
    CUENTA VARCHAR(20) NOT NULL,
    TELEFONO NUMBER(9) NOT NULL,
    TIPO VARCHAR(30) NOT NULL,
    MENTOR VARCHAR(30) NOT NULL,
    CODDEP NUMBER(4) NOT NULL,
    CODSEDE NUMBER(4) NOT NULL,
    CONSTRAINT PROGRAMADOR PRIMARY KEY(SECUENCIA),
    CONSTRAINT FK_DEPARTAMENTO FOREIGN KEY(CODDEP, CODSEDE) REFERENCES DEPARTAMENTO(CODDEP, CODSEDE)
);

CREATE TABLE EQUIPO(
    CODEQUIPO NUMBER(4) NOT NULL,
    DESCRIPCION VARCHAR(40) NOT NULL,
    SECUENCIA NUMBER(9) NOT NULL,
    CONSTRAINT EQUIPO PRIMARY KEY(CODEQUIPO, SECUENCIA),
    CONSTRAINT FK_PROGRAMADOR FOREIGN KEY(SECUENCIA) REFERENCES PROGRAMADOR(SECUENCIA)
);

CREATE TABLE EQUIPOPROG(
    CODEQUIPO NUMBER(4) NOT NULL,
    SECUENCIA NUMBER(9) NOT NULL,
    CONSTRAINT PK_EQUIPOPROG PRIMARY KEY(CODEQUIPO, SECUENCIA),
    CONSTRAINT FK_EQUIPO2 FOREIGN KEY(CODEQUIPO) REFERENCES EQUIPO(CODEQUIPO),
    CONSTRAINT FK_PROGRAMADOR2 FOREIGN KEY(SECUENCIA) REFERENCES PROGRAMADOR(SECUENCIA)
);

CREATE TABLE PROYECTO(
    CODPROY NUMBER(4) NOT NULL,
    DESCRIPCION VARCHAR(40) NOT NULL,
    FECHAINI DATE NOT NULL,
    FECHAFIN DATE NULL,
    CODSUBPROY NUMBER(4) NOT NULL,
    CODEQUIPO NUMBER(4) NOT NULL,
    CONSTRAINT PROYECTO PRIMARY KEY(CODPROY, CODEQUIPO),
    CONSTRAINT FK_EQUIPO FOREIGN KEY(CODEQUIPO) REFERENCES EQUIPO(CODEQUIPO),
    CONSTRAINT FK_PROYECTO FOREIGN(CODSUBPROY) REFERENCES PROYECTO(CODSUBPROY)
);
