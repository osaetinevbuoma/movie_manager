package com.modnsolutions.moviemanager.db.repository;

import com.modnsolutions.moviemanager.db.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
