-- Duan Antonio Espinoza
-- 201907949
-- Proyecto 2
-- Elimina tablas si existen
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS forecast;
DROP TABLE IF EXISTS forecast_log;

-- Crea la base de datos weather_service
CREATE DATABASE IF NOT EXISTS weather_service;

-- Selecciona la base de datos recién creada
USE weather_service;

-- Crea un usuario y le otorga permisos
CREATE USER 'weatherappuser'@'localhost' IDENTIFIED BY 'weatherapppass';
GRANT INSERT, UPDATE, DELETE, EXECUTE ON weather_service.* TO 'weatherappuser'@'localhost';

-- Crea la tabla country
CREATE TABLE country (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL UNIQUE
);

-- Crea la tabla State
CREATE TABLE state (
    StateID INT AUTO_INCREMENT PRIMARY KEY,
    StateName VARCHAR(50) NOT NULL, 
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES country(CountryID)
);

-- Crea la tabla City
CREATE TABLE city (
    CityID INT AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL,
    ZipCode INT NOT NULL UNIQUE, 
    StateID INT,
    FOREIGN KEY (StateID) REFERENCES state(StateID)
);

-- Crea la tabla forecast
CREATE TABLE forecast (
    Forecast_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    CityID INT NOT NULL,
    ZipCode INT NOT NULL,
    Temperature FLOAT NOT NULL,
    Forecast_date VARCHAR(50) NOT NULL,
    INDEX ICode(ZipCode),
    FOREIGN KEY (CityID) REFERENCES city(CityID)
);

-- Crea la tabla forecast_log
CREATE TABLE forecast_log (
    Log_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Last_modified_on VARCHAR(50) NOT NULL,
    Forecast_id INT NOT NULL,
    Entry_text VARCHAR(50) NOT NULL
);

-- CRUDs para country
-- Insertar nuevo país
DELIMITER $$
CREATE PROCEDURE CreateNewCountry(IN p_countryName VARCHAR(50), OUT p_new_countryID INT)
BEGIN
    ROLLBACK;
    START TRANSACTION;
    INSERT INTO country(CountryName) VALUES (p_countryName);
    SELECT last_insert_id() INTO p_new_countryID;
    COMMIT;
END $$
DELIMITER ;

-- Leer todos los países o por ID
DELIMITER $$
CREATE PROCEDURE findAllCountries(IN p_countryID INT)
BEGIN
    IF(p_countryID <= 0) THEN 
        SELECT CountryID, CountryName FROM country ORDER BY CountryID ASC;
    ELSE 
        SELECT * FROM country WHERE CountryID = p_countryID;
    END IF;
END $$
DELIMITER ;

-- Encontrar país por nombre
DELIMITER $$
CREATE PROCEDURE findCountryByName(IN p_countryName VARCHAR(50))
BEGIN
    SELECT * FROM country WHERE CountryName = p_countryName;
END $$
DELIMITER ;

-- Eliminar país
DELIMITER $$
CREATE PROCEDURE deleteCountry(IN p_countryID INT)
BEGIN
    ROLLBACK;
    START TRANSACTION;
    DELETE FROM country WHERE CountryID = p_countryID;
    COMMIT;  
END $$
DELIMITER ;

-- Actualizar país
DELIMITER $$
CREATE PROCEDURE updateCountry(IN p_countryID INT, IN p_countryName VARCHAR(50))
BEGIN
    ROLLBACK;
    START TRANSACTION;
    UPDATE country SET CountryName = p_countryName WHERE CountryID = p_countryID;
    COMMIT;
END $$
DELIMITER ;

-- CRUDs para state (Procedimientos similares a los de country)
-- CRUDs para city (Procedimientos similares a los de country)

-- CRUDs para forecast
-- Encontrar código postal
DELIMITER $$
CREATE PROCEDURE findZipcode(IN p_cityID INT, OUT p_new_zipcodeID INT )
BEGIN
    SELECT ZipCode INTO p_new_zipcodeID FROM city WHERE CityID = p_cityID;
END $$
DELIMITER ;

-- Encontrar nombre de ciudad
DELIMITER $$
CREATE PROCEDURE findCityName(IN p_cityID INT, OUT p_cityName VARCHAR(50))
BEGIN
    SELECT CityName INTO p_cityName FROM city WHERE CityID = p_cityID;
END $$
DELIMITER ;

-- Encontrar ID de estado
DELIMITER $$
CREATE PROCEDURE findStateID(IN p_cityID INT, OUT p_stateID INT)
BEGIN
    SELECT StateID INTO p_stateID FROM city WHERE CityID = p_cityID;
END $$
DELIMITER ;

-- Encontrar nombre de estado
DELIMITER $$
CREATE PROCEDURE findStateName(IN p_stateID INT, OUT p_stateName VARCHAR(50))
BEGIN
    SELECT StateName INTO p_stateName FROM state WHERE StateID = p_stateID;
END $$
DELIMITER ;

-- Encontrar ID de país
DELIMITER $$
CREATE PROCEDURE findCountryID(IN p_stateID INT, OUT p_countryID INT)
BEGIN
    SELECT CountryID INTO p_countryID FROM state WHERE StateID = p_stateID;
END $$
DELIMITER ;

-- Encontrar nombre de país
DELIMITER $$
CREATE PROCEDURE findCountryName(IN p_countryID INT, OUT p_countryName VARCHAR(50))
BEGIN
    SELECT CountryName INTO p_countryName FROM country WHERE CountryID = p_countryID;
END $$
DELIMITER ;

-- Crear nuevo pronóstico
DELIMITER $$
CREATE PROCEDURE CreateNewForecast(IN p_cityID INT, IN p_zipcode INT, IN p_temperature FLOAT, IN p_fecha DATE, OUT p_new_forecastID INT)
BEGIN
    ROLLBACK;
    START TRANSACTION;
    INSERT INTO forecast (CityID, ZipCode, Temperature, Forecast_date) VALUES (p_cityID, p_zipcode, p_temperature, p_fecha);
    SELECT last_insert_id() INTO p_new_forecastID;
    COMMIT;
END $$
DELIMITER ;

-- Leer todos los pronósticos por fecha
DELIMITER $$
CREATE PROCEDURE findAllForecast(IN p_forecastDate VARCHAR(50))
BEGIN
    SELECT Forecast_id, CityID, ZipCode, Temperature, Forecast_date FROM forecast WHERE Forecast_date = p_forecastDate ORDER BY Forecast_id ASC;
END $$
DELIMITER ;

-- Leer todos los pronósticos por código postal
DELIMITER $$
CREATE PROCEDURE findAllForecastZipCode(IN p_zipCode INT)
BEGIN
    SELECT Forecast_id, CityID, ZipCode, Temperature, Forecast_date FROM forecast WHERE ZipCode = p_zipCode ORDER BY Forecast_id ASC;
END $$
DELIMITER ;

-- Leer todos los pronósticos por código de ciudad
DELIMITER $$
CREATE PROCEDURE findAllForecastCityCode(IN p_cityCode INT)
BEGIN
    SELECT Forecast_id, CityID, ZipCode, Temperature, Forecast_date FROM forecast WHERE CityID = p_cityCode ORDER BY Forecast_id ASC;
END $$
DELIMITER ;

-- Eliminar pronóstico
DELIMITER $$
CREATE PROCEDURE deleteForecast(IN p_forecastID INT)
BEGIN
    ROLLBACK;
    START TRANSACTION;
    DELETE FROM forecast WHERE Forecast_id = p_forecastID;
    COMMIT;
END $$
DELIMITER ;

-- Encontrar pronóstico por ID
DELIMITER $$
CREATE PROCEDURE findForecastByID(IN p_forecastID INT)
BEGIN
    SELECT * FROM forecast WHERE Forecast_id = p_forecastID;
END $$
DELIMITER ;

-- Actualizar pronóstico
DELIMITER $$
CREATE PROCEDURE updateForecast(IN p_forecastID INT, IN p_cityID INT, IN p_zipcode INT, IN p_temperature FLOAT, IN p_date VARCHAR(50))
BEGIN
    ROLLBACK;
    START TRANSACTION;
    UPDATE forecast SET CityID = p_cityID, ZipCode = p_zipcode, Temperature = p_temperature, Forecast_date = p_date WHERE Forecast_id = p_forecastID;
    COMMIT;
END $$
DELIMITER ;

-- Obtener últimos registros de pronóstico
DELIMITER $$
CREATE PROCEDURE GetLastForecastLogs(IN N INT)
BEGIN
    SELECT * FROM forecast_log ORDER BY Last_modified_on DESC LIMIT N;
END $$
DELIMITER ;

-- Triggers
-- Trigger AFTER INSERT
DELIMITER $$
CREATE TRIGGER after_forecast_insert
AFTER INSERT ON forecast
FOR EACH ROW
INSERT INTO forecast_log (Last_modified_on, forecast_id, Entry_text)
VALUES (NEW.Forecast_date, NEW.forecast_id, 'Nuevo pronóstico');
DELIMITER ;

-- Trigger AFTER UPDATE
CREATE TRIGGER after_forecast_update
AFTER UPDATE ON forecast
FOR EACH ROW
INSERT INTO forecast_log (Last_modified_on, forecast_id, Entry_text)
VALUES (NEW.Forecast_date, NEW.forecast_id, 'Actualización');
DELIMITER ;

-- Trigger AFTER DELETE
CREATE TRIGGER after_forecast_delete
AFTER DELETE ON forecast
FOR EACH ROW
INSERT INTO forecast_log (Last_modified_on, forecast_id, Entry_text)
VALUES (OLD.Forecast_date, OLD.forecast_id, 'Pronóstico eliminado');
DELIMITER ;
