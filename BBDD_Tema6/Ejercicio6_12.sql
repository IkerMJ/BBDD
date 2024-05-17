SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Ejercicio12(i_Dep IN VARCHAR) IS
    vDep DEPARTAMENTO.NOMBRE%TYPE := i_Dep;
    vFechaAlta DATOSPERSONALES.FECHA_ALTA%TYPE;
    vFecha DATE;
    vOk VARCHAR(2) := 'OK';
BEGIN
    SELECT MIN(FECHA_ALTA) INTO vFechaAlta FROM DATOSPERSONALES, DEPARTAMENTO, EMPLEADOS WHERE DEPARTAMENTO.ID_DEPARTAMENTO = EMPLEADOS.ID_DEPARTAMENTO
    AND EMPLEADOS.ID_EMPLEADO = DATOSPERSONALES.CLAVE_EMPLEADO AND DEPARTAMENTO.NOMBRE = vDep;

    SELECT SYSDATE INTO vFecha FROM DUAL;
    UPDATE DATOSPERSONALES SET FECHA_ALTA = vFecha WHERE FECHA_ALTA = vFechaAlta;
    DBMS_OUTPUT.PUT_LINE(vOk);
END;

CALL ejercicio12('Empaque');
SELECT FECHA_ALTA FROM DATOSPERSONALES ORDER BY FECHA_ALTA DESC;