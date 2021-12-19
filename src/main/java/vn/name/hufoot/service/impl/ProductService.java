package vn.name.hufoot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.name.hufoot.converter.ProductConverter;

import vn.name.hufoot.dto.ProductDTO;
import vn.name.hufoot.entity.CategoryEntity;
import vn.name.hufoot.entity.ProductEntity;
import vn.name.hufoot.repository.CategoryRepository;
import vn.name.hufoot.repository.ProductRepository;
import vn.name.hufoot.service.IProductService;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Override
	public List<ProductDTO> findAll(Pageable pageable) {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll(pageable).getContent();
		for (ProductEntity item: entities) {
			ProductDTO productDTO = productConverter.toDto(item);
			models.add(productDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) productRepository.count();
	}
	
	@Override
	public ProductDTO findById(long id) {
		ProductEntity entity = productRepository.findOne(id);
		return productConverter.toDto(entity);
	}
	
	@Override
	@Transactional
	public ProductDTO save(ProductDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		ProductEntity newEntity = new ProductEntity();
		if (dto.getId() != null) {
			ProductEntity oldNew = productRepository.findOne(dto.getId());
			oldNew.setCategory(category);
			newEntity = productConverter.toEntity(oldNew, dto);
		} else {
			newEntity = productConverter.toEntity(dto);
			newEntity.setCategory(category);
		}
		return productConverter.toDto(productRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			productRepository.delete(id);
		}
	}

	

	@Override
	public List<ProductEntity> findByCategoryID(long id) {
		
		return productRepository.findByCateID(id);
		
	}

	@Override
	public List<ProductEntity> search(String keyword) {

		return productRepository.search(keyword);
	}

}
