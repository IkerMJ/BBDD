SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Ejercicio9(i_radio IN NUMBER) RETURN NUMBER IS
    radio NUMBER:=i_radio;
    area NUMBER;
BEGIN
    area :=  (3.14 * POWER(radio, 2));
    RETURN area;
END;

SELECT Ejercicio9(12.4) FROM DUAL;
