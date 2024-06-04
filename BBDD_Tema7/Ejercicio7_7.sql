DECLARE
    codPostal3 objCodPostal := objCodPostal(003, 28);
    dom3 objDomicilio := objDomicilio('Plaza', 'Espania', 105, '1º A');
    nombre3 objNombreCompleto := objNombreCompleto('Dolores',' Sanchez', 'Gomez');
    profesor1 objProfesor := objProfesor(111, nombre3, dom3, codPostal3, '01/01/1999', '01/09/2021');

    codPostal4 objCodPostal := objCodPostal(660, 28);
    dom4 objDomicilio := objDomicilio('Calle', 'Laguna', 12, NULL);
    nombre4 objNombreCompleto := objNombreCompleto('Luis', 'Marin', 'Sol');
    alumno1 objAlumno := objAlumno(112, nombre4, dom4, codPostal4, '30/04/2004', 4, 4, 5, 7);
BEGIN
    DBMS_OUTPUT.PUT_LINE('La profesora '||profesor1.nombreCompleto.nombre||' fue contratada el '||profesor1.fechaIncorporacion||
        ' y da clase al alumno '||alumno1.nombreCompleto.nombre||', el cual ha sacado en la evaluacion final un '||alumno1.cuEvaluacion);
END;