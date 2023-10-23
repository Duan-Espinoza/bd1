-- Crear la base de datos para la tienda de libros en línea con un nombre más descriptivo
CREATE DATABASE IF NOT EXISTS LibreriaOnline;
USE LibreriaOnline;

-- Definición de la tabla de Libros con un nombre más descriptivo
CREATE TABLE IF NOT EXISTS Libros (
    IDLibro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    Genero VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    INDEX idx_Titulo (Titulo)
);

-- Definición de la tabla de Clientes con un nombre más descriptivo
CREATE TABLE IF NOT EXISTS Clientes (
    IDCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(255) NOT NULL,
    INDEX idx_CorreoElectronico (CorreoElectronico)
);

-- Definición de la tabla de Pedidos con un nombre más descriptivo
CREATE TABLE IF NOT EXISTS Pedidos (
    IDPedido INT PRIMARY KEY AUTO_INCREMENT,
    IDCliente INT NOT NULL,
    IDLibro INT NOT NULL,
    FechaPedido DATE NOT NULL,
    INDEX idx_Cliente (IDCliente),
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
    FOREIGN KEY (IDLibro) REFERENCES Libros(IDLibro)
);

-- Procedimiento Almacenado para Agregar Libros con un nombre más descriptivo
DELIMITER //
CREATE PROCEDURE AgregarLibro(
    IN p_Titulo VARCHAR(100),
    IN p_Autor VARCHAR(100),
    IN p_Genero VARCHAR(100),
    IN p_Precio DECIMAL(10, 2),
    IN p_Stock INT
)
BEGIN
    INSERT INTO Libros (Titulo, Autor, Genero, Precio, Stock) VALUES (p_Titulo, p_Autor, p_Genero, p_Precio, p_Stock);
END;
//
DELIMITER ;

-- Procedimiento Almacenado para Realizar Pedidos con un nombre más descriptivo
DELIMITER //
CREATE PROCEDURE RealizarPedido(
    IN p_IDCliente INT,
    IN p_IDLibro INT
)
BEGIN
    DECLARE v_Stock INT;
    SELECT Stock INTO v_Stock FROM Libros WHERE IDLibro = p_IDLibro;
    
    IF v_Stock > 0 THEN
        INSERT INTO Pedidos (IDCliente, IDLibro, FechaPedido) VALUES (p_IDCliente, p_IDLibro, CURDATE());
        UPDATE Libros SET Stock = Stock - 1 WHERE IDLibro = p_IDLibro;
    END IF;
END;
//
DELIMITER ;

-- Función para Calcular el Total del Pedido con un nombre más descriptivo
DELIMITER //
CREATE FUNCTION CalcularTotalPedido(p_IDPedido INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE Total DECIMAL(10, 2);
    SELECT SUM(Precio) INTO Total
    FROM Libros
    WHERE IDLibro IN (SELECT IDLibro FROM Pedidos WHERE IDPedido = p_IDPedido);
    RETURN Total;
END;
//
DELIMITER ;

-- Disparador para Actualizar el Stock de Libros después de un Pedido con un nombre más descriptivo
DELIMITER //
CREATE TRIGGER ActualizarStockDespuesDePedido
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Libros
    SET Stock = Stock - 1
    WHERE IDLibro = NEW.IDLibro;
END;
//
DELIMITER ;
