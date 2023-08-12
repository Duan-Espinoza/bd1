/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tec.bd.weather;
import picocli.CommandLine;

@CommandLine.Command(name="by-city", description="Get weather for a particular city")

/**
 *
 * @author Duan Espinoza
 */
public class WeatherByCityCommand implements Runnable{
    
    @CommandLine.Parameters(paramLabel="<city name>", description=" The city name")
    private String cityName;
    
    @Override
    public void run(){
        System.out.println("By City: "+cityName);
        
        try{
            WeatherService weatherService= new WeatherServiceImpl();
            System.out.println(weatherService.getCityTemperature(cityName));
        }catch(Exception e){
            System.err.println(cityName+" is not supported");
        }
        
        
        
    }
    
}
