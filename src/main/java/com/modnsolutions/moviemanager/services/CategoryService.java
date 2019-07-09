package com.modnsolutions.moviemanager.services;

import com.modnsolutions.moviemanager.db.model.Category;
import com.modnsolutions.moviemanager.db.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    public void saveCategory(Category category) {
        categoryRepository.saveAndFlush(category);
    }

    public Category findOneCategory(int id) {
        return categoryRepository.getOne(id);
    }

    public void deleteCategory(Category category) {
        categoryRepository.delete(category);
    }
}
