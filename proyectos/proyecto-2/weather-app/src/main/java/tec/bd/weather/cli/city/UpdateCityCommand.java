package tec.bd.weather.cli.city;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.City;
import tec.bd.weather.entity.State;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "city-update", aliases = {"ciu"}, description = "update city")
public class UpdateCityCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<city ID>", description = "The city ID")
    private int cityID;
    @CommandLine.Parameters(paramLabel = "<city Name>", description = "The city Name")
    private String cityName;

    @CommandLine.Parameters(paramLabel = "<zipcode>", description = "The zipcode ")
    private int zipcode;
    @CommandLine.Parameters(paramLabel = "<State ID>", description = "The StateID associate ")
    private int stateID;


    @Override
    public void run() {
        System.out.println("Update City");

        var appContext = new ApplicationContext();
        var cityService = appContext.getCityService();

        var newCity = new City(cityID, cityName,zipcode, stateID);

        var cityToBeUpdated = cityService.updateCity(newCity);

        System.out.println("City Updated");
        System.out.println("CityID: " + cityToBeUpdated.getId() + " \nCityName: "+ cityToBeUpdated.getCityName()+ "\nZipCode " + cityToBeUpdated.getZipcode()  + "\nState Associate " + cityToBeUpdated.getStateID() );
    }
}

// Este código representa un comando de línea de comandos para la actualización de información de una ciudad.
// El comando se ejecuta con el nombre "city-update" o su alias "ciu" y tiene como descripción "update city".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera cuatro parámetros: <city ID>, <city Name>, <zipcode> y <State ID>, que representan el ID de la ciudad,
// el nombre de la ciudad, el código postal y el ID del estado asociado a la ciudad, respectivamente.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la actualización de la ciudad.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CityService.

// Se recupera el CityService del contexto de la aplicación y se utiliza para crear una nueva instancia de City con la información proporcionada.

// Se llama al método updateCity del CityService para actualizar la información de la ciudad en la base de datos.

// Finalmente, se imprime un mensaje indicando que la ciudad ha sido actualizada y se muestran los detalles actualizados de la ciudad.
