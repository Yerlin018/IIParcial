/*
Crear base de datos de clientes (CODIGO, NOMBRE, TELEFONO, FECHANACIMIENTO, ESTADO) 

*/


CREATE DATABASE UHCANDIDATOS
GO

/*
CrearTABLA CON ( CEDULA , NOMBRE,  TELEFONO, EDAD, PARTIDO POLITICO, ESTADO) 

*/


CREATE TABLE CANDIDATOS
(

Cedula int identity(1,1)  primary key, -- identity se va a incrementar le asigna un numero distinto a cada uno, yo no lo tengo que digitar 
Nombre varchar(50),
Apellido varchar(50),
Telefono varchar(8) UNIQUE NOT NULL,
Edad numeric,
Partido varchar(50),
Estado varchar(50) 
)

-- INSERT -INGRESAR

INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('JOSE','CALVO', '123', 19 , 'Libertad','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('MARIA','PEREZ', '993', 19 , 'Renovaciòn','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('PEDRO','CHAVES', '133', 19 , 'Movimiento','Soltero')
INSERT INTO CANDIDATOS(Nombre, Apellido, Telefono, Edad, Partido, Estado) VALUES ('JUAN','CAMACHO', '930', 29 , 'MMLL','Casado')
-- SELECT -CONSULTA
select*from CANDIDATOS

DROP TABLE CANDIDATOS
GO

CREATE TABLE ALMACENAMIENTODATOS
(

Cedula_Vot  varchar(50) primary key, -- identity se va a incrementar le asigna un numero distinto a cada uno, yo no lo tengo que digitar 
Nombre_Vot varchar(50),
Apellido_Vot varchar(50),
Edad_Vot numeric,
Nombre_elegido varchar(50), 
)

INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('932','LUCIA','CHACON', 21 , 'PEDRO')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('234','JUAN','CASTILLO', 40 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('345','DIANA','CASTILLO', 89 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('267','MARIO','CASTILLO', 19 , 'MARIA')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('217','LIZ','ALVAREZ', 23 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('197','EMA','QUESADA', 18 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('901','MARY','VARELA', 22 , 'JOSE')
INSERT INTO ALMACENAMIENTODATOS(Cedula_Vot, Nombre_Vot, Apellido_Vot, Edad_Vot, Nombre_elegido) VALUES ('317','YERLIN','CAMACHO', 29 , 'JUAN')

DROP TABLE ALMACENAMIENTODATOS
GO

select*from ALMACENAMIENTODATOS

SELECT COUNT (*) FROM ALMACENAMIENTODATOS -- CUENTA CUANTOS CLIENTES HAY EN LA TABLA CLIENTES





/*
Crear la tabla resultados
Donde se realiza el conteo de los datos

*/
CREATE TABLE RESULTADOS
(
    Cedula int PRIMARY KEY,  -- Relaciona con la cédula del candidato
    Nombre varchar(50),
    Apellido varchar(50),
    Votos int DEFAULT 0,      -- Inicialmente cero votos
    Porcentaje decimal(5, 2)  -- Almacenará el porcentaje de votos
)

CREATE TRIGGER TR_CandidatoInsertado
ON CANDIDATOS
AFTER INSERT
AS
BEGIN
    INSERT INTO RESULTADOS (Cedula, Nombre, Apellido, Votos, Porcentaje)
    SELECT Cedula, Nombre, Apellido, 0, 0
    FROM inserted;
END


/*
Agregar un nuevo candidato
Cada vez que se ingresa un nuevo caandidato a 
la tabla cANDIDATO este actualiza en RESULTADOS

*/
CREATE TRIGGER TR_VotoInsertado
ON ALMACENAMIENTODATOS
AFTER INSERT
AS
BEGIN
    DECLARE @totalVotos INT;

    -- Actualizar el conteo de votos del candidato
    UPDATE RESULTADOS
    SET Votos = Votos + 1
    WHERE Nombre = (SELECT Nombre_elegido FROM inserted);

    -- Calcular el total de votos registrados
    SELECT @totalVotos = COUNT(*) FROM ALMACENAMIENTODATOS;

    -- Actualizar el porcentaje para cada candidato
    UPDATE RESULTADOS
    SET Porcentaje = (Votos * 100.0) / @totalVotos;
END


SELECT * FROM RESULTADOS;


DROP TRIGGER TR_CandidatoInsertado
DROP TRIGGER TR_VotoInsertado
DROP TABLE RESULTADOS
DROP TABLE  CANDIDATOS
DROP TABLE ALMACENAMIENTODATOS
SELECT * FROM RESULTADOS;









-- Insertar los resultados en la tabla recuento_nombres
INSERT INTO RESULTADOS (Nombre_elegido, cantidad_Vot)
SELECT 'JOSE', COUNT(*)
FROM ALMACENAMIENTODATOS
WHERE Nombre_elegido = 'JOSE';

INSERT INTO RESULTADOS (Nombre_elegido, cantidad_Vot)
SELECT 'MARIA', COUNT(*)
FROM ALMACENAMIENTODATOS
WHERE Nombre_elegido = 'MARIA';

INSERT INTO RESULTADOS (Nombre_elegido, cantidad_Vot)
SELECT 'PEDRO', COUNT(*)
FROM ALMACENAMIENTODATOS
WHERE Nombre_elegido = 'PEDRO';

select*from  ALMACENAMIENTODATOS
select*from RESULTADOS

ALTER TABLE RESULTADOS
ADD porcentaje DECIMAL(5, 2);  -- Usamos DECIMAL(5, 2) para permitir dos decimales en el porcentaje.


-- Calcular el total de registros en la tabla clientes
DECLARE @total INT;
SELECT @total = COUNT(*) FROM ALMACENAMIENTODATOS;

-- Actualizar la columna porcentaje en recuento_nombres
UPDATE RESULTADOS
SET porcentaje = (cantidad_Vot * 100.0) / @total;





