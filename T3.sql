CREATE TABLE Tienda 
    ( 
     ID_Tienda         NUMBER (9)PRIMARY KEY , 
     Ciudad     VARCHAR2 (20)  NOT NULL , 
     Direccion  VARCHAR2 (20)  NOT NULL , 
     Superficie NUMBER (5)  NOT NULL , 
     Horario    VARCHAR2 (20)  NOT NULL 
    ) 
;



--------------------------------------------------------------
CREATE TABLE Trabajadores 
    ( 
     Trabajadores_ID NUMBER(8)PRIMARY KEY, 
     Nombre          VARCHAR2 (20)  NOT NULL , 
     Apellidos       VARCHAR2 (20)  NOT NULL , 
     DNI             VARCHAR2 (9)  NOT NULL , 
     Nº_telefono     NUMBER (9)  NOT NULL , 
     Sueldo          NUMBER (5)  NOT NULL , 
     Direccion       VARCHAR2 (20)  NOT NULL , 
     Tipo            VARCHAR2 (18)  NOT NULL , 
     Tienda_ID       NUMBER (9)  NOT NULL 
    ) 
;

CREATE TABLE Recepcionista 
    ( 
     id NUMBER(8)PRIMARY KEY,
     telefono NUMBER (9)  NOT NULL 
    ) 
;

CREATE TABLE Carpinteros 
    ( 
     id NUMBER(8)PRIMARY KEY, 
     Nºde_cortes                  NUMBER (8)  NOT NULL , 
     id_maquina                   NUMBER (8)  NOT NULL 
    ) 
;

CREATE TABLE Directivos
    ( 
    id NUMBER(8)PRIMARY KEY, 
     Informe                       VARCHAR2 (40) 
    ) 
;

CREATE TABLE Director_marketing 
    ( 
     id NUMBER(8)PRIMARY KEY, 
     Control                 VARCHAR2 (20)  NOT NULL  
     
    ) 
;

-----------------------------------------------------------
CREATE TABLE Productos 
    ( 
     id_producto NUMBER (8) PRIMARY KEY,
     Tipo               VARCHAR2 (12)  NOT NULL , 
     Precio             NUMBER (4)  NOT NULL , 
     Descripción        VARCHAR2 (40)  NOT NULL , 
     Cantidad           NUMBER (9)  NOT NULL , 
     id_Departamento    NUMBER(8)  NOT NULL , 
     Linea_de_pedido_ID NUMBER (8)  NOT NULL 
    ) 
;

---------------------------------------------
CREATE TABLE Departamento 
    ( 
    id_departamento NUMBER(8)PRIMARY KEY,
     id_producto NUMBER (8)NOT NULL
     
    ) 
;


---------------------------------------------
CREATE TABLE Iluminacion 
    ( 
     id_lampara NUMBER(8)PRIMARY KEY,
     id_departamento NUMBER(8)NOT NULL , 
     Lamparas      VARCHAR2 (20) , 
     Smart         VARCHAR2 (20) 
    ) 
;
CREATE TABLE Jardineria 
    ( 
     id_jardineria NUMBER(8)PRIMARY KEY,
     id_departamento NUMBER(8)NOT NULL , 
     Macetas       VARCHAR2 (20) , 
     Plantas       VARCHAR2 (20) 
    ) 
;

CREATE TABLE Muebles 
    ( 
     id_mueble NUMBER(8)PRIMARY KEY,
     id_departamento NUMBER(8)NOT NULL , 
     Tipo          VARCHAR2 (20) , 
     Material      VARCHAR2 (20) 
    ) 
;
CREATE TABLE Bricolaje 
    ( 
     id_bricolaje NUMBER(8)PRIMARY KEY ,
     id_departamento NUMBER(8)NOT NULL, 
     Interior      VARCHAR2 (20) , 
     Herramientas  VARCHAR2 (20) 
    ) 
;
----------------------------------------------
CREATE TABLE Venden 
    ( 
        id_venta NUMBER (8)PRIMARY KEY,
        ID_Tienda NUMBER (8)NOT NULL , 
        id_producto NUMBER (8) NOT NULL
    ) 
;


CREATE TABLE Linea_de_pedido 
    ( 
     id_pedido NUMBER(8)PRIMARY KEY,
     id_producto NUMBER (8)  NOT NULL,
     descripción VARCHAR2(80)
    ) 
;
CREATE TABLE Pedidos 
    ( 
     id_pedido NUMBER(8) PRIMARY KEY,
     Entrega             DATE  NOT NULL , 
     Linea_de_pedido_ID  NUMBER (9)  NOT NULL , 
     Cliente_DNI         VARCHAR2 (9)  NOT NULL 
    
    ) 
;
CREATE TABLE Cliente 
    ( 
     DNI       VARCHAR2 (9)  PRIMARY KEY , 
     Nombre    VARCHAR2 (20)  NOT NULL , 
     Apellidos VARCHAR2 (20)  NOT NULL , 
     Dirección VARCHAR2 (30)  NOT NULL ,
     Nº_cliente NUMBER(8)UNIQUE NOT NULL
    ) 
;


CREATE TABLE Tarjeta 
    ( 
     nº_de_cliente NUMBER (8) PRIMARY KEY , 
     Cliente_DNI   VARCHAR2 (9)  NOT NULL 
    ) 
;
ALTER TABLE Trabajadores ADD CONSTRAINT trabajadores_tienda FOREIGN KEY (Tienda_ID)REFERENCES Tienda(ID_Tienda)ON DELETE CASCADE;
ALTER TABLE Recepcionista ADD CONSTRAINT Recepcionista_Trabajador_fk FOREIGN KEY (id) REFERENCES Trabajadores(Trabajadores_ID)ON DELETE CASCADE;
ALTER TABLE Carpinteros ADD CONSTRAINT Carpinteros_Trabajador_fk FOREIGN KEY (id) REFERENCES Trabajadores(Trabajadores_ID)ON DELETE CASCADE;
ALTER TABLE Directivos ADD CONSTRAINT Directivos_Trabajador_fk FOREIGN KEY (id) REFERENCES Trabajadores(Trabajadores_ID)ON DELETE CASCADE;
ALTER TABLE Director_marketing ADD CONSTRAINT Dir_mark_Trabajador_fk FOREIGN KEY (id) REFERENCES Trabajadores(Trabajadores_ID)ON DELETE CASCADE;
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT departamento_producto_fk FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)ON DELETE CASCADE;
ALTER TABLE VENDEN ADD CONSTRAINT venden_tienda_fk FOREIGN KEY (ID_Tienda) REFERENCES Tienda(ID_Tienda) ON DELETE CASCADE;
ALTER TABLE VENDEN ADD CONSTRAINT venden_productos_fk FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)ON DELETE CASCADE;
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_linea_fk FOREIGN KEY (Linea_de_pedido_ID ) REFERENCES Linea_de_pedido(id_pedido)ON DELETE CASCADE;
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_cliente_FK FOREIGN KEY ( nº_de_cliente) REFERENCES Cliente( Nº_cliente)ON DELETE CASCADE;
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_DNIcliente_FK FOREIGN KEY (Cliente_DNI) REFERENCES Cliente( DNI)ON DELETE CASCADE;
--RESTRICCIONES

ALTER TABLE Tienda ADD CONSTRAINT CIUDAD_POSIBLE CHECK (Ciudad IN ('Malaga','Sevilla','Madrid','Barcelona'));
ALTER TABLE productos ADD CONSTRAINT Precio_Posible CHECK(Precio>0);
ALTER TABLE Muebles ADD CONSTRAINT material_POSIBLE CHECK (material IN ('Madera','Contrachapado','Aluminio','Reciclado'));
ALTER TABLE REcepcionista ADD CONSTRAINT Telefono_posible CHECK(LENGTH(telefono)=9);
ALTER TABLE Trabajadores ADD CONSTRAINT Sueldo_Posible CHECK(sueldo>400);
ALTER TABLE JArdineria ADD CONSTRAINT macetas_POSIBLE CHECK (macetas IN ('Pequeña','Mediana','Grande'));
ALTER TABLE Iluminacion ADD CONSTRAINT Lamparas_POSIBLE CHECK (Lamparas IN ('Led','Bajo consumo','Alto consumo'));
ALTER TABLE Bricolaje ADD CONSTRAINT herramientas_POSIBLE CHECK (Herramientas IN ('Taladro','Martillo','Destornillador','Sierra'));
ALTER TABLE Trabajadores ADD CONSTRAINT tipo_valido CHECK( tipo IN('Carpintero','Director_marketing','Recepcionista','Directivo'));
ALTER TABLE Productos ADD CONSTRAINT producto_valido CHECK( tipo IN('Iluminación','Jardinería','Mueble','Bricolaje'));

--INSERTAR registro TIENDA
INSERT INTO Tienda VALUES(1,'Malaga','Calle 13',200,'Mañana');
INSERT INTO Tienda VALUES(2,'Sevilla','Calle 19 nº6',700,'Tarde');
INSERT INTO Tienda VALUES(3,'Barcelona','Calle 25 nº2',1000,'Mañana');
INSERT INTO Tienda VALUES(4,'Madrid','Calle 20 nº14',950,'Tarde');
--TRABAJADORES
INSERT INTO Trabajadores VALUES(11,'Antonio','Rodriguez','1234578T',12356789,1200,'Calle Bolivia','Carpintero',1);
INSERT INTO Trabajadores VALUES(33,'Emilio','Perez','44444444F',99999999,975,'Calle Brasil','Directivo',1);
INSERT INTO Trabajadores VALUES(77,'Mario','Gonzalez','12332112W',12346365,1235,'Pura calle','Director_marketing',1);
INSERT INTO Trabajadores VALUES(13,'Álvaro','Fernández','13288867D',12135123,1000,'Calle 2323','Recepcionista',1);
INSERT INTO Trabajadores VALUES(19,'Adrián','Rojas','33243527A',12135123,1000,'Calle 1543','Recepcionista',1);
INSERT INTO Trabajadores VALUES(12,'Agustín','Arcos','65789934X',12345111,1200,'Calle Stephen','Carpintero',1);
INSERT INTO Trabajadores VALUES(17,'Antonio','Resines','65789999F',12377711,2200,'Calle 4765','Director_marketing',1);
INSERT INTO Trabajadores VALUES(22,'Juan','Ortega','33452169G',66666666,1150,'Calle Andorra','Recepcionista',2);
INSERT INTO Trabajadores VALUES(66,'Salva','Navarro','45663698K',98787987,1750,'Calle Duki','Carpintero',2);
INSERT INTO Trabajadores VALUES(14,'Fox','Mulder','65789324G',12388811,2200,'Calle 8989','Director_marketing',2);
INSERT INTO Trabajadores VALUES(15,'Benito','Camela','8675645R',12756411,2200,'Calle 1111','Directivo',2);
INSERT INTO Trabajadores VALUES(44,'Andres','Cabeza','5555555Q',11234315,1000,'Calle Gongora','Director_marketing',3);
INSERT INTO Trabajadores VALUES(55,'Francisco','Marquez','67898765E',99999999,2000,'Calle Quevedo','Directivo',3);
INSERT INTO Trabajadores VALUES(88,'Gonzalo','Corrales','12333339J',12020123,1200,'Hospitalet','Recepcionista',3);
INSERT INTO Trabajadores VALUES(99,'Agustín','Arcos','11323439Z',12025523,1000,'Calle 123','Carpintero',3);
INSERT INTO Trabajadores VALUES(68,'Roberto','Ríos','13223567S',12027513,2000,'Calle 333','Directivo',4);

--CLIENTE 
INSERT INTO CLIENTE VALUES('12345678B','Carlos','Boni','calle Argentina nº 10',10);
INSERT INTO CLIENTE VALUES('45678954S','Juan','Alvarez','calle Venezuela nº 1',9);
INSERT INTO CLIENTE VALUES('99999999F','Harry','Osborn','calle greenday nº 13',2);
--TARJETA 
INSERT INTO TARJETA VALUES(10,'12345678B');
INSERT INTO TARJETA VALUES(9,'45678954S');
INSERT INTO TARJETA VALUES(2,'99999999F');

--PRODUCTOS 
INSERT INTO Productos VALUES(1,'Iluminación',235,'Foco para eventos audiovisuales',700,1,1);
INSERT INTO Productos VALUES(2,'Jardinería',50,'Tijeras podadoras',250,2,2);
INSERT INTO Productos VALUES(3,'Mueble',99,'Escritorio 12 piezas',300,3,3);
INSERT INTO Productos VALUES(4,'Bricolaje',60,'Sierra de cinta',400,4,4);
--DEPARTAMENTO
INSERT INTO Departamento VALUES (1,1);
INSERT INTO Departamento VALUES (2,2);
INSERT INTO Departamento VALUES (3,3);
INSERT INTO Departamento VALUES (4,4);
--RECEPCIONISTA
INSERT INTO Recepcionista VALUES (13,122421231);
INSERT INTO Recepcionista VALUES (19,121351231);
INSERT INTO Recepcionista VALUES (22,666666666);
INSERT INTO Recepcionista VALUES (88,120201231);
--CARPINTERO
INSERT INTO Carpinteros VALUES(11,5900,1);
INSERT INTO Carpinteros VALUES(12,5000,2);
INSERT INTO Carpinteros VALUES(66,3700,3);
INSERT INTO Carpinteros VALUES(99,4780,4);
--DIRECTIVO
INSERT INTO Directivos VALUES (33,'INFORME 1');
INSERT INTO Directivos VALUES(15, 'INFORME 1');
INSERT INTO Directivos VALUES(55, 'INFORME 1');
INSERT INTO Directivos VALUES (68, 'INFORME 1');
--DIRECTOR_MARKETING
INSERT INTO Director_marketing VALUES (77, 'control1');
INSERT INTO Director_marketing VALUES (17, 'control1');
INSERT INTO Director_marketing VALUES (14, 'control1');
INSERT INTO Director_marketing VALUES (44, 'control1');


--ILUMINACION
INSERT INTO Iluminacion VALUES(11,1, 'Led','SMART');

--JARDINERIA
INSERT  INTO Jardineria VALUES(22,2, 'Grande','PLANTAS');

--MUEBLES
INSERT INTO Muebles VALUES (33,3, 'TIPO','Madera');

--BRICOLAJE
INSERT INTO Bricolaje VALUES (44,4 , 'INERIOR','Martillo');
--VENDEN
INSERT INTO Venden VALUES(11,1,1);
INSERT INTO Venden VALUES(22,2,2);
INSERT INTO Venden VALUES(33,3,3);
--LINEA DE PEDIDO
INSERT INTO Linea_de_pedido VALUES(1,1,'Pedido de focos para evento');
INSERT INTO Linea_de_pedido VALUES (2,2,'Pedido de tijeras podadoras');
INSERT INTO Linea_de_pedido VALUES (3,3,'Pedido de escritorios de 12 piezas');
--PEDIDOS
INSERT INTO Pedidos VALUES (1,'02/02/2022',1,'12345678B');
INSERT INTO Pedidos VALUES (2,'30/05/2022',2,'45678954S');
INSERT INTO Pedidos VALUES (3,'16/04/2022',3,'99999999F');
--COSULTAS
--SELECT1
SELECT Nombre "Nombre de los Trabajores", Tipo "Tipo de trabajador" 
FROM Trabajadores;

SELECT ID_Tienda "ID de la tienda", Superficie "Tamaño de la tienda"
FROM Tienda;

SELECT Nombre "Nombre del cliente", Dirección "Dirección del ciente"
FROM Cliente;

--SELECT2
SELECT Tipo ||' '|| Descripción FROM Productos;
SELECT id_pedido ||' '|| Entrega FROM Pedidos;
SELECT Tipo ||' '|| Material FROM Muebles;

--SELECT3
SELECT 'EL NÚMERO DE TELÉFONO DE ' ||Nombre|| ' es ' ||Nº_telefono "NUMERO DE TELEFONO"
    FROM Trabajadores;
SELECT 'EL DNI DEL CLIENTE ' ||Nº_cliente|| ' es ' ||DNI
    FROM Cliente;
SELECT 'EL TIPO DE PRODUCTO CON ID ' ||id_producto|| ' es ' ||Tipo
    FROM Productos;
    
--SELECT4
SELECT DISTINCT Nombre FROM Trabajadores;

--SELECT5
SELECT Sueldo * 1.2 FROM Trabajadores;
--PARA INCREMENTAR UN 20% EL SALARIO DE LOS TRABAJADORES
SELECT Sueldo - 200 FROM Trabajadores;
--LE RESTA 200 EUROS A LOS TRABAJADORES PORQUE EL DIRECTOR ESTÁ PSICÓPATA
SELECT Sueldo + 200 FROM Trabajadores;
--LE SUBE 200 EUROS A LOS TRABAJADORES PORQUE HAN CAMBIADO DE DIRECTOR Y ES UN MÁQUINA

--SELECT6
SELECT MAX(Nombre) FROM Trabajadores;
SELECT MAX(Tipo) FROM Trabajadores;

--SELECT7
SELECT AVG(Sueldo) FROM Trabajadores;
SELECT AVG(Superficie) FROM Tienda;

--SELECT8
SELECT 'El primer nombre es: '||MIN(Nombre) "Primer nombre"FROM Cliente;
SELECT 'El sueldo mas bajo es: '||MIN(Sueldo)"Sueldo mas bajo"FROM trabajadores;

--SELECT9

SELECT 'La suma de los sueldos de lso trabajadores es: '||SUM(Sueldo)"Todos los sueldos" FROM trabajadores;
SELECT 'La suma de la superficie de las tiendas es: '||SUM(superficie)"Suma de superficies" FROM Tienda;

--TERCER TRIMESTRE

--Parte 1
--1
SELECT t.Nombre, t.apellidos, ti.ciudad
    FROM trabajadores t,tienda ti
    WHERE t.tienda_id = ti.id_tienda;
    
SELECT t.Nombre, t.apellidos,t.tipo,ti.Horario
    FROM trabajadores t,tienda ti
    WHERE t.tienda_id=ti.id_tienda;
    
SELECT p.cantidad, p.precio,d.id_departamento
    FROM productos p,departamento d
    WHERE p.id_producto=d.id_producto;
    
SELECT lp.Descripción,p.Entrega
    FROM Linea_DE_PEDIDO lp,pedidos p
    WHERE lp.id_pedido=p.id_pedido;
    
SELECT c.Nombre, c.Apellidos, pe.Entrega
    FROM cliente c, pedidos pe
    WHERE c.dni=pe.CLIENTE_DNI;

--2

SELECT d.id_departamento,b.herramientas,p.precio
    FROM departamento d, bricolaje b, productos p
    WHERE d.id_departamento = b.id_departamento AND d.id_producto = p.id_producto;
    
SELECT  c.nombre, p.id_pedido, li.descripción 
    FROM cliente c, pedidos p, linea_de_pedido li
    WHERE c.dni = p.cliente_dni AND li.id_pedido = p.id_pedido;

--3

SELECT trabajadores.Nombre, trabajadores.apellidos, tienda.ciudad
    FROM trabajadores
    JOIN tienda ON (trabajadores.tienda_id = tienda.id_tienda);
    
SELECT trabajadores.Nombre, trabajadores.apellidos, trabajadores.tipo, tienda.horario
    FROM trabajadores
    JOIN tienda ON (trabajadores.tienda_id = tienda.id_tienda);
    
SELECT productos.cantidad,productos.precio,departamento.id_departamento
    FROM productos
    JOIN departamento ON (productos.id_producto = departamento.id_producto);
    
SELECT linea_de_pedido.descripción, pedidos.entrega
    FROM linea_de_pedido
    JOIN pedidos ON(linea_de_pedido.id_pedido = pedidos.id_pedido);
    
SELECT cliente.nombre, cliente.apellidos, pedidos.entrega
    FROM cliente
    JOIN pedidos ON(cliente.dni=pedidos.CLIENTE_DNI);

SELECT d.id_departamento,b.herramientas,p.precio
    FROM departamento d JOIN bricolaje b
    ON d.id_departamento = b.id_departamento
    JOIN productos p
    ON d.id_producto = p.id_producto;
    
SELECT c.nombre, p.id_pedido, li.descripción 
    FROM cliente c JOIN pedidos p
    ON c.dni = p.cliente_dni
    JOIN linea_de_pedido li
    ON li.id_pedido = p.id_pedido;

--4

SELECT cliente.nombre, cliente.apellidos, pedidos.entrega
    FROM cliente cliente
    LEFT JOIN pedidos pedidos ON(cliente.dni=pedidos.CLIENTE_DNI);
    
SELECT trabajadores.Nombre, trabajadores.apellidos, tienda.ciudad
    FROM trabajadores trabajadores
    RIGHT JOIN tienda tienda ON (trabajadores.tienda_id = tienda.id_tienda);
    
SELECT li.descripción, pe.entrega
    FROM linea_de_pedido li
    FULL JOIN pedidos pe ON(li.id_pedido = pe.id_pedido);
    
--Parte2
--1
SELECT Nombre, MAX(sueldo)
    FROM trabajadores
    WHERE sueldo>1000
    GROUP BY Nombre;    
--2

SELECT trabajadores_id,nombre, MAX(sueldo)
    FROM trabajadores
    GROUP BY trabajadores_id,nombre
     HAVING MAX(sueldo) > 1000;
--3
    SELECT DNI,nombre,apellidos,MAX(sueldo)
        FROM trabajadores
        GROUP BY DNI,nombre,apellidos
        ORDER by DNI;
        
--4
    SELECT p.id_pedido,c.DNI
    FROM cliente c JOIN pedidos p
    ON (c.DNI=p.cliente_DNI)
    GROUP BY p.id_pedido,c.dni
    ORDER by p.id_pedido;
    

--Parte3
--1 Subconsultas
SELECT nombre,sueldo
  FROM trabajadores                                                                
  WHERE tipo = 'Carpintero'
    AND tienda_id IN
       (SELECT DISTINCT tienda_id
        FROM trabajadores                                                                 
        WHERE tipo = 'Recepcionista'
          AND sueldo > 2000)
          
SELECT id_tienda,direccion
  FROM tienda                                                              
  WHERE ciudad = 'Madrid'
    AND id_tienda IN
       (SELECT DISTINCT id_tienda
        FROM tienda                                                                 
        WHERE ciudad = 'Malaga'
          AND superficie > 700)
    