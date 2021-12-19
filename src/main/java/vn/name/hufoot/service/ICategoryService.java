package vn.name.hufoot.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import vn.name.hufoot.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> findAll(Pageable pageable);
	int getTotalItem();
	CategoryDTO findById(long id);
	CategoryDTO save(CategoryDTO dto);
	void delete(long[] ids);
	List<CategoryDTO> findAlls();
}
