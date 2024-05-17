SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Ejercicio8(i_dia in NUMBER) IS
    vDia NUMBER := i_dia;
    cad VARCHAR2(9);
BEGIN
    CASE vDia
        WHEN 1 THEN cad := 'Lunes';
        WHEN 2 THEN cad := 'Martes';
        WHEN 3 THEN cad := 'Miercoles';
        WHEN 4 THEN cad := 'Jueves';
        When 5 THEN cad := 'Vienes';
        WHEN 6 THEN cad := 'Sabado';
        WHEN 7 THEN cad := 'Domingo'; 
    END CASE;
    DBMS_OUTPUT.PUT_LINE(cad);
END;

CALL Ejercicio8(1);
