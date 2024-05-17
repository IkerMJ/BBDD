SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Ejercicio4 IS
    CURSOR cPersonal IS SELECT NOMBRE, FECHA_ALTA FROM EMPLEADOS
    WHERE ID_DEPARTAMENTO = (SELECT ID_DEPARTAMENTO FROM DEPARTAMENTO WHERE NOMBRE = 'Personal');
BEGIN
    FOR emp IN cPersonal LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: '||emp.NOMBRE||', Fecha de alta: '||emp.FECHA_ALTA);
    END LOOP;
END;

CALL Ejercicio4();

CREATE OR REPLACE PROCEDURE Ejercicio4 IS
    CURSOR  cPersonal IS SELECT EMPLEADOS.NOMBRE, FECHA_ALTA FROM DATOSPERSONALES,EMPLEADOS WHERE DATOSPERSONALES.CLAVE_EMPLEADO = EMPLEADOS.ID_EMPLEADO;
    TYPE rEmpleado IS RECORD(
        nombre EMPLEADOS.NOMBRE%TYPE,
        fechaAlta DATOSPERSONALES.FECHA_ALTA%TYPE
    );
    vEmpleado rEmpleado;
BEGIN
    OPEN cEmpleados;
        FETCH cEmpleados INTO vEmpleado;
        WHILE cEmpleados%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE('Nombre: '||emp.NOMBRE||', Fecha de alta: '||emp.FECHA_ALTA);
            FETCH cEmpleados INTO vEmpleado;
        END LOOP;
    CLOSE cEmpleados;
END;

CALL Ejercicio4();
