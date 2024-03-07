SELECT MAX(Precio) FROM Libro;

SELECT MIN(Precio) FROM Libro;

SELECT MIN(Fecha_sal) FROM Edita WHERE dni = 443042293;

SELECT MAX(Fecha_sal) FROM Edita WHERE dni = 29110302;

SELECT MAX(NumPag) FROM Libro WHERE Tematica = 'Novela';

SELECT MIN(NumPag) FROM Libro WHERE Tematica IN('Infantil', 'Cientifica', 'Novela', 'Comico');

SELECT COUNT(*) FROM Libro WHERE Tematica = Cientifica AND Precio BETWEEN 5 AND 15;
