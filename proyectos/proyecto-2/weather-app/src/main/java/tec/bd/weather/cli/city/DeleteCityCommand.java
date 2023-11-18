package tec.bd.weather.cli.city;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "city-delete", aliases = {"cid"}, description = "Delete a city")
public class DeleteCityCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<city ID>", description = "The city ID")
    private int cityID;

    @Override
    public void run() {
        System.out.println("Delete City");

        var appContext = new ApplicationContext();
        var cityService = appContext.getCityService();

        try {
            cityService.removeByCityID(cityID);
            System.out.println("CityID: " + cityID + "\tDeleted successfully" );

        }catch (Exception e){
            System.err.println("CityID: "+cityID +" \tnot deleted by reason" + e.getMessage());
        }

    }

}


// Este código representa un comando de línea de comandos para la eliminación de una ciudad.
// El comando se ejecuta con el nombre "city-delete" o su alias "cid" y tiene como descripción "Delete a city".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro: <city ID>, que representa el ID de la ciudad que se desea eliminar.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la eliminación de una ciudad.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CityService.

// Se recupera el CityService del contexto de la aplicación y se utiliza para intentar eliminar la ciudad con el ID proporcionado.

// Se imprime un mensaje indicando si la eliminación fue exitosa o si se produjo un error, junto con información adicional en caso de error.
