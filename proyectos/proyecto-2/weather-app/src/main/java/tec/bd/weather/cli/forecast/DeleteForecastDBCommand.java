package tec.bd.weather.cli.forecast;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

@CommandLine.Command(name = "forecast-delete", aliases = {"fd"}, description = "Delete Forecast")
public class DeleteForecastDBCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<Forecast ID>", description = "The Forecast ID")
    private int forecastID;


    @Override
    public void run() {
        System.out.println("Delete Forecast");

        var appContext = new ApplicationContext();
        var forecastService = appContext.getForecastService();

        try {
            forecastService.removeByForecastID(forecastID);
            System.out.println("ForecastID: " + forecastID + "\tDeleted successfully" );

        }catch (Exception e){
            System.err.println("Forecast: "+forecastID +" not deleted by reason\t" + e.getMessage());
        }
    }
}


// Este código representa un comando de línea de comandos para la eliminación de un pronóstico del clima.
// El comando se ejecuta con el nombre "forecast-delete" o su alias "fd" y tiene como descripción "Delete Forecast".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro: <Forecast ID>, que representa el ID del pronóstico que se desea eliminar.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje indicando la eliminación de un pronóstico.

// Se crea una instancia de ApplicationContext para acceder a los servicios de la aplicación, específicamente el ForecastService.

// Se recupera el ForecastService del contexto de la aplicación y se utiliza para intentar eliminar el pronóstico con el ID proporcionado.

// Se imprime un mensaje indicando si la eliminación fue exitosa o si se produjo un error, junto con información adicional en caso de error.
