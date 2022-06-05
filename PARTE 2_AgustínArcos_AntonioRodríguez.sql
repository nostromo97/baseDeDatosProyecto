--PARTE 2
--Realizar 3 consultas con GROUP BY que empleen las cláusulas WHERE, HAVING y ORDER BY 
--
--Consulta 1(Nombre del trabajador y el sueldo que más gana en cada departamento, donde el sueldo sea  mayor de 1000 euros)
SELECT Nombre, MAX(sueldo)
    FROM trabajadores
    WHERE sueldo>1000
    GROUP BY Nombre; 
--Consulta 2(id del trabajador, el nombre y máximo sueldo de cada trabajador, donde el sueldo sea mayor de 1000 euros)
SELECT trabajadores_id,nombre, MAX(sueldo)
    FROM trabajadores
    GROUP BY trabajadores_id,nombre
     HAVING MAX(sueldo) > 1000;
--Consulta 3(El dni, nombre y apellido del trabajdor. Ordenado de menor a mayor según el número del dni.)
    SELECT DNI,nombre,apellidos,MAX(sueldo)
        FROM trabajadores
        GROUP BY DNI,nombre,apellidos
        ORDER by DNI;
--Consulta 4(El id del pedido y el dni del cliente al que le corresponde el pedido. Ordenado de menor a mayor según el id del pedido.)
    SELECT p.id_pedido,c.DNI
    FROM cliente c JOIN pedidos p
    ON (c.DNI=p.cliente_DNI)
    GROUP BY p.id_pedido,c.dni
    ORDER by p.id_pedido;
--
--Realizar 1 consulta con GROUP BY combinaba con JOIN y ORDER BY
--
--Fecha de entrega del pedido y dirección del pedido. Ordenados de menor a mayor la fecha.
    SELECT p.entrega,c.dirección
    FROM cliente c JOIN pedidos p
    ON (c.dni=p.cliente_dni)
    GROUP BY p.entrega,c.dirección
    ORDER by c.dirección;
