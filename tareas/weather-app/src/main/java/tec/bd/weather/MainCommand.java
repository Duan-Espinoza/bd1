/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tec.bd.weather;

import picocli.CommandLine;

@CommandLine.Command(
        name= "Weather App",
        subcommands={
            WeatherByCityCommand.class,
            CommandLine.HelpCommand.class
        },
        description= "Weather App Service by City and Zip Code")

/**
 *
 * @author Duan Espinoza
 */
public class MainCommand implements Runnable {
    
    @Override
    public void run(){
        
    }
    
}
