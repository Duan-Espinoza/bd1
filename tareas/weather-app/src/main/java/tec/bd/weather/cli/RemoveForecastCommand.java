package tec.bd.weather.cli;

import picocli.CommandLine;
import tec.bd.weather.ApplicationContext;
import tec.bd.weather.entity.Forecast;

@CommandLine.Command(name = "remove-forecast", aliases = {"rf"}, description = "Remove new forecast for a city")
public class RemoveForecastCommand implements Runnable {

    @CommandLine.Parameters(paramLabel = "<forecast id>", description = "Remove forecast id")
    private int forecastId;

    @Override
    public void run() {
        try {
            var appContext = new ApplicationContext();
            var weatherService = appContext.getWeatherService();
            weatherService.removeForecast(forecastId);
            System.out.println("The forest with de ID " + forecastId + " was successfully removed");
        } catch (Exception e) {
            System.err.println("Can't remove forecast. " + e.getMessage());


        }
    }
}