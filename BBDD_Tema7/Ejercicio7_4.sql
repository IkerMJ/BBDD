CREATE OR REPLACE TYPE persona AS OBJECT(
    dni varchar(9),
    nombre varchar(30),
    prApellido varchar(30),
    sgApellido varchar(30),
    fechaNacimiento DATE,
    MEMBER FUNCTION muestraEdad RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY persona AS
MEMBER FUNCTION muestraEdad RETURN NUMBER IS
    edad NUMBER;
BEGIN
    edad := (EXTRACT(YEAR FROM SYSDATE)) - (EXTRACT(YEAR FROM fechaNacimiento));
    RETURN edad;
    END muestraEdad;
END;
