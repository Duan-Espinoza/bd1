-- Duan Antonio Espinoza
-- 2019079490
-- Tarea 5
-- Bases de datos 1

-- Crear la base de datos si no existe y seleccionarla
CREATE DATABASE IF NOT EXISTS blockbuster;
USE blockbuster;

-- Crear la tabla Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Cedula VARCHAR(10) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Dirección VARCHAR(200) DEFAULT 'N/A',
    TeléfonoCelular VARCHAR(15) NOT NULL
);

-- Crear la tabla Categoría
CREATE TABLE IF NOT EXISTS Categoría (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoría VARCHAR(30) NOT NULL
);

-- Crear la tabla Película
CREATE TABLE IF NOT EXISTS Película (
    id INT AUTO_INCREMENT PRIMARY KEY,
    CódigoPelícula VARCHAR(10) NOT NULL UNIQUE,
    Título VARCHAR(100) NOT NULL,
    FechaLanzamiento TIMESTAMP NOT NULL,
    Categoría_id INT NOT NULL,
    CONSTRAINT FK_Categoría_id FOREIGN KEY (Categoría_id) REFERENCES Categoría (id)
);

-- Crear la tabla Préstamo
CREATE TABLE IF NOT EXISTS Préstamo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_id INT NOT NULL,
    Película_id INT NOT NULL UNIQUE,
    FechaPréstamo TIMESTAMP NOT NULL,
    FechaDevolución TIMESTAMP,
    Estado VARCHAR(10) NOT NULL,
    CONSTRAINT FK_Cliente_id FOREIGN KEY (Cliente_id) REFERENCES Cliente (id),
    CONSTRAINT FK_Película_id FOREIGN KEY (Película_id) REFERENCES Película (id)
);




-- Datos



-- Insertar datos de ejemplo en la tabla Cliente
INSERT INTO Cliente (Cedula, Nombre, Apellido, Dirección, TeléfonoCelular)
VALUES
    ('1111111111', 'Ana', 'Rodríguez', '789 Calle Alegre', '555-1111'),
    ('2222222222', 'Carlos', 'López', '456 Calle Feliz', '555-2222'),
    ('3333333333', 'Laura', 'Gómez', '123 Calle Contenta', '555-3333'),
    ('4444444444', 'Pedro', 'Martínez', '234 Calle Satisfecha', '555-4444'),
    ('5555555555', 'Sofía', 'Fernández', '567 Calle Encantada', '555-5555'),
    ('6666666666', 'Luis', 'Hernández', '890 Calle Divertida', '555-6666'),
    ('7777777777', 'Isabel', 'Díaz', '345 Calle Sonriente', '555-7777'),
    ('8888888888', 'Miguel', 'Pérez', '678 Calle Risueña', '555-8888'),
    ('9999999999', 'Elena', 'Sánchez', '987 Calle Feliz', '555-9999'),
    ('1010101010', 'Javier', 'García', '543 Calle Agradable', '555-1010');



-- Insertar datos de ejemplo en la tabla Película
INSERT INTO Película (CódigoPelícula, Título, FechaLanzamiento)
VALUES
    ('P003', 'Star Wars', '1977-05-25'),
    ('P004', 'The Shawshank Redemption', '1994-09-10'),
    ('P005', 'The Godfather', '1972-03-24'),
    ('P006', 'Inception', '2010-07-16'),
    ('P007', 'The Dark Knight', '2008-07-18'),
    ('P008', 'Forrest Gump', '1994-07-06'),
    ('P009', 'Fight Club', '1999-10-15'),
    ('P010', 'The Matrix', '1999-03-31'),
    ('P011', 'Gladiator', '2000-05-05'),
    ('P012', 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19');


-- Insertar datos de ejemplo en la tabla Categoría
INSERT INTO Categoría (NombreCategoría)
VALUES
    ('Ciencia Ficción'),
    ('Drama'),
    ('Aventura'),
    ('Comedia'),
    ('Acción'),
    ('Romance'),
    ('Animación'),
    ('Fantasía'),
    ('Misterio'),
    ('Crimen');


-- Insertar datos de ejemplo en la tabla Préstamo
INSERT INTO Préstamo (FechaPréstamo, FechaDevolución, Estado, CedulaCliente, CódigoPelícula)
VALUES
    ('2023-09-03', '2023-09-06', 'Activo', '1111111111', 'P003'),
    ('2023-09-04', '2023-09-07', 'Activo', '2222222222', 'P004'),
    ('2023-09-05', '2023-09-08', 'Activo', '3333333333', 'P005'),
    ('2023-09-06', '2023-09-09', 'Activo', '4444444444', 'P006'),
    ('2023-09-07', '2023-09-10', 'Activo', '5555555555', 'P007'),
    ('2023-09-08', '2023-09-11', 'Activo', '6666666666', 'P008'),
    ('2023-09-09', '2023-09-12', 'Activo', '7777777777', 'P009'),
    ('2023-09-10', '2023-09-13', 'Activo', '8888888888', 'P010'),
    ('2023-09-11', '2023-09-14', 'Activo', '9999999999', 'P011'),
    ('2023-09-12', '2023-09-15', 'Activo', '1010101010', 'P012');



-- Consultas

-- Mostrar la Cédula, Nombre, Apellido y Teléfono Celular de los clientes que han pedido prestada una película al video, no importa si el préstamo está activo o no.
SELECT 
    c.Cedula, c.Nombre, c.Apellido, c.TeléfonoCelular
FROM 
    Cliente c
JOIN 
    Préstamo p ON c.id = p.Cliente_id;

-- Mostrar la cantidad de préstamos activos por cédula.
SELECT 
    c.Cedula, COUNT(*) AS CantidadPréstamosActivos
FROM 
    Cliente c
JOIN 
    Préstamo p ON c.id = p.Cliente_id
WHERE 
    DATEDIFF(NOW(), p.FechaPréstamo) <= 3
GROUP BY 
    c.Cedula;

-- Mostrar la cantidad de préstamos inactivos existentes por cédula.
SELECT 
    c.Cedula, COUNT(*) AS CantidadPréstamosInactivos
FROM 
    Cliente c
JOIN 
    Préstamo p ON c.id = p.Cliente_id
WHERE 
    DATEDIFF(NOW(), p.FechaPréstamo) > 3
GROUP BY 
    c.Cedula;

-- Mostrar el total de préstamos inactivos existentes.
SELECT 
    COUNT(*) AS TotalPréstamosInactivos
FROM 
    Préstamo p
WHERE 
    DATEDIFF(NOW(), p.FechaPréstamo) > 3;

-- Mostrar a todos aquellos clientes que nunca han realizado un préstamo.
SELECT 
    c.Cedula, c.Nombre, c.Apellido, c.TeléfonoCelular
FROM 
    Cliente c
LEFT JOIN 
    Préstamo p ON c.id = p.Cliente_id
WHERE 
    p.id IS NULL;

-- Actualizar el campo Dirección y poner Guanacaste, del cliente con cédula 10.
UPDATE 
    Cliente
SET 
    Dirección = 'Guanacaste'
WHERE 
    id = 10;

-- Mostrar la cédula, nombre, apellido de los clientes que tienen entre 1 y 3 préstamos activos.
SELECT
    c.Cedula, c.Nombre, c.Apellido
FROM 
    Cliente c
JOIN 
    Préstamo p ON c.id = p.Cliente_id
WHERE 
    DATEDIFF(NOW(), p.FechaPréstamo) <= 3
GROUP BY 
    c.Cedula
HAVING 
    COUNT(*) BETWEEN 1 AND 3;

-- Listar todas las películas de la categoría “Comedia”.
SELECT
    m.Título
FROM 
    Película m
JOIN 
    Categoría c ON m.Categoría_id = c.id
WHERE 
    c.NombreCategoría = 'Comedia';

-- Listar todas las películas prestadas de la categoría “Comedia”.
SELECT
    m.Título
FROM 
    Préstamo p
JOIN 
    Película m ON p.Película_id = m.id
JOIN 
    Categoría c ON m.Categoría_id = c.id
WHERE 
    c.NombreCategoría = 'Comedia';

-- Listar cuántas películas existen por categoría.
SELECT 
    c.NombreCategoría AS Categoria, COUNT(m.id) AS CantidadPeliculas
FROM 
    Categoría c
LEFT JOIN 
    Película m ON c.id = m.Categoría_id
GROUP BY 
    c.NombreCategoría;
