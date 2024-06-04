CREATE OR REPLACE TYPE empleado AS OBJECT (
    dni VARCHAR2(9),
    nombre VARCHAR2(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    telefono NUMBER(9)
) NOT FINAL;

CREATE OR REPLACE TYPE inspector UNDER empleado (
    especialidad VARCHAR2(30)
);

CREATE OR REPLACE TYPE policia UNDER empleado (
     categoria VARCHAR2(30),
     salarioBase NUMBER,
     MEMBER FUNCTION calculaSalario(salarioBase NUMBER) RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY policia AS
    MEMBER FUNCTION calculaSalario(salarioBase NUMBER) RETURN NUMBER IS
        salarioFinal NUMBER;
    BEGIN
        IF (SELF.categoria = 'LOCAL') THEN
            salarioFinal := salarioBase * 1.05;
        ELSIF (SELF.categoria = 'NACIONAL') THEN
            salarioFinal := salarioBase * 1.15;
        ELSIF (SELF.categoria = 'OPERACIONES ESPECIALES') THEN
            salarioFinal := salarioBase * 1.20;
        END IF;
        RETURN salarioFinal;
    END;
END;

CREATE TABLE inspectores OF inspector;
CREATE TABLE policias OF policia;
