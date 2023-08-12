package tec.bd.weather;



public interface WeatherService {

    float getZipCodeTemperature(String zipCode);

    float getCityTemperature(String city);
}
