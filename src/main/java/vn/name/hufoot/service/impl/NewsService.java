package vn.name.hufoot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.name.hufoot.converter.NewsConverter;
import vn.name.hufoot.dto.CategoryDTO;
import vn.name.hufoot.dto.NewsDTO;
import vn.name.hufoot.entity.CategoryEntity;
import vn.name.hufoot.entity.NewsEntity;
import vn.name.hufoot.repository.NewsRepository;
import vn.name.hufoot.service.INewsService;

@Service
public class NewsService implements INewsService {
	
	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private NewsConverter newsConverter;

	@Override
	public List<NewsDTO> findAll(Pageable pageable) {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity> entities = newsRepository.findAll(pageable).getContent();
		for (NewsEntity item: entities) {
			NewsDTO newsDTO = newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
		
	}

	@Override
	public int getTotalItem() {
		return (int) newsRepository.count();
	}

	@Override
	public NewsDTO findById(long id) {
		NewsEntity entity = newsRepository.findOne(id);
		return newsConverter.toDto(entity);
	}

	@Transactional
	@Override
	public NewsDTO save(NewsDTO dto) {
		NewsEntity newEntity = new NewsEntity();
		if (dto.getId() != null) {
			NewsEntity oldNews = newsRepository.findOne(dto.getId());
			newEntity = newsConverter.toEntity(oldNews, dto);
		} else {
			newEntity = newsConverter.toEntity(dto);
		}
		return newsConverter.toDto(newsRepository.save(newEntity));
	}

	@Transactional
	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			newsRepository.delete(id);
		}
		
	}

	@Override
	public List<NewsDTO> findAlls() {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity> entities = newsRepository.findAll();
		for (NewsEntity item: entities) {
			NewsDTO newsDTO = newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}
	
	
	
	

}
