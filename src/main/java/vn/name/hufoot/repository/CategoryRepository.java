package vn.name.hufoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.name.hufoot.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String code);
}
