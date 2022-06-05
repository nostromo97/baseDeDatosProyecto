
--Procedimiento que muestra el nombre de todos los trabajadores.
CREATE OR REPLACE PROCEDURE mostrarTrabajadores AS
BEGIN
select * FROM trabajadores;
END;

EXEC mostrarTrabajadores;
--Funci�n que aumenta el salario de un trabajador.
--
CREATE OR REPLACE FUNCTION aumentar_sueldo (salario number, aumento number) return NUMBER
IS
    BEGIN
    RETURN salario + aumento;
    END;

SELECT * FROM trabajadores;
--Con esta funci�n vamos a subir el sueldo a Emilio P�rez que gana 900 euros.
--En argumentos pasamos el sueldo del trabajador y cuanto queremos a�adirle, en este caso, 300 euros m�s
SELECT aumentar_sueldo(900,300) FROM trabajadores WHERE trabajadores_id = 33;


