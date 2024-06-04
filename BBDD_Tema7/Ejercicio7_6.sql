CREATE OR REPLACE TYPE objDatosPersonales AS OBJECT(
    codigoDP NUMBER,
    nombreCompleto objNombreCompleto,
    domicilio objDomicilio,
    codigoPostal objCodPostal,
    fechaNacimiento DATE
) NOT FINAL;

CREATE OR REPLACE TYPE objProfesor UNDER objDatosPersonales(
    fechaIncorporacion DATE
);

CREATE OR REPLACE TYPE objAlumno UNDER objDatosPersonales(
    prEvaluacion NUMBER,
    sgEvaluacion NUMBER,
    trEvaluacion NUMBER,
    cuEvaluacion NUMBER
);
