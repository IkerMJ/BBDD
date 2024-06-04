SET SERVEROUTPUT ON;
DECLARE
    poli1 policia;
    poli2 policia;
    poli3 policia;
    salarioFinal NUMBER;
BEGIN
    poli1 := new policia('94751846K', 'Pedro', 'Lopez', 'Garcia', 656332345, 'LOCAL', 1500);
    poli2 := new policia('12637432F', 'Luis', 'Garcia', 'Diez', 666983456, 'NACIONAL', 1700);
    poli3 := new policia('12312560I', 'Pablo', 'Garcia', 'Merino', 685132008, 'OPERACIONES ESPECIALES', 2200);
    
    DBMS_OUTPUT.PUT_lINE(poli1.telefono);
    DBMS_OUTPUT.PUT_lINE(poli2.nombre);
    DBMS_OUTPUT.PUT_lINE('El DNI del policia es: '||poli3.dni||' y su nombre es: '||poli3.nombre);
    
    salarioFinal := poli1.calculaSalario(1500);
    DBMS_OUTPUT.PUT_lINE(salarioFinal);
    
    
    INSERT INTO policias VALUES(poli1);
    INSERT INTO policias VALUES(poli2);
    INSERT INTO policias VALUES(poli3);
    COMMIT;
    
    UPDATE policias SET salarioBase = poli1.calculaSalario(salarioBase) WHERE dni = poli1.dni;
    UPDATE policias SET salarioBase = poli2.calculaSalario(salarioBase) WHERE dni = poli2.dni;
    UPDATE policias SET salarioBase = poli3.calculaSalario(salarioBase) WHERE dni = poli3.dni;
END;

DECLARE
    inspector1 inspector;
    inspector2 inspector;
BEGIN
    inspector1 := new inspector('45363386G', 'Juan', 'Alonso', 'Fuentes', 676842133, 'Forense');
    inspector2 := new inspector('00458235D', 'Pepe', 'Garcia', 'Martin', 665437884, 'Trafico');
    
    DBMS_OUTPUT.PUT_lINE(inspector1.especialidad);
    DBMS_OUTPUT.PUT_lINE('El DNI del inspector es: '||inspector2.dni||' y su nombre es: '||inspector2.nombre);
    
    INSERT INTO inspectores VALUES(inspector1);
    INSERT INTO inspectores VALUES(inspector2);
    COMMIT;
    
    UPDATE inspectores SET especialidad = 'Forense' WHERE dni = inspector1.dni;
    UPDATE inspectores SET especialidad = 'Trafico' WHERE dni = inspector2.dni;
END;
