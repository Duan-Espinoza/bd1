package tec.bd.weather.cli.city;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.City;
import tec.bd.weather.entity.Country;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "city-read", aliases = {"cir"}, description = "Read all cities or  by ID")
public class ReadCityCommand  implements Runnable {

    @CommandLine.Parameters(paramLabel = "<City ID>", description = "The City ID", defaultValue = "0")
    private int cityID;
    @Override
    public void run() {
        System.out.println("Read City. City ID: " + cityID);

        var appContext = new ApplicationContext();
        var cityService = appContext.getCityService();

        if(cityID == 0){
            var cities = cityService.getAllCities();


            System.out.println("All Cities in dataBase");
            System.out.println("=========================");
            for(City c: cities){
                System.out.println(c.getId()  + "\t" + c.getCityName()+ "\t" + c.getZipcode() + "\t" + c.getStateID());
            }
            System.out.println("=========================");
        }else{
            var city = cityService.getCityByID(cityID);

            if(city.isPresent()){
                System.out.println("City Selected in dataBase");
                System.out.println("=========================");
                System.out.println(city.get().getId()  + "\t" + city.get().getCityName()+ "\t" + city.get().getZipcode() + "\t" + city.get().getStateID());
                System.out.println("=========================");
            }else{
                System.out.println("CityID: "+ cityID + "Is not found!");
            }
        }
    }
}

// Este código representa un comando de línea de comandos para la lectura de ciudades, ya sea todas o por ID.
// El comando se ejecuta con el nombre "city-read" o su alias "cir" y tiene como descripción "Read all cities or by ID".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro opcional: <City ID>, que representa el ID de la ciudad que se desea leer. El valor por defecto es 0.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la lectura de ciudades, especificando el ID si se proporciona.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el CityService.

// Se recupera el CityService del contexto de la aplicación y se utiliza para leer todas las ciudades o una ciudad específica según el ID proporcionado.

// Si el ID es 0, se leen todas las ciudades y se imprime un encabezado seguido de detalles de cada ciudad en la base de datos.

// Si el ID no es 0, se intenta leer la ciudad con ese ID y se imprime la información de la ciudad si se encuentra, de lo contrario, se indica que no se encontró la ciudad.
