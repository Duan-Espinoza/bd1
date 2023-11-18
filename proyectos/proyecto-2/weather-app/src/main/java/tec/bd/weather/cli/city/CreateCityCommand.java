// Importación de paquetes necesarios
package tec.bd.weather.cli.city;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

// Anotación CommandLine para definir el nombre del comando, alias y descripción
@CommandLine.Command(name = "city-create", aliases = {"cic"}, description = "Create new city")
public class CreateCityCommand implements Runnable {

    // Anotación CommandLine para definir un parámetro del comando
    @CommandLine.Parameters(paramLabel = "<city name>", description = "The city name")
    private String cityName;

    // Anotación CommandLine para definir un parámetro del comando
    @CommandLine.Parameters(paramLabel = "<zipcode>", description = "The zipcode")
    private int zipcode;

    // Anotación CommandLine para definir un parámetro del comando
    @CommandLine.Parameters(paramLabel = "<state ID>", description = "The state associate")
    private int stateID;

    // Implementación del método run de la interfaz Runnable
    @Override
    public void run() {
        // Impresión de un mensaje indicando la creación de una ciudad
        System.out.println("Create City");

        // Creación de una instancia de ApplicationContext para acceder a los servicios de la aplicación
        var appContext = new ApplicationContext();

        // Recuperación del CityService desde el contexto de la aplicación
        var cityService = appContext.getCityService();

        // Creación de una nueva ciudad utilizando el CityService
        var newCity = cityService.newCity(cityName, zipcode, stateID);

        // Impresión de la información de la nueva ciudad creada
        System.out.println("New City: " + newCity.getId()+ ", " + newCity.getCityName()+ ", " +newCity.getZipcode() + ", " + newCity.getStateID());
    }
}


// Este código representa un comando de línea de comandos para la creación de una nueva ciudad.
// El comando se ejecuta con el nombre "city-create" o su alias "cic" y tiene como descripción "Create new city".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera tres parámetros: <city name>, <zipcode> y <state ID>, que representan el nombre de la ciudad,
// el código postal y el ID del estado asociado a la ciudad, respectivamente.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la creación de una ciudad.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CityService.

// Se recupera el CityService del contexto de la aplicación y se utiliza para crear una nueva ciudad con los parámetros proporcionados.

// Se imprime la información de la nueva ciudad creada, incluyendo su ID, nombre, código postal y el ID del estado asociado.
