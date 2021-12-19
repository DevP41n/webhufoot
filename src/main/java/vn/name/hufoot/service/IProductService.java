package vn.name.hufoot.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import vn.name.hufoot.dto.ProductDTO;
import vn.name.hufoot.entity.ProductEntity;

public interface IProductService {
	List<ProductDTO> findAll(Pageable pageable);
	int getTotalItem();
	ProductDTO findById(long id);
	ProductDTO save(ProductDTO dto);
	void delete(long[] ids);
	
	  List<ProductEntity> findByCategoryID(long id); 
	  List<ProductEntity> search(String keyword);
	  
	 
	
	
}
