package tec.bd.weather.cli.country;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.Country;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "country-update", aliases = {"cu"}, description = "Update country")
public class UpdateCountryCommand implements Runnable {


    @CommandLine.Parameters(paramLabel = "<Country ID>", description = "The Country ID")
    private int countryID;
    @CommandLine.Parameters(paramLabel = "<Country Name>", description = "The Country Name")
    private String countryName;

    @Override
    public void run() {

        System.out.println("Update Country");

        var appContext = new ApplicationContext();
        var countryService = appContext.getCountryService();

        var newCountry = new Country(countryID, countryName);

        var countryToBeUpdated = countryService.updateCountry(newCountry);

        System.out.println("Country Updated");
        System.out.println("CountryID: " + countryToBeUpdated.getId() + " \nCountryName: "+ countryToBeUpdated.getCountryName() );


    }
}

// Este código representa un comando de línea de comandos para la actualización de información de un país.
// El comando se ejecuta con el nombre "country-update" o su alias "cu" y tiene como descripción "Update country".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera dos parámetros: <Country ID> y <Country Name>, que representan el ID del país y el nuevo nombre del país, respectivamente.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la actualización del país.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CountryService.

// Se recupera el CountryService del contexto de la aplicación y se utiliza para crear una nueva instancia de Country con la información proporcionada.

// Se llama al método updateCountry del CountryService para actualizar la información del país en la base de datos.

// Finalmente, se imprime un mensaje indicando que el país ha sido actualizado y se muestran los detalles actualizados del país.
