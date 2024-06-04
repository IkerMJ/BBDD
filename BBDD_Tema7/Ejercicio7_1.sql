CREATE OR REPLACE TYPE objCodPostal AS OBJECT(
    localidad NUMBER(3),
    provincia NUMBER(2)
);

CREATE OR REPLACE TYPE objDomicilio AS OBJECT(
    tipoVia VARCHAR(30),
    nombreVia VARCHAR(30),
    numero NUMBER,
    restoDomicilio VARCHAR(30)
);

CREATE OR REPLACE TYPE objNombreCompleto AS OBJECT(
    nombre VARCHAR(30),
    prApellido VARCHAR(30),
    sgApellido VARCHAR(30)
);

CREATE OR REPLACE TYPE objDatosPersonales AS OBJECT(
    codigoDP NUMBER,
    nombreCompleto objNombreCompleto,
    domicilio objDomicilio,
    codigoPostal objCodPostal,
    fechaNacimiento DATE
);
