package vn.name.hufoot.service;

import java.util.List;

import org.springframework.data.domain.Pageable;


import vn.name.hufoot.dto.NewsDTO;

public interface INewsService {
	List<NewsDTO> findAll(Pageable pageable);
	int getTotalItem();
	NewsDTO findById(long id);
	NewsDTO save(NewsDTO dto);
	void delete(long[] ids);
	List<NewsDTO> findAlls();
}
