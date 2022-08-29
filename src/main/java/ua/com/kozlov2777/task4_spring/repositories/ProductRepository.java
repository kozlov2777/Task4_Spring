package ua.com.kozlov2777.task4_spring.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kozlov2777.task4_spring.models.Product;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String title);
    List<Product> findProductByBrand(String brand);
    List<Product> findByModelCar(String modelCar);

    List<Product> findByBrandAndModelCar(String brand, String modelCar);
    Optional<Product> findById(Long id);
}