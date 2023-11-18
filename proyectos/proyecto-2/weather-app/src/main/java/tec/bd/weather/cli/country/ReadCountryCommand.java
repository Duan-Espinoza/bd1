package tec.bd.weather.cli.country;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.Country;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "country-read", aliases = {"cr"}, description = "Read all countries or  by ID")
public class ReadCountryCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<Country ID>", description = "The Country ID", defaultValue = "0")
    private int countryID;
    @Override
    public void run() {
        System.out.println("Read Country. Country ID: " + countryID);

        var appContext = new ApplicationContext();
        var countryService = appContext.getCountryService();

        if(countryID == 0){
            var countries = countryService.getAllCountries();


            System.out.println("All Countries in dataBase");
            System.out.println("=========================");
            for(Country c: countries){
                System.out.println(c.getId()  + "\t" + c.getCountryName());
            }
            System.out.println("=========================");
        }else{
            var country = countryService.getCountryByID(countryID);

            if(country.isPresent()){
                System.out.println("Country Selected in dataBase");
                System.out.println("=========================");
                System.out.println(country.get().getId()  + "\t" + country.get().getCountryName());
                System.out.println("=========================");
            }else{
                System.out.println("CountryID: "+ countryID + "Is not found!");
            }
        }
    }
}

// Este código representa un comando de línea de comandos para la lectura de países, ya sea todos o por ID.
// El comando se ejecuta con el nombre "country-read" o su alias "cr" y tiene como descripción "Read all countries or by ID".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro opcional: <Country ID>, que representa el ID del país que se desea leer. El valor por defecto es 0.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la lectura de países, especificando el ID si se proporciona.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CountryService.

// Se recupera el CountryService del contexto de la aplicación y se utiliza para leer todos los países o un país específico según el ID proporcionado.

// Si el ID es 0, se leen todos los países y se imprime un encabezado seguido de detalles de cada país en la base de datos.

// Si el ID no es 0, se intenta leer el país con ese ID y se imprime la información del país si se encuentra, de lo contrario, se indica que no se encontró el país.
