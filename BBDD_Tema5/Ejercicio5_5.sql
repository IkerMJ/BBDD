SELECT Dni FROM EMPLEADO WHERE Ciudad IN('Barcelona', 'Madrid', 'Sevilla', 'Málaga') AND Nombre NOT IN('Antonio', 'Luis') AND prApellido = 'Garcia';

SELECT Dni FROM EMPLEADO WHERE Ciudad != 'Sevilla' AND Ciudad IN('Barcelona', 'Madrid') AND NOMBRE LIKE 'M%';

SELECT Dni FROM EMPLEADO WHERE Ciudad = 'Sevilla' AND NOT IN('Barcelona', 'Madrid') AND NOMBRE NOT LIKE 'M%';

SELECT Nombre, prApellido FROM EMPLEADO WHERE (Ciudad IN('Valencia', 'Vizcaya') OR Ciudad LIKE '%a') AND ORDER BY prApellido DESC;

SELECT Dni FROM EMPLEADO WHERE Ciudad = 'Barcelona' AND Nombre IN('Antonio', 'Luis', 'Ivan', 'Pedro') AND (prApellido IN('Garcia', 'Cantos') OR sgApellido IN('Garcia', 'Cantos'));

SELECT Nombre, prApellido, sgApellido FROM EMPLEADO WHERE Dni LIKE '%4%' AND Nombre IN('Rosa', 'Luis', 'Ramon', 'Antonio') AND ORDER BY prApellido DESC;

SELECT Dni FROM EMPLEADO WHERE Nombre = 'Antonio' AND prApellido NOT LIKE '%c%' AND sgApellido IN('Garcia', 'Gomez', 'Sanchez') AND ORDER BY sgApellido;

SELECT Dni FROM EMPLEADO WHERE sgApellido IS NULL;
