SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Ejercicio7(i_num IN NUMBER) RETURN VARCHAR IS
    vNum NUMBER:=i_num;
    resultado BOOLEAN;
BEGIN
    IF MOD(vNum,2) =0 THEN
        resultado := TRUE;
        RETURN 'TRUE';
    ELSE
        resultado := FALSE;
        RETURN 'FALSE';
    END IF;
END;

SELECT Ejercicio7(2) FROM DUAL;
