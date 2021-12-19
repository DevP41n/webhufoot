package vn.name.hufoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.name.hufoot.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, int status);
}
