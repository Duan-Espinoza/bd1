-- Duan Antonio Espinoza
-- Proyecto BD1
-- 2019079490

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ImportacionesBD;

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS ImportacionesBD;

-- Usar la base de datos
USE ImportacionesBD;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS Companias;
DROP TABLE IF EXISTS DondeComprar;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS OrdenesPedido;
DROP TABLE IF EXISTS DetalleOrdenes;
DROP TABLE IF EXISTS Articulos;
DROP TABLE IF EXISTS Ganancia;
DROP TABLE IF EXISTS SegmentosClientes;


-- Sección de la creación de las tablas
-- Acá se crean todas las tablas requeridas
-- En el script del proyecto caso-1

-- Creación de la tabla Control de Compañías
CREATE TABLE Companias (
    CodigoCompania INT PRIMARY KEY,
    NombreCompania VARCHAR(255),
    Direccion VARCHAR(255),
    NumeroPatronal VARCHAR(20),
    CedulaGerente VARCHAR(20),
    NombreGerente VARCHAR(255),
    CedulaPresidente VARCHAR(20),
    NombrePresidente VARCHAR(255)
);

-- Creación de la tabla Control de Segmentos de Clientes
CREATE TABLE SegmentosClientes (
    CodigoSegmento INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    NombreGerente VARCHAR(255),
    UltimaVisitaDoctor DATE
);

-- Creación de la tabla Control de Proveedores
CREATE TABLE Proveedores (
    CodigoProveedor INT PRIMARY KEY,
    NombreProveedor VARCHAR(255),
    CedulaProveedor VARCHAR(20),
    TipoProveedor VARCHAR(255),
    Telefono VARCHAR(20),
    Direccion VARCHAR(255),
    NombreContacto VARCHAR(255)
);

-- Creación de la tabla Control de Artículos
CREATE TABLE Articulos (
    CodigoArticulo INT PRIMARY KEY,
    DescripcionArticulo VARCHAR(255),
    TipoArticulo VARCHAR(255),
    PrecioUnitario DECIMAL(10, 2),
    PrecioVenta DECIMAL(10, 2),
    Stock INT,
    FechaUltimaCompra DATE,
    FechaUltimoInventario DATE
);

-- Creación de la tabla Control de Órdenes de Pedido a Proveedores
CREATE TABLE OrdenesPedido (
    NumeroOrden INT PRIMARY KEY,
    FechaOrden DATE,
    UsuarioComprador VARCHAR(255),
    UsuarioAprobador VARCHAR(255),
    MontoTotal DECIMAL(10, 2)
);

-- Creación de la tabla Detalle de Órdenes de Pedido a Proveedores
CREATE TABLE DetalleOrdenes (
    NumeroOrden INT,
    NumeroLinea INT,
    CodigoArticulo INT,
    CantidadOrdenada INT,
    PrecioNegociado DECIMAL(10, 2),
    TotalLinea DECIMAL(10, 2),
    PRIMARY KEY (NumeroOrden, NumeroLinea),
    FOREIGN KEY (NumeroOrden) REFERENCES OrdenesPedido(NumeroOrden),
    FOREIGN KEY (CodigoArticulo) REFERENCES Articulos(CodigoArticulo)
);

-- Registros
-- Acá se crean los 10 registros de cada tabla que servirán como datos de prueba


-- Insertar datos de prueba en la tabla Control de Compañías
INSERT INTO Companias (CodigoCompania, NombreCompania, Direccion, NumeroPatronal, CedulaGerente, NombreGerente, CedulaPresidente, NombrePresidente)
VALUES
    (1, 'Compañía A', 'Dirección A', '1234567890', '123456789', 'Gerente A', '987654321', 'Presidente A'),
    (2, 'Compañía B', 'Dirección B', '0987654321', '234567890', 'Gerente B', '876543210', 'Presidente B'),
    (3, 'Compañía C', 'Dirección C', '1357924680', '345678901', 'Gerente C', '765432109', 'Presidente C'),
    (4, 'Compañía D', 'Dirección D', '2468135790', '456789012', 'Gerente D', '654321098', 'Presidente D'),
    (5, 'Compañía E', 'Dirección E', '9876543210', '567890123', 'Gerente E', '543210987', 'Presidente E'),
    (6, 'Compañía F', 'Dirección F', '5678901234', '678901234', 'Gerente F', '432109876', 'Presidente F'),
    (7, 'Compañía G', 'Dirección G', '6789012345', '789012345', 'Gerente G', '321098765', 'Presidente G'),
    (8, 'Compañía H', 'Dirección H', '7890123456', '890123456', 'Gerente H', '210987654', 'Presidente H'),
    (9, 'Compañía I', 'Dirección I', '8901234567', '901234567', 'Gerente I', '109876543', 'Presidente I'),
    (10, 'Compañía J', 'Dirección J', '9012345678', '012345678', 'Gerente J', '098765432', 'Presidente J');


-- Insertar datos de prueba en la tabla Control de Segmentos de Clientes
INSERT INTO SegmentosClientes (CodigoSegmento, Descripcion, NombreGerente, UltimaVisitaDoctor)
VALUES
    (1, 'Segmento 1', 'Gerente Segmento 1', '2023-01-15'),
    (2, 'Segmento 2', 'Gerente Segmento 2', '2023-02-20'),
    (3, 'Segmento 3', 'Gerente Segmento 3', '2023-03-25'),
    (4, 'Segmento 4', 'Gerente Segmento 4', '2023-04-10'),
    (5, 'Segmento 5', 'Gerente Segmento 5', '2023-05-15'),
    (6, 'Segmento 6', 'Gerente Segmento 6', '2023-06-20'),
    (7, 'Segmento 7', 'Gerente Segmento 7', '2023-07-25'),
    (8, 'Segmento 8', 'Gerente Segmento 8', '2023-08-10'),
    (9, 'Segmento 9', 'Gerente Segmento 9', '2023-09-15'),
    (10, 'Segmento 10', 'Gerente Segmento 10', '2023-10-20');


-- Insertar datos de prueba en la tabla Control de Proveedores
INSERT INTO Proveedores (CodigoProveedor, NombreProveedor, CedulaProveedor, TipoProveedor, Telefono, Direccion, NombreContacto)
VALUES
    (1, 'Proveedor 1', '1234567890', 'Granos', '123-456-7890', 'Dirección Proveedor 1', 'Contacto 1'),
    (2, 'Proveedor 2', '0987654321', 'Licores', '987-654-3210', 'Dirección Proveedor 2', 'Contacto 2'),
    (3, 'Proveedor 3', '1357924680', 'Lácteos', '234-567-8901', 'Dirección Proveedor 3', 'Contacto 3'),
    (4, 'Proveedor 4', '2468135790', 'Equipo de Aseo', '345-678-9012', 'Dirección Proveedor 4', 'Contacto 4'),
    (5, 'Proveedor 5', '9876543210', 'Legumbres', '456-789-0123', 'Dirección Proveedor 5', 'Contacto 5'),
    (6, 'Proveedor 6', '5678901234', 'Gaseosas', '567-890-1234', 'Dirección Proveedor 6', 'Contacto 6'),
    (7, 'Proveedor 7', '6789012345', 'Embutidos', '678-901-2345', 'Dirección Proveedor 7', 'Contacto 7'),
    (8, 'Proveedor 8', '7890123456', 'Equipo de Oficina', '789-012-3456', 'Dirección Proveedor 8', 'Contacto 8'),
    (9, 'Proveedor 9', '8901234567', 'Bebidas', '890-123-4567', 'Dirección Proveedor 9', 'Contacto 9'),
    (10, 'Proveedor 10', '9012345678', 'Verduras', '901-234-5678', 'Dirección Proveedor 10', 'Contacto 10');


-- Insertar datos de prueba en la tabla Control de Artículos
INSERT INTO Articulos (CodigoArticulo, DescripcionArticulo, TipoArticulo, PrecioUnitario, PrecioVenta, Stock, FechaUltimaCompra, FechaUltimoInventario)
VALUES
    (1, 'Articulo 1', 'Granos', 5.99, 8.99, 100, '2022-12-10', '2023-02-05'),
    (2, 'Articulo 2', 'Licores', 10.99, 15.99, 50, '2023-01-20', '2023-03-10'),
    (3, 'Articulo 3', 'Lácteos', 3.49, 5.99, 75, '2023-02-15', '2023-04-05'),
    (4, 'Articulo 4', 'Equipo de Aseo', 25.99, 35.99, 30, '2022-12-05', '2023-02-28'),
    (5, 'Articulo 5', 'Legumbres', 4.49, 7.99, 120, '2023-01-10', '2023-03-15'),
    (6, 'Articulo 6', 'Gaseosas', 12.99, 19.99, 40, '2023-03-01', '2023-04-20'),
    (7, 'Articulo 7', 'Embutidos', 2.99, 4.99, 90, '2023-02-25', '2023-05-01'),
    (8, 'Articulo 8', 'Equipo de Oficina', 29.99, 42.99, 25, '2023-01-15', '2023-03-28'),
    (9, 'Articulo 9', 'Bebidas', 6.49, 10.99, 80, '2023-03-05', '2023-04-15'),
    (10, 'Articulo 10', 'Verduras', 14.99, 22.99, 35, '2023-02-10', '2023-05-10');


-- Insertar datos de prueba en la tabla Control de Órdenes de Pedido a Proveedores
INSERT INTO OrdenesPedido (NumeroOrden, FechaOrden, UsuarioComprador, UsuarioAprobador, MontoTotal)
VALUES
    (1, '2023-02-10', 'Comprador 1', 'Aprobador 1', 100.00),
    (2, '2023-03-15', 'Comprador 2', 'Aprobador 2', 150.00),
    (3, '2023-04-20', 'Comprador 3', 'Aprobador 3', 200.00),
    (4, '2023-05-25', 'Comprador 4', 'Aprobador 4', 250.00),
    (5, '2023-06-30', 'Comprador 5', 'Aprobador 5', 300.00),
    (6, '2023-07-05', 'Comprador 6', 'Aprobador 6', 350.00),
    (7, '2023-08-10', 'Comprador 7', 'Aprobador 7', 400.00),
    (8, '2023-09-15', 'Comprador 8', 'Aprobador 8', 450.00),
    (9, '2023-10-20', 'Comprador 9', 'Aprobador 9', 500.00),
    (10, '2023-11-25', 'Comprador 10', 'Aprobador 10', 550.00);


-- Insertar datos de prueba en la tabla Detalle de Órdenes de Pedido a Proveedores
INSERT INTO DetalleOrdenes (NumeroOrden, NumeroLinea, CodigoArticulo, CantidadOrdenada, PrecioNegociado, TotalLinea)
VALUES
    (1, 1, 1, 20, 5.50, 110.00),
    (1, 2, 2, 10, 12.00, 120.00),
    (2, 1, 3, 15, 3.25, 48.75),
    (2, 2, 4, 8, 28.00, 224.00),
    (3, 1, 5, 25, 4.75, 118.75),
    (3, 2, 6, 12, 14.50, 174.00),
    (4, 1, 7, 18, 2.75, 49.50),
    (4, 2, 8, 20, 26.75, 535.00),
    (5, 1, 9, 30, 6.00, 180.00),
    (5, 2, 10, 15, 19.50, 292.50);


-- Ideas / Conceptos
--
-- Entidad: Companias
-- Descripción: Control de Compañías en la base de datos.
-- Atributos:
--   - CodigoCompania (Clave primaria): Código único de la Compañía.
--   - NombreCompania: Nombre de la Compañía.
--   - Direccion: Dirección de la Compañía.
--   - NumeroPatronal: Número patronal de la Compañía.
--   - CedulaGerente: Cédula del gerente de la Compañía.
--   - NombreGerente: Nombre del gerente de la Compañía.
--   - CedulaPresidente: Cédula del presidente de la Compañía.
--   - NombrePresidente: Nombre del presidente de la Compañía.

-- Entidad: SegmentosClientes
-- Descripción: Control de Segmentos de Clientes en la base de datos.
-- Atributos:
--   - CodigoSegmento (Clave primaria): Código único del Segmento de Clientes.
--   - Descripcion: Descripción del Segmento de Clientes.
--   - NombreGerente: Nombre del gerente del Segmento de Clientes.
--   - UltimaVisitaDoctor: Fecha de la última visita al doctor del Segmento de Clientes.

-- Entidad: Proveedores
-- Descripción: Control de Proveedores en la base de datos.
-- Atributos:
--   - CodigoProveedor (Clave primaria): Código único del Proveedor.
--   - NombreProveedor: Nombre del Proveedor.
--   - CedulaProveedor: Cédula del Proveedor.
--   - TipoProveedor: Tipo de Proveedor.
--   - Telefono: Número de teléfono del Proveedor.
--   - Direccion: Dirección del Proveedor.
--   - NombreContacto: Nombre del contacto del Proveedor.

-- Entidad: Articulos
-- Descripción: Control de Artículos en la base de datos.
-- Atributos:
--   - CodigoArticulo (Clave primaria): Código único del Artículo.
--   - DescripcionArticulo: Descripción del Artículo.
--   - TipoArticulo: Tipo de Artículo.
--   - PrecioUnitario: Precio unitario del Artículo.
--   - PrecioVenta: Precio de venta del Artículo.
--   - Stock: Cantidad en stock del Artículo.
--   - FechaUltimaCompra: Fecha de la última compra del Artículo.
--   - FechaUltimoInventario: Fecha del último inventario del Artículo.

-- Entidad: OrdenesPedido
-- Descripción: Control de Órdenes de Pedido a Proveedores en la base de datos.
-- Atributos:
--   - NumeroOrden (Clave primaria): Número único de la Orden de Pedido.
--   - FechaOrden: Fecha de la Orden de Pedido.
--   - UsuarioComprador: Usuario que realizó la compra.
--   - UsuarioAprobador: Usuario que aprobó la Orden de Pedido.
--   - MontoTotal: Monto total de la Orden de Pedido.

-- Entidad: DetalleOrdenes
-- Descripción: Detalle de las Órdenes de Pedido a Proveedores en la base de datos.
-- Atributos:
--   - NumeroOrden (Clave foránea): Número de la Orden de Pedido asociada.
--   - NumeroLinea (Clave foránea): Número de línea de la Orden de Pedido.
--   - CodigoArticulo (Clave foránea): Código del Artículo asociado.
--   - CantidadOrdenada: Cantidad ordenada del Artículo.
--   - PrecioNegociado: Precio negociado del Artículo.
--   - TotalLinea: Total de la línea de la Orden de Pedido.


-- Relación: Companias (1) - (0 a muchos) SegmentosClientes
-- Una Compañía puede tener cero o muchos Segmentos de Clientes asociados.
-- NOTA: Esto es una relación opcional, ya que una Compañía podría no tener ningún Segmento de Clientes.

-- Relación: SegmentosClientes (0 a muchos) - (1) Companias
-- Un Segmento de Clientes puede estar asociado a una sola Compañía.
-- NOTA: Esto es una relación opcional, ya que un Segmento de Clientes también podría no estar relacionado con ninguna Compañía.

-- Relación: Proveedores (0 a muchos) - (0 a muchos) DetalleOrdenes
-- Un Proveedor puede estar asociado a cero o muchas líneas de Detalle de Órdenes de Pedido.
-- NOTA: Esto es una relación opcional, ya que un Proveedor podría no estar asociado a ninguna Orden de Pedido y, por lo tanto, a ninguna línea de Detalle.

-- Relación: Articulos (0 a muchos) - (0 a muchos) DetalleOrdenes
-- Un Artículo puede estar asociado a cero o muchas líneas de Detalle de Órdenes de Pedido.
-- NOTA: Esto es una relación opcional, ya que un Artículo podría no estar asociado a ninguna Orden de Pedido y, por lo tanto, a ninguna línea de Detalle.

-- Relación: OrdenesPedido (1) - (0 a muchos) DetalleOrdenes
-- Cada Orden de Pedido debe estar relacionada con una o muchas líneas de Detalle de Órdenes de Pedido.
-- NOTA: Esto es una relación obligatoria, ya que todas las Órdenes de Pedido deben tener al menos una línea de Detalle.

-- Relación: Control de Compañías (0 a muchos) - (0 a muchos) Control de Segmentos de Clientes
-- Un Control de Compañías puede estar relacionado con cero o muchos Controles de Segmentos de Clientes.
-- NOTA: Esto es una relación opcional, ya que un Control de Compañías podría no estar relacionado con ningún Control de Segmentos de Clientes.

-- Relación: Control de Segmentos de Clientes (0 a muchos) - (0 a muchos) Control de Compañías
-- Un Control de Segmentos de Clientes puede estar relacionado con cero o muchos Controles de Compañías.
-- NOTA: Esto es una relación opcional, ya que un Control de Segmentos de Clientes podría no estar relacionado con ningún Control de Compañías.
