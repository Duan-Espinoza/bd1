package tec.bd.weather.cli.forecast;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

import java.util.Date;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "forecast-create", aliases = {"cf"}, description = "Create new forecast")
public class CreateForecastDBCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<city ID>", description = "The city ID")
    private int cityID;

    @CommandLine.Parameters(paramLabel = "<Temperature>", description = "The Temperature")
    private float temperature;
    @CommandLine.Parameters(paramLabel = "<Date>", description = "The forecast Date")
    private String date;


    @Override
    public void run() {
        System.out.println("Create Forecast");

        var appContext = new ApplicationContext();
        var forecastService = appContext.getForecastService();
        var newForecast = forecastService.newFore(cityID, temperature, date);

        System.out.println("New Forecast: " + newForecast.getId()+ ", " + newForecast.getCityID()+ ", " +newForecast.getZipcode() + ", " + newForecast.getTemperature()+ ", " + newForecast.getForecastDate());
    }
}


// Este código representa un comando de línea de comandos para la creación de un nuevo pronóstico del clima.
// El comando se ejecuta con el nombre "forecast-create" o su alias "cf" y tiene como descripción "Create new forecast".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera tres parámetros: <city ID>, <Temperature> y <Date>, que representan el ID de la ciudad,
// la temperatura del pronóstico y la fecha del pronóstico, respectivamente.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la creación de un pronóstico.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el ForecastService.

// Se recupera el ForecastService del contexto de la aplicación y se utiliza para crear un nuevo pronóstico con la información proporcionada.

// Se imprime la información del nuevo pronóstico creado, incluyendo su ID, ID de la ciudad, código postal, temperatura y fecha del pronóstico.
