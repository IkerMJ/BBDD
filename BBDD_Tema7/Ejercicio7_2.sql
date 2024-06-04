SET SERVEROUTPUT ON;
DECLARE
    codPostal1 objCodPostal := objCodPostal(001, 41);
    codPostal2 objCodPostal := objCodPostal(001, 28);
    dom1 objDomicilio := objDomicilio('Avenida', 'Postigo', 100, '1º A');
    dom2 objDomicilio := objDomicilio('Calle', 'Salado', 114, '21º Izq Bloque 2');
    nombre1 objNombreCompleto := objNombreCompleto('Angela', 'Negro', 'Castilla');
    nombre2 objNombreCompleto := objNombreCompleto('Tom', 'Oxley', null);
    datosPer1 objDatosPersonales:= objDatosPersonales(1, nombre1, dom1, codPostal1, '18/04/1991');
    datosPer2 objDatosPersonales:= objDatosPersonales(2, nombre2, dom2, codPostal2, '30/05/1983');
BEGIN
    DBMS_OUTPUT.PUT_LINE(datosPer1.nombreCompleto.nombre);
END;
