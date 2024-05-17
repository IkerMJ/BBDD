SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Ejercicio10(i_num1 NUMBER, i_num2 NUMBER, i_num3 NUMBER) RETURN NUMBER IS
    vNum1 NUMBER := i_num1;
    vNum2 NUMBER := i_num2;
    vNum3 NUMBER := i_num3;
    vResultado NUMBER;
BEGIN
    vResultado := GREATEST(vNum1, vNum2, vNum3);
    RETURN vResultado;
END;

SELECT Ejercicio10(20, 5, 12) FROM DUAL;
