--PARTE 1
--Realizar 5 consultas que combinen información de al menos dos tablas haciendo uso de la cláusula WHERE

--Consulta 1 (nombre y apellido de empleados y ciudad en todas las tiendas. UNE TABLA TRABAJADORES Y TIENDA)
SELECT t.Nombre, t.apellidos, ti.ciudad
    FROM trabajadores t,tienda ti
    WHERE t.tienda_id = ti.id_tienda;
--Consulta 2(nombre y apellido de empleados, tipo de trabajdor y el horario en todas las tiendas. UNE TABLA TRABAJADORES Y TIENDA)
SELECT t.Nombre, t.apellidos,t.tipo,ti.Horario
    FROM trabajadores t,tienda ti
    WHERE t.tienda_id=ti.id_tienda;
--Consulta 3(cantida, precio y el id del departamento que pertencen los productos. UNE TABLA PRODUCTOS Y DEPARTAMENTO)
SELECT p.cantidad, p.precio,d.id_departamento
    FROM productos p,departamento d
    WHERE p.id_producto=d.id_producto;
--Consulta4(descripción del pedido y fecha de entrega. UNE TABLA LINEA DE PEDIDO Y PEDIDOS)
SELECT lp.Descripción,p.Entrega
    FROM Linea_DE_PEDIDO lp,pedidos p
    WHERE lp.id_pedido=p.id_pedido;
--Consulta5(nombre y apellidos de cliente y fecha de entrega. UNE TABLA CLIENTE Y PEDIDOS)
SELECT c.Nombre, c.Apellidos, pe.Entrega
    FROM cliente c, pedidos pe
    WHERE c.dni=pe.CLIENTE_DNI;
--
--Realizar 2 consultas que combinen información de al menos tres tablas haciendo uso de la cláusula WHERE    
--Consulta1(id del departamento, herramiento y el precio de la herramienta. UNE TABLA DEPARTAMENTO, BRICOLAJE Y PRODUCTOS)
SELECT d.id_departamento,b.herramientas,p.precio
    FROM departamento d, bricolaje b, productos p
    WHERE d.id_departamento = b.id_departamento AND d.id_producto = p.id_producto;
--Consulta2(nombre del cliente, id del pedidio y descripción del pedidio. UNE TABLA CLIENTE, PEDIDOS Y LINEA DE PEDIDO)
SELECT  c.nombre, p.id_pedido, li.descripción 
    FROM cliente c, pedidos p, linea_de_pedido li
    WHERE c.dni = p.cliente_dni AND li.id_pedido = p.id_pedido;
--
--Repetir las consultas anteriores haciendo uso de la cláusula JOIN y añadir alguna restricción con WHERE a cada una.
--Consulta1(Las mismas consultas del anterior punto pero utilizando la clausula JOIN)
SELECT trabajadores.Nombre, trabajadores.apellidos, tienda.ciudad
    FROM trabajadores
    JOIN tienda ON (trabajadores.tienda_id = tienda.id_tienda);
--Consulta2
SELECT trabajadores.Nombre, trabajadores.apellidos, trabajadores.tipo, tienda.horario
    FROM trabajadores
    JOIN tienda ON (trabajadores.tienda_id = tienda.id_tienda);
--Consulta3    
SELECT productos.cantidad,productos.precio,departamento.id_departamento
    FROM productos
    JOIN departamento ON (productos.id_producto = departamento.id_producto);
--Consulta4    
SELECT linea_de_pedido.descripción, pedidos.entrega
    FROM linea_de_pedido
    JOIN pedidos ON(linea_de_pedido.id_pedido = pedidos.id_pedido);
--Consulta5   
SELECT cliente.nombre, cliente.apellidos, pedidos.entrega
    FROM cliente
    JOIN pedidos ON(cliente.dni=pedidos.CLIENTE_DNI);
--Consulta6
SELECT d.id_departamento,b.herramientas,p.precio
    FROM departamento d JOIN bricolaje b
    ON d.id_departamento = b.id_departamento
    JOIN productos p
    ON d.id_producto = p.id_producto;

--
--Realizar 1 consulta con LEFT JOIN
--de la tabla CLIENTE, nombre, apellidos y de la tabla PEDIDOS la entrega (fecha de entrega)
SELECT cliente.nombre, cliente.apellidos, pedidos.entrega
    FROM cliente cliente
    LEFT JOIN pedidos pedidos ON(cliente.dni=pedidos.CLIENTE_DNI);
--Realizar 1 consulta con RIGHT JOIN
--de la tabla TRABAJADORES, nombre y apellidos y de la tabla TIENDA la ciudad
SELECT trabajadores.Nombre, trabajadores.apellidos, tienda.ciudad
    FROM trabajadores trabajadores
    RIGHT JOIN tienda tienda ON (trabajadores.tienda_id = tienda.id_tienda);
--Realizar 1 consulta con FULL JOIN
--de la tabla LINEA DE PEDIDOS la descripción del pedido, y de la tabla PEDIDOS la fecha de entrega.
SELECT li.descripción, pe.entrega
    FROM linea_de_pedido li
    FULL JOIN pedidos pe ON(li.id_pedido = pe.id_pedido);


    
    

--Realizar 1 consulta con GROUP BY combinaba con JOIN y ORDER BY

