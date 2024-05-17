SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Ejercicio6 IS
    CURSOR cViajes IS SELECT VIAJES.FECHA FROM VIAJES, CONDUCTOR 
    WHERE VIAJES.DNI_CONDUCTOR = CONDUCTOR.DNI AND CONDUCTOR.NUM_EMPLEADO = (SELECT MIN(NUM_EMPLEADO) FROM CONDUCTOR);
    fechaViaje cViajes%ROWTYPE;
BEGIN
    FOR fechaViaje IN cViajes LOOP
        DBMS_OUTPUT.PUT_LINE('Fechas: '||fechaViaje.FECHA);
    END LOOP;
END;

CALL Ejercicio6();