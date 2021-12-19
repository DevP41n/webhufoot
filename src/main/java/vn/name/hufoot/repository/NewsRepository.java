package vn.name.hufoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import vn.name.hufoot.entity.NewsEntity;

public interface NewsRepository extends JpaRepository<NewsEntity, Long> {
	
}
