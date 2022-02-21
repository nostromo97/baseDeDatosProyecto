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
     Sueldo          NUMBER (5,2)  NOT NULL , 
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
     Control                 VARCHAR2 (20)  NOT NULL , 
     id_trabajador           VARCHAR2 (8)  NOT NULL 
    ) 
;

-----------------------------------------------------------
CREATE TABLE Productos 
    ( 
    id_producto NUMBER (8) PRIMARY KEY,
     Tipo               VARCHAR2 (12)  NOT NULL , 
     Precio             NUMBER (5,2)  NOT NULL , 
     Descripción        VARCHAR2 (20)  NOT NULL , 
     Cantidad           NUMBER (9)  NOT NULL , 
     id_Departamento    NUMBEr(8)  NOT NULL , 
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
     id_departamento NUMBER(8)PRIMARY KEY , 
     Lamparas      VARCHAR2 (20) , 
     Smart         VARCHAR2 (20) 
    ) 
;
CREATE TABLE Jardineria 
    ( 
     id_departamento NUMBER(8)PRIMARY KEY , 
     Macetas       VARCHAR2 (20) , 
     Plantas       VARCHAR2 (20) 
    ) 
;

CREATE TABLE Muebles 
    ( 
     id_departamento NUMBER(8)PRIMARY KEY  , 
     Tipo          VARCHAR2 (20) , 
     Material      VARCHAR2 (20) 
    ) 
;
CREATE TABLE Bricolaje 
    ( 
     id_departamento NUMBER(8)PRIMARY KEY , 
     Interior      VARCHAR2 (20) , 
     Herramientas  VARCHAR2 (20) 
    ) 
;
----------------------------------------------
CREATE TABLE Venden 
    ( 
        ID_Tienda NUMBER (8)PRIMARY KEY , 
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
     Nombre    VARCHAR2 (9)  NOT NULL , 
     Apellidos VARCHAR2 (9)  NOT NULL , 
     Dirección VARCHAR2 (9)  NOT NULL ,
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
ALTER TABLE Productos ADD CONSTRAINT productos_linea_FK FOREIGN KEY (Linea_de_pedido_ID) REFERENCES Linea_de_pedido(id_pedido)ON DELETE CASCADE;
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT departamento_producto_fk FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)ON DELETE CASCADE;
ALTER TABLE Iluminacion ADD CONSTRAINT iluminacion_departamento_fk FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)ON DELETE CASCADE;
ALTER TABLE Jardineria ADD CONSTRAINT jardineria_departamento_fk FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)ON DELETE CASCADE;
ALTER TABLE Muebles ADD CONSTRAINT Muebles_departamento_fk FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)ON DELETE CASCADE;
ALTER TABLE Bricolaje ADD CONSTRAINT Bricolaje_departamento_fk FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)ON DELETE CASCADE;
ALTER TABLE VENDEN ADD CONSTRAINT venden_tienda_fk FOREIGN KEY (ID_Tienda) REFERENCES Tienda(ID_Tienda) ON DELETE CASCADE;
ALTER TABLE VENDEN ADD CONSTRAINT venden_productos_fk FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)ON DELETE CASCADE;

ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_linea_fk FOREIGN KEY (Linea_de_pedido_ID ) REFERENCES Linea_de_pedido(id_pedido)ON DELETE CASCADE;
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_cliente_FK FOREIGN KEY ( nº_de_cliente) REFERENCES Cliente( Nº_cliente)ON DELETE CASCADE;
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_DNIcliente_FK FOREIGN KEY (Cliente_DNI) REFERENCES Cliente( DNI)ON DELETE CASCADE;