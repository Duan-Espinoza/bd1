// Importing necessary packages
package tec.bd.weather.cli.bitacora;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.Logs;
import tec.bd.weather.entity.State;

// Proyecto 2 - Project 2
// Duan Antonio Espinoza

// CommandLine annotation to define the command name, aliases, and description
@CommandLine.Command(name = "log", aliases = {"lg"}, description = "Forecast log")
public class BitacoraForecastLogCommand implements Runnable {

    // CommandLine annotation to define a command parameter
    @CommandLine.Parameters(paramLabel = "<nLogs>", description = "The number logs")
    private int nlog;

    // Implementation of the run method from the Runnable interface
    @Override
    public void run() {
        // Printing a message indicating the start of the log reading process
        System.out.println("Read Forecast Logs. Number of logs: " + nlog);

        // Creating an instance of ApplicationContext to access application services
        var appContext = new ApplicationContext();

        // Retrieving the ForecastLogService from the application context
        var forecastLogService = appContext.getForecastLogService();

        // Retrieving logs from the ForecastLogService based on the specified number
        var logs = forecastLogService.getLogs(nlog);

        // Printing header for the log display
        System.out.println("Number: "+ nlog+ "\tLogs in dataBase");
        System.out.println("=========================");

        // Displaying each log retrieved from the database
        for (Logs c : logs) {
            System.out.println(c.getId() + "\t" + c.getLast_modified_on() + "\t" + c.getForecast_id() +"\t"+c.getText());
        }

        // Printing a separator line to conclude the log display
        System.out.println("=========================");
    }
}


// Este código representa un comando de línea de comandos para recuperar y mostrar registros de pronósticos del clima.
// El comando se ejecuta con el nombre "log" o su alias "lg" y tiene como descripción "Forecast log".

// Se utiliza la librería picocli.CommandLine para gestionar los argumentos de la línea de comandos.

// El comando espera un parámetro <nLogs> que indica el número de registros de pronósticos que se deben recuperar.

// El método run() se encarga de ejecutar el comando. Comienza imprimiendo un mensaje de inicio y luego utiliza
// ApplicationContext para acceder a los servicios de la aplicación, específicamente el ForecastLogService.

// Se recuperan los registros de pronósticos usando el número especificado y se imprime un encabezado para la visualización.

// Se itera sobre los registros recuperados e imprime detalles como ID, fecha de modificación, ID de pronóstico y texto del registro.

// Finalmente, se imprime una línea separadora para concluir la visualización de registros.
