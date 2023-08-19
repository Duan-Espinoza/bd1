package tec.bd.weather.entity;

public class Forecast {

    private Integer id;

    private float temperature;

    private String cityName;

    private String zipCode;

    private String countryName;

    public Forecast() { }

    public Forecast(Integer id, String countryName, String cityName, String zipCode, float temperature) {
        this.id = id;
        this.countryName = countryName;
        this.cityName = cityName;
        this.zipCode = zipCode;
        this.temperature = temperature;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getTemperature() {
        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    @Override
    public String toString() {
        return "Forecast {" +
                "id = " + id +
                ", temperature = " + temperature +
                ", country = '" + countryName + '\'' +
                ", city = '" + cityName + '\'' +
                ", zipCode = '" + zipCode + '\'' +
                ", temperature = " + temperature +
                '}';
    }

    //validaciones
    public static void validate(Forecast weather) {
        if (weather == null) {
            throw new RuntimeException("No weather forecast was provided");
        }
        if (weather.getId() == null) {
            throw new RuntimeException("No weather forecast ID was provided");
        }
        if (weather.getId() < 1) {
            throw new RuntimeException("Weather forecast ID invalid");
        }
        if (weather.getCountryName().isBlank()) {
            throw new RuntimeException("Weather forecast country invalid");
        }
        if (weather.getCityName().isBlank()) {
            throw new RuntimeException("Weather forecast city invalid");
        }
        if (weather.getZipCode().isBlank()) { // se podria utilizar un Regex
            throw new RuntimeException("Weather forecast zip code invalid");
        }
        if (weather.getTemperature() < 0) {
            throw new RuntimeException("Weather forecast temperature invalid");
        }
    }
}
