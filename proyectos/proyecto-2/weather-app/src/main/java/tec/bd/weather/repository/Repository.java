package tec.bd.weather.repository;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;


public interface Repository <T,ID> {

    /**
     * Encontrar items por id
     * @param id
     * @return Item
     */
    Optional findById(ID id);

    List<T> findAll();

    List<T> findLogs(Integer n);

    List<T> findAllDate(String forecastDate);

    List<T> findAllZipCode(Integer zipCode);

    List<T> findAllCityID(Integer zipCode);

    T save(T t);

    void delete(ID id);

    T update(T source);
}