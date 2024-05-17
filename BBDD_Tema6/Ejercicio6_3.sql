SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Ejercicio3(i_texto VARCHAR2) IS
    vTexto VARCHAR(50);
    texto VARCHAR(50) := i_texto;
BEGIN
    FOR contador IN REVERSE 1..LENGTH(texto) LOOP
        vTexto := vTexto || SUBSTR(texto, contador, 1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(vTexto);
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error');
END;

CALL Ejercicio3('Hola Mundo');
