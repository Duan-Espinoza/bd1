package tec.bd.weather.entity;

import java.util.Date;

// Proyecto 2
// Duan Antonio Espinoza
// 201907990
// Dependencias necesarias

public class Country {

    private Integer id;
    private String countryName;

    public Country(Integer id, String countryName) {
        this.id = id;
        this.countryName = countryName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}