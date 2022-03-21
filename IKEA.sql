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
INSERT INTO Pedidos VALUES (1,'02/02/2022',1,'76665434D');
INSERT INTO Pedidos VALUES (2,'30/05/2022',2,'76665434D');
INSERT INTO Pedidos VALUES (3,'16/04/2022',3,'77889767D');
--
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
