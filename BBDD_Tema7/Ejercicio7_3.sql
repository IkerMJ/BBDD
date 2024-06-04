CREATE OR REPLACE TYPE objCodPostal AS OBJECT(
    localidad NUMBER(3),
    provincia NUMBER(2),
    MEMBER PROCEDURE iCodPostal(localidad NUMBER, provincia NUMBER)
);

CREATE OR REPLACE TYPE objDomicilio AS OBJECT(
    tipoVia VARCHAR(30),
    nombreVia VARCHAR(30),
    numero NUMBER,
    restoDomicilio VARCHAR(30),
    MEMBER PROCEDURE iDomicilio(tipoVia VARCHAR2, nombreVia VARCHAR2, numero NUMBER, restoDomicilio VARCHAR2)
);

CREATE OR REPLACE TYPE objNombreCompleto AS OBJECT(
    nombre VARCHAR(30),
    prApellido VARCHAR(30),
    sgApellido VARCHAR(30),
    MEMBER PROCEDURE iNombreCompleto(NOMBRE VARCHAR2, PRAPELLIDO VARCHAR2, SGAPELLIDO VARCHAR2)
);

CREATE OR REPLACE TYPE objDatosPersonales AS OBJECT(
    codigoDP NUMBER,
    nombreCompleto objNombreCompleto,
    domicilio objDomicilio,
    codigoPostal objCodPostal,
    fechaNacimiento DATE,
    MEMBER PROCEDURE iDatosPersonales(codigoDP NUMBER, nombreCompleto objNombreCompleto, domicilio objDomicilio, codigoPostal objCodPostal, fechaNacimiento DATE)
);

CREATE OR REPLACE TYPE BODY objCodPostal AS
    MEMBER PROCEDURE iCodPostal(localidad NUMBER, provincia NUMBER) IS
    BEGIN
        SELF.localidad := localidad;
        SELF.provincia := provincia;
    END iCodPostal;
END;

CREATE OR REPLACE TYPE BODY objDomicilio AS
    MEMBER PROCEDURE iDomicilio(tipoVia VARCHAR2, nombreVia VARCHAR2, numero NUMBER, restoDomicilio VARCHAR2) IS
    BEGIN
        SELF.tipoVia := tipoVia;
        SELF.nombreVia := nombreVia;
        SELF.numero := numero;
        SELF.restoDomicilio := restoDomicilio;
    END iDomicilio;
END;

CREATE OR REPLACE TYPE BODY objNombreCompleto AS
    MEMBER PROCEDURE iNombreCompleto(nombre VARCHAR2, prApellido VARCHAR2, sgApellido VARCHAR2) IS
    BEGIN
        SELF.nombre := nombre;
        SELF.prApellido := prApellido;
        SELF.sgApellido := sgApellido;
    END iNombreCompleto;
END;

CREATE OR REPLACE TYPE BODY objDatosPersonales AS
    MEMBER PROCEDURE iDatosPersonales(codigoDP NUMBER, nombreCompleto objNombreCompleto , domicilio objDomicilio, codigoPostal objCodPostal, fechaNacimiento DATE) IS
    BEGIN
        SELF.codigoDP := codigoDP;
        SELF.nombreCompleto := nombreCompleto;
        SELF.domicilio := domicilio;
        SELF.codigoPostal := codigoPostal;
        SELF.fechaNacimiento := fechaNacimiento;
    END iDatosPersonales;
END;

---------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE 
    codPostal1 objCodPostal := objCodPostal(002, 42);
    dom1 objDomicilio := objDomicilio('Calle', 'Rueda', 21, '2º C');
    nombre1 objNombreCompleto := objNombreCompleto('Pedro', 'Alonso', 'Ruiz');
    datosPer1 objDatosPersonales:= objDatosPersonales(112, nombre1, dom1, codPostal1, '12/11/1998');
BEGIN
    DBMS_OUTPUT.PUT_LINE(datosPer1.nombreCompleto.nombre);

    codPostal1.iCodPostal(001, 12);
    dom1.iDomicilio('Calle', 'Fernando', 22, '3º A');
    nombre1.iNombreCompleto('Felipe', 'Fernandez', 'Arroyo');
    datosPer1.iDatosPersonales(113, nombre1, dom1, codPostal1, '22/12/1987');

    DBMS_OUTPUT.PUT_LINE(datosPer1.nombreCompleto.nombre);
END;
