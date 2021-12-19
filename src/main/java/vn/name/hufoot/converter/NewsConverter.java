package vn.name.hufoot.converter;

import org.springframework.stereotype.Component;

import vn.name.hufoot.dto.NewsDTO;
import vn.name.hufoot.entity.NewsEntity;


@Component
public class NewsConverter {

	public NewsDTO toDto(NewsEntity entity) {
		NewsDTO result = new NewsDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setContent(entity.getContent());
		result.setThumbnail(entity.getThumbnail());
		return result;
	}
	
	public NewsEntity toEntity(NewsDTO dto) {
		NewsEntity result = new NewsEntity();
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		result.setThumbnail(dto.getThumbnail());
		
		return result;
	}
	
	public NewsEntity toEntity(NewsEntity result, NewsDTO dto) {
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		result.setThumbnail(dto.getThumbnail());
		
		return result;
	}
}
