package vn.name.hufoot.converter;

import org.springframework.stereotype.Component;

import vn.name.hufoot.dto.CategoryDTO;
import vn.name.hufoot.entity.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDto(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		result.setCategorycode(entity.getCode());
		result.setCategoryname(entity.getName());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity result = new CategoryEntity();
		result.setCode(dto.getCategorycode());
		result.setName(dto.getCategoryname());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryEntity result, CategoryDTO dto) {
		result.setCode(dto.getCategorycode());
		result.setName(dto.getCategoryname());
		return result;
	}
}
