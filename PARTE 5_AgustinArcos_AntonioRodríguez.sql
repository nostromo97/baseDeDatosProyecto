--PARTE 5
--
--Asignar automáticamente el id a una tabla
CREATE SEQUENCE SEQ_trabajadores_id INCREMENT BY 1 START WITH 100;

CREATE OR REPLACE TRIGGER id_auto 
BEFORE INSERT ON trabajadores
FOR EACH ROW
BEGIN
    :new.trabajadores_id :=seq_trabajadores_id.NEXTVAL;
END;

--Uno de ellos será para insertar en la correspondiente subentidad después de insertar en una superentidad
--



--Trigger que si un sueldo es mayor a 5000 se queda en 5000, la empresa no está para tirar el dinero.
--
CREATE TRIGGER trigger_sueldo
    BEFORE INSERT OR UPDATE OF sueldo
    ON trabajadores
    FOR EACH ROW
    WHEN (new.sueldo > 5000)
      BEGIN
        UPDATE trabajadores
        SET sueldo = 5000
        WHERE trabajadores_id = :new.trabajadores_id;
      END;

select * from trabajadores;



