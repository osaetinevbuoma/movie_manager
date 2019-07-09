package com.modnsolutions.moviemanager.controllers;

import com.modnsolutions.moviemanager.db.model.Category;
import com.modnsolutions.moviemanager.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/categories")
public class CategoriesController {

    @Autowired
    CategoryService categoryService;

    @GetMapping
    public String categories(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "categories/list";
    }

    @GetMapping(value = "/create")
    public String create(Model model) {
        model.addAttribute("category", new Category());
        return "categories/create";
    }

    @PostMapping(value = "/create")
    public String add(@Valid @ModelAttribute Category category, BindingResult bindingResult,
                      RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "categories/create";
        }

        categoryService.saveCategory(category);

        redirectAttributes.addFlashAttribute("flashSuccess",
                category.getType() + " saved.");
        return "redirect:/categories/create";
    }

    @GetMapping(value = "/edit/{id}")
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("category", categoryService.findOneCategory(id));
        return "categories/edit";
    }

    @PutMapping(value = "/edit/{id}")
    public String update(@PathVariable("id") int id, @Valid @ModelAttribute Category category,
                         BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "categories/edit";
        }

        categoryService.saveCategory(category);

        redirectAttributes.addFlashAttribute("flashSuccess", "Category " +
                "updated.");
        return "redirect:/categories/edit/" + id;
    }

    @DeleteMapping(value = "/delete/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@PathVariable("id") int id) {
        categoryService.deleteCategory(categoryService.findOneCategory(id));
    }
}
