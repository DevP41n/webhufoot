package vn.name.hufoot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import vn.name.hufoot.entity.ProductEntity;


public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
	 
	@Query("SELECT p FROM ProductEntity p WHERE p.category.id = ?1")
	public List<ProductEntity> findByCateID(long id);
	
	@Query("SELECT p FROM ProductEntity p WHERE p.productName LIKE %?1%"
			+ " OR p.category.name LIKE %?1%"
			+ " OR p.productPrice LIKE %?1%")
    public List<ProductEntity> search(String keyword);
	
}