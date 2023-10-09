-- Duan Antonio Espinoza
-- 2019079490
-- Base de datos 1
-- Caso 2 proyecto

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS Caso2;

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Caso2;

-- Usar la base de datos
USE Caso2;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS CuentaCobro;
DROP TABLE IF EXISTS Abono;
DROP TABLE IF EXISTS FormaPago;
DROP TABLE IF EXISTS PersonaFisica;
DROP TABLE IF EXISTS PersonaJuridica;

-- Creación de las tablas

-- Creación de la tabla PersonaFisica
CREATE TABLE PersonaFisica (
    IdPersonaFisica INT PRIMARY KEY AUTO_INCREMENT,
    FechaNacimiento DATE NOT NULL
);

-- Creación de la tabla PersonaJuridica
CREATE TABLE PersonaJuridica (
    IdPersonaJuridica INT PRIMARY KEY AUTO_INCREMENT,
    NombreComercial VARCHAR(50) NOT NULL
);

-- Creación de la tabla Persona
CREATE TABLE Persona (
    Cedula INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('PersonaFisica', 'PersonaJuridica'),
    Nombre VARCHAR(50) NOT NULL,
    IdPersonaJuridica INT,
    IdPersonaFisica INT,
    FOREIGN KEY (IdPersonaJuridica) REFERENCES PersonaJuridica(IdPersonaJuridica),
    FOREIGN KEY (IdPersonaFisica) REFERENCES PersonaFisica(IdPersonaFisica)
);

-- Creación de la tabla CuentaCobro
CREATE TABLE CuentaCobro (
    Numero INT PRIMARY KEY AUTO_INCREMENT,
    Monto FLOAT NOT NULL,
    FechaVencimiento TIMESTAMP NOT NULL,
    CedulaPersona INT NOT NULL,
    FOREIGN KEY (CedulaPersona) REFERENCES Persona(Cedula)
);

-- Creación de la tabla FormaPago
CREATE TABLE FormaPago (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla Abono
CREATE TABLE Abono (
    NumeroCuota INT PRIMARY KEY AUTO_INCREMENT,
    Fecha TIMESTAMP NOT NULL,
    Monto FLOAT NOT NULL,
    NumeroCuentaCobro INT NOT NULL,
    CodigoFormaPago INT NOT NULL,
    FOREIGN KEY (NumeroCuentaCobro) REFERENCES CuentaCobro(Numero),
    FOREIGN KEY (CodigoFormaPago) REFERENCES FormaPago(Codigo)
);

-- Registros
-- *******************************************************
-- *****************************************************
-- Inserción de datos de prueba en la tabla PersonaFisica
INSERT INTO PersonaFisica (Fecha_Nac)
VALUES
    ('1995-08-15'),
    ('1987-04-20'),
    ('1979-12-05'),
    ('1998-03-10'),
    ('1983-06-18'),
    ('1990-09-30'),
    ('1975-02-14'),
    ('1982-11-27'),
    ('1992-07-03'),
    ('1986-01-12');

-- Inserción de datos de prueba en la tabla PersonaJuridica
INSERT INTO PersonaJuridica (Nombre_Comercial)
VALUES
    ('Empresa X'),
    ('Empresa Y'),
    ('Empresa Z'),
    ('Empresa W'),
    ('Empresa V'),
    ('Empresa U'),
    ('Empresa T'),
    ('Empresa S'),
    ('Empresa R'),
    ('Empresa Q');

-- Inserción de datos de prueba en la tabla Persona
INSERT INTO Persona (Tipo, Nombre, id_persona_juridica, id_persona_fisica)
VALUES
    ('Persona Fisica', 'Persona Fisica 1', NULL, 1),
    ('Persona Juridica', 'Persona Juridica 1', 1, NULL),
    ('Persona Fisica', 'Persona Fisica 2', NULL, 2),
    ('Persona Juridica', 'Persona Juridica 2', 2, NULL),
    ('Persona Fisica', 'Persona Fisica 3', NULL, 3),
    ('Persona Juridica', 'Persona Juridica 3', 3, NULL),
    ('Persona Fisica', 'Persona Fisica 4', NULL, 4),
    ('Persona Juridica', 'Persona Juridica 4', 4, NULL),
    ('Persona Fisica', 'Persona Fisica 5', NULL, 5),
    ('Persona Juridica', 'Persona Juridica 5', 5, NULL);

-- Inserción de datos de prueba en la tabla CuentaCobro
INSERT INTO CuentaCobro (Monto, Fecha_Venc, cedula_persona)
VALUES
    (1500.00, '2023-10-15 10:00:00', 1),
    (2500.00, '2023-10-16 11:00:00', 2),
    (1800.00, '2023-10-17 12:00:00', 3),
    (3200.00, '2023-10-18 13:00:00', 4),
    (2800.00, '2023-10-19 14:00:00', 5),
    (2100.00, '2023-10-20 15:00:00', 6),
    (3000.00, '2023-10-21 16:00:00', 7),
    (2800.00, '2023-10-22 17:00:00', 8),
    (3600.00, '2023-10-23 18:00:00', 9),
    (1950.00, '2023-10-24 19:00:00', 10);

-- Inserción de datos de prueba en la tabla FormaPago
INSERT INTO FormaPago (Nombre)
VALUES
    ('Efectivo'),
    ('Tarjeta de crédito'),
    ('Transferencia bancaria'),
    ('Cheque'),
    ('Pago en línea'),
    ('Letra de cambio'),
    ('PayPal'),
    ('Criptomoneda'),
    ('Cheque de viajero'),
    ('Otro');

-- Inserción de datos de prueba en la tabla Abono
INSERT INTO Abono (Fecha, Monto, numero_cuenta_cobro, codigo_forma_pago)
VALUES
    ('2023-10-01 08:00:00', 500.00, 1, 1),
    ('2023-10-02 09:00:00', 800.00, 2, 2),
    ('2023-10-03 10:00:00', 600.00, 3, 3),
    ('2023-10-04 11:00:00', 1000.00, 4, 4),
    ('2023-10-05 12:00:00', 750.00, 5, 5),
    ('2023-10-06 13:00:00', 600.00, 6, 6),
    ('2023-10-07 14:00:00', 850.00, 7, 7),
    ('2023-10-08 15:00:00', 675.00, 8, 8),
    ('2023-10-09 16:00:00', 1100.00, 9, 9),
    ('2023-10-10 17:00:00', 525.00, 10, 10);
    
    
    -- Ideas / Conceptos descartadas
    --
    -- Relación: PersonaFisica (1) - (0 o 1) Persona
	-- Una Persona Física puede estar relacionada con una Persona si su Tipo es 'Persona Fisica'.
	-- NOTA: Esto es una relación opcional, ya que una Persona Física también podría no estar relacionada con ninguna Persona.

	-- Relación: PersonaJuridica (1) - (0 o 1) Persona
	-- Una Persona Jurídica puede estar relacionada con una Persona si su Tipo es 'Persona Juridica'.
	-- NOTA: Esto es una relación opcional, ya que una Persona Jurídica también podría no estar relacionada con ninguna Persona.

	-- Relación: Persona (0 o 1) - (1) PersonaJuridica
	-- Una Persona puede estar relacionada con una Persona Jurídica si su Tipo es 'Persona Juridica'.
	-- NOTA: Esto es una relación opcional, ya que una Persona también podría no estar relacionada con ninguna Persona Jurídica.

	-- Relación: Persona (0 o 1) - (1) PersonaFisica
	-- Una Persona puede estar relacionada con una Persona Física si su Tipo es 'Persona Fisica'.
	-- NOTA: Esto es una relación opcional, ya que una Persona también podría no estar relacionada con ninguna Persona Física.

	-- Relación: CuentaCobro (1) - (1) Persona
	-- Cada Cuenta por Cobrar debe estar relacionada con una Persona que la posea.
	-- NOTA: Esto es una relación obligatoria, ya que todas las Cuentas por Cobrar deben estar asociadas a una Persona.

	-- Relación: Abono (1) - (1) CuentaCobro
	-- Cada Abono debe estar relacionado con una Cuenta por Cobrar.
	-- NOTA: Esto es una relación obligatoria, ya que todos los Abonos deben estar asociados a una Cuenta por Cobrar.

	-- Relación: Abono (1) - (1) FormaPago
	-- Cada Abono debe estar relacionado con una Forma de Pago que se utilizó para realizar el abono.
	-- NOTA: Esto es una relación obligatoria, ya que todos los Abonos deben estar asociados a una Forma de Pago.



    --
-- Entidad: PersonaFisica
-- Descripción: Control de Personas Físicas en la base de datos.
-- Atributos:
--   - IdPersonaFisica (Clave primaria): Identificador único de la Persona Física.
--   - FechaNacimiento: Fecha de nacimiento de la Persona Física.

-- Entidad: PersonaJuridica
-- Descripción: Control de Personas Jurídicas en la base de datos.
-- Atributos:
--   - IdPersonaJuridica (Clave primaria): Identificador único de la Persona Jurídica.
--   - NombreComercial: Nombre comercial de la Persona Jurídica.

-- Entidad: Persona
-- Descripción: Control de Personas en la base de datos.
-- Atributos:
--   - Cedula (Clave primaria): Número de cédula único para cada persona.
--   - Tipo: Tipo de persona, puede ser 'PersonaFisica' o 'PersonaJuridica'.
--   - Nombre: Nombre de la persona.
--   - IdPersonaJuridica: Identificador único de la Persona Jurídica asociada (clave foránea).
--   - IdPersonaFisica: Identificador único de la Persona Física asociada (clave foránea).

-- Entidad: CuentaCobro
-- Descripción: Control de Cuentas de Cobro en la base de datos.
-- Atributos:
--   - Numero (Clave primaria): Número único de la Cuenta de Cobro.
--   - Monto: Monto de la Cuenta de Cobro.
--   - FechaVencimiento: Fecha de vencimiento de la Cuenta de Cobro.
--   - CedulaPersona: Cédula de la persona a la que se emite la Cuenta de Cobro (clave foránea).

-- Entidad: FormaPago
-- Descripción: Control de Formas de Pago en la base de datos.
-- Atributos:
--   - Codigo (Clave primaria): Código único de la Forma de Pago.
--   - Nombre: Nombre de la Forma de Pago.

-- Entidad: Abono
-- Descripción: Control de Abonos en la base de datos.
-- Atributos:
--   - NumeroCuota (Clave primaria): Número único de la Cuota de Abono.
--   - Fecha: Fecha del Abono.
--   - Monto: Monto del Abono.
--   - NumeroCuentaCobro: Número de la Cuenta de Cobro a la que se aplica el Abono (clave foránea).
--   - CodigoFormaPago: Código de la Forma de Pago utilizada para el Abono (clave foránea).

    -- 
    --
    -- Cuota
    -- Banco
    -- Debito/Crédito
    -- Restricciones UNIQUE
    -- eXCEPCIONES
    -- **********************************************************
