ALTER TABLE CURSO ADD CONSTRAINT CK_TIPOAULA CHECK 
ALTER TABLE CURSODOCTORANDO DROP CONSTRAINT UK_CURSODOCTORANDO;

INSERT INTO AULA(CODIGOAULA, TIPOAULA) VALUES(1, 'Aula de Practicas');
INSERT INTO AULA(CODIGOAULA, TIPOAULA) VALUES(2, 'Aula Audiovisual');
INSERT INTO AULA(CODIGOAULA, TIPOAULA) VALUES(3, 'Aula Grupos Pequeños');
INSERT INTO AULA(CODIGOAULA, TIPOAULA) VALUES(4, 'Aula Normal');
INSERT INTO AULA(CODIGOAULA, TIPOAULA) VALUES(5, 'Aula Magna');
