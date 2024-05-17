SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Ejercicio2(i_num1 NUMBER, i_num2 NUMBER) RETURN NUMBER IS
    vNum1 NUMBER(20);
    vNum1 NUMBER(20) := i_num1;
    vNum2 NUMBER(20);
    vNum2 NUMBER(20) := i_num2;
    vResultado NUMBER(20);
BEGIN
    vResultado := i_num1 / i_num2;
    RETURN vResultado;
EXCEPTION
    WHEN ZERO_DIVIDE THEN vResultado := -999;
    RETURN vResultado;
END;

SELECT Ejercicio2(20, 5) FROM DUAL;
SELECT Ejercicio2(20, 0) FROM DUAL;
