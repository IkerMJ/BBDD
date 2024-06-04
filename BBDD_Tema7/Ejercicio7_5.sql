CREATE OR REPLACE TYPE persona2 AS OBJECT (
    nombre VARCHAR2(30),
    edad NUMBER,
    CONSTRUCTOR FUNCTION persona2(nombre VARCHAR2, edad NUMBER)
    RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY persona2 AS
    CONSTRUCTOR FUNCTION persona2(nombre VARCHAR2, edad NUMBER)
    RETURN SELF AS RESULT IS
    BEGIN
        self.nombre := nombre;
        self.edad := edad;
        RETURN;
    END;
END;    

DECLARE
    vPersona persona2 := persona2('Luis', 21);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nombre: '||vPersona.nombre);
    DBMS_OUTPUT.PUT_LINE('Edad: '||vPersona.edad);
END;
