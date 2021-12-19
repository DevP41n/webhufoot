package vn.name.hufoot.converter;

import org.springframework.stereotype.Component;

import vn.name.hufoot.dto.ProductDTO;
import vn.name.hufoot.entity.ProductEntity;

@Component
public class ProductConverter {

	public ProductDTO toDto(ProductEntity entity) {
		ProductDTO result = new ProductDTO();
		result.setId(entity.getId());
		result.setProductname(entity.getProductName());
		result.setProductprice(entity.getProductPrice());
		result.setProductimage(entity.getProductImage());
		result.setProductcontent(entity.getProductContent());
		result.setCategoryCode(entity.getCategory().getCode());
		return result;
	}
	
	public ProductEntity toEntity(ProductDTO dto) {
		ProductEntity result = new ProductEntity();
		result.setProductName(dto.getProductname());
		result.setProductPrice(dto.getProductprice());
		result.setProductImage(dto.getProductimage());
		result.setProductContent(dto.getProductcontent());
		return result;
	}
	
	public ProductEntity toEntity(ProductEntity result, ProductDTO dto) {
		result.setProductName(dto.getProductname());
		result.setProductPrice(dto.getProductprice());
		result.setProductImage(dto.getProductimage());
		result.setProductContent(dto.getProductcontent());
		return result;
	}
}
