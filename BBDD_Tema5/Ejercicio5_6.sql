--SELECT dni FROM Profesor P, Departamento D WHERE D.nombre='Informatica y Comunicaciones' AND D.CodDep=P.CodDep;
SELECT P.dni FROM Profesor P JOIN Departamento D USING(CodDep) WHERE D.nombre='Informatica y Comunicaciones';


--SELECT Nombre, prApellido FROM Alumno A, AlumBil B WHERE UPPER (lugar) IN ('MADRID', 'BARCELONA') AND A.dni=B.dni;
SELECT A.Nombre, A.prApellido FROM Alumno A JOIN AlumBil B USING (dni) WHERE UPPER(B.lugar) IN ('MADRID', 'BARCELONA');


--SELECT Al.Nombre, Al.prApellido, Al.sgApellido FROM Alumno Al, Matricula M, Asignatura Ag WHERE UPPER (Ag. Nombre) IN ('BASES DE DATOS', 'ACCESO A DATOS') AND Al.dni=M.dni AND M.CodAsig=Ag.CodAsig;
SELECT Al.Nombre, Al.prApellido, Al.sgApellido FROM Alumno Al JOIN Matricula M USING(Ag.CodAsig) WHERE UPPER(Ag.Nombre) IN('BASES DE DATOS', 'ACCESO A DATOS');


--SELECT Alumno.Nombre, prApellido, sgApellido FROM Alumno Al, Matricula M, Asignatura Ag, Ciclo C WHERE Siglas='DAM' AND nota>=5 AND Al.dni=M.dni AND M. CodAsig=Ag. CodAsig AND Ag.CodCF=C.CodCF;
SELECT Al.Nombre, Al.prApellido, Al.sgApellido FROM Alumno Al JOIN Matricula M USING (dni) JOIN Asignatura Ag USING (CodAsig) JOIN Ciclo C USING (CodCF) WHERE Siglas='DAM' AND M.nota>=5;


--SELECT Ag.Nombre FROM Alumno Al, Matricula M, Asignatura Ag, Ciclo C, Profesor P, Imparte I, Departamento D WHERE NH>100 AND Siglas='DAM' AND Ciclo. Nombre='Informatica y Comunicaciones' And M.curso=2023 AND Ag.CodAsig=I.CodASig AND I.dni=P.dni AND P.CodDep=D.CodDep AND Al.dni=M.dni AND M.CodAsig=Ag.CodAsig AND Ag. CodCF=C.CodCF;
SELECT Ag.Nombre FROM Alumno Al JOIN Matricula M USING(dni) JOIN Asignatura Ag USING(CodAsig) JOIN Imparte I USING(CodAsig) JOIN Profesor P USING(dni) JOIN Departamento USING(CodDep) 
UNION
SELECT Ag1.Nombre FROM Asignatura Ag1 JOIN Ciclo C USING(CodAsig) WHERE Ag.NH>100 AND C.Siglas='DAM' AND D.Nombre='Informatica y Comunicaciones' AND M.curso=2023;
