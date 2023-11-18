package tec.bd.weather.cli.country;


import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "country-create", aliases = {"cc"}, description = "Create new country")
public class CreateCountryCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<country name>", description = "The country name")
    private String countryName;

    @Override
    public void run() {
        System.out.println("Create Country");

        var appContext = new ApplicationContext();
        var countryService = appContext.getCountryService();
        var newCountry = countryService.newCountry(countryName);

        System.out.println("New Country:" + newCountry.getId()+ "," + newCountry.getCountryName());
    }
}


// Este código representa un comando de línea de comandos para la creación de un nuevo país.
// El comando se ejecuta con el nombre "country-create" o su alias "cc" y tiene como descripción "Create new country".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro: <country name>, que representa el nombre del país que se desea crear.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la creación de un país.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CountryService.

// Se recupera el CountryService del contexto de la aplicación y se utiliza para crear un nuevo país con el nombre proporcionado.

// Se imprime la información del nuevo país creado, incluyendo su ID y nombre.
