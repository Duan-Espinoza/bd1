/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tec.bd.weather;
import picocli.CommandLine;

@CommandLine.Command(name="by-zip", description="Get weather for a Zip code")
/**
 *
 * @author Duan Espinoza
 */
public class WeatherByZipCodeCommand implements Runnable {
    @CommandLine.Parameters(paramLabel="<zip code>", description=" The Zip code")
    private String zipCode;
    
    
    @Override
    public void run(){
        System.out.println("By Zip Code: "+zipCode);
    }
    
}
