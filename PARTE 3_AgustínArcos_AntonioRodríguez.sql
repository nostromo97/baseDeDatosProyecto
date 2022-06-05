--PARTE 3
--
--Realizar 2 consultas que incluyan subconsultas
--Consulta 1(Subconsulta. Nombre y sueldo del trabajador "Directivo" y a la vez el id de la tienda donde el "Receptionista" de la tabla TRABAJDORES y el sueldo es mayor a 900 euros)
SELECT nombre,sueldo
  FROM trabajadores                                                                
  WHERE tipo = 'Directivo' AND tienda_id IN
       (SELECT DISTINCT tienda_id FROM trabajadores                                                                 
        WHERE tipo = 'Recepcionista' AND sueldo > 900);
--Consulta 2(Subconsulta. Dni y apellidos de los trabajadores tipo "Carpintero" a la vez, dentro de donde el tipo de trabajador "Director de markentig" y sueldo es mayor a 1100 euros)
SELECT dni,apellidos
  FROM trabajadores                                                                
  WHERE tipo = 'Carpintero' AND tienda_id IN
       (SELECT DISTINCT tienda_id FROM trabajadores                                                                 
        WHERE tipo = 'Director_marketing' AND sueldo > 1100);
--Realizar 2 consultas que incluya una subconsulta que use ANY, ALL o IN
--Consulta 1(La descripción de los productos donde la descripción del pedidio sea 'Pedido de focos para evento'.)
SELECT descripción
FROM productos
WHERE id_producto = ALL 
(SELECT id_producto
FROM linea_de_pedido 
WHERE descripción = 'Pedido de focos para evento');
--Consulta 2(Mostar dirección y dni de los clientes donde en el cliente_dni de la tabla TARJETA está el dni '99999999F')
SELECT dirección, dni
FROM cliente
WHERE nº_cliente = ANY
(SELECT nº_cliente
FROM tarjeta
WHERE cliente_dni = '99999999F'
);
  
