
--Procedimiento que muestra el nombre de todos los trabajadores.
--
CREATE OR REPLACE PROCEDURE 
    Carpinteros_RECUENTO (P_NUMERO IN INTEGER)AS
    DECLARE
    Carpintero IN INTEGER :=0;
    BEGIN
    for i IN 1..P_NUMERO LOOP
    if(tipo LIKE 'Carpintero')THEN
    Carpintero := Carpintero + 1;
    END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Número de carpinteros: ' || carpintero);
    END;
  exec Carpinteros_RECUENTO(18);
  
--Función que aumenta el salario de un trabajador.
--
CREATE OR REPLACE FUNCTION aumentar_sueldo (trabajadores_id NUMBER, aumento number) return NUMBER
IS
    BEGIN
    RETURN salario + aumento;
    END;

SELECT sueldo FROM trabajadores WHERE trabajadores_id=33;
--Con esta función vamos a subir el sueldo a Emilio Pérez que gana 900 euros.
--En argumentos pasamos el id del trabajador y cuanto queremos añadirle, en este caso, 300 euros más
SELECT aumentar_sueldo(33,300) FROM trabajadores;




