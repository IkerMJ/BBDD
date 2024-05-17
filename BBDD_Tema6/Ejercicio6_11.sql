SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Ejercicio11(i_dni IN VARCHAR)RETURN VARCHAR2 IS
    vDni CONDUCTOR.DNI%TYPE := i_dni;
    prApellido CONDUCTOR.PRAPELLIDO%TYPE;
    sgApellido CONDUCTOR.SGAPELLIDO%TYPE;
BEGIN
    SELECT PRAPELLIDO, SGAPELLIDO INTO prApellido, sgApellido FROM CONDUCTOR WHERE DNI = vDni;
    RETURN (prApellido||' '||sgApellido);
END;

SELECT ejercicio11('12354678A') from dual;
