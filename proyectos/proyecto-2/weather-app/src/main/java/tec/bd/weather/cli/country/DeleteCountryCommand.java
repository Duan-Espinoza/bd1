package tec.bd.weather.cli.country;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "country-delete", aliases = {"cd"}, description = "Delete a country")
public class DeleteCountryCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<Country ID>", description = "The Country ID")
    private int countryID;

    @Override
    public void run() {
        System.out.println("Delete Country");

        var appContext = new ApplicationContext();
        var countryService = appContext.getCountryService();

        try {
            countryService.removeByCountryID(countryID);
            System.out.println("CountryID: " + countryID + "\tDeleted successfully" );
            
        }catch (Exception e){
            System.err.println("CountryID: "+countryID +" \tnot deleted by reason" + e.getMessage());
        }

    }

}

// Este código representa un comando de línea de comandos para la eliminación de un país.
// El comando se ejecuta con el nombre "country-delete" o su alias "cd" y tiene como descripción "Delete a country".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro: <Country ID>, que representa el ID del país que se desea eliminar.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la eliminación de un país.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CountryService.

// Se recupera el CountryService del contexto de la aplicación y se utiliza para intentar eliminar el país con el ID proporcionado.

// Se imprime un mensaje indicando si la eliminación fue exitosa o si se produjo un error, junto con información adicional en caso de error.
