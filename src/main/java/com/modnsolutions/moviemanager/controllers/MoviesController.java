package com.modnsolutions.moviemanager.controllers;

import com.modnsolutions.moviemanager.db.model.Category;
import com.modnsolutions.moviemanager.db.model.Movie;
import com.modnsolutions.moviemanager.services.CategoryService;
import com.modnsolutions.moviemanager.services.MovieService;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequestMapping(value = "/movies")
public class MoviesController {
    private static final Logger logger = Logger.getLogger(MoviesController.class.getCanonicalName());

    @Autowired
    CategoryService categoryService;

    @Autowired
    MovieService movieService;

    @GetMapping
    public String list(Model model, @RequestParam("category") Optional<Integer> categoryId,
                       @RequestParam("page") Optional<Integer> page) {
        if (categoryId.isPresent()) {
            int currentPage = page.orElse(1);
            int itemsPerPage = 5;

            Page<Movie> moviePage = movieService.listMovies(categoryId.get(),
                    PageRequest.of(currentPage - 1, itemsPerPage));
            model.addAttribute("movies", moviePage);
            model.addAttribute("category", categoryId.get());

            int totalPages = moviePage.getTotalPages();
            if (totalPages > 0) {
                List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
                        .boxed()
                        .collect(Collectors.toList());
                model.addAttribute("pageNumbers", pageNumbers);
            }
        }

        model.addAttribute("categories", categoryService.findAll());
        return "movies/list";
    }

    @GetMapping(value = "/create")
    public String create(Model model) {
        model.addAttribute("movie", new Movie());
        model.addAttribute("categories", categoryService.findAll());
        return "movies/create";
    }

    @PostMapping(value = "/create")
    public String add(@ModelAttribute @Valid Movie movie, HttpServletRequest httpServletRequest,
                      BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "movies/create";
        }

        movie.setCategories(movieService.getMovieCategories(httpServletRequest));
        movieService.saveMovie(movie);

        redirectAttributes.addFlashAttribute("flashSuccess",
                movie.getTitle() + " saved.");
        return "redirect:/movies/create";
    }

    @GetMapping(value = "/edit/{id}")
    public String edit(Model model, @PathVariable("id") int id) {
        model.addAttribute("movie", movieService.getMovie(id));
        model.addAttribute("categories", categoryService.findAll());
        return "movies/edit";
    }

    @PutMapping(value = "/edit/{id}")
    public String update(@PathVariable("id") int id, @ModelAttribute @Valid Movie movie,
                         HttpServletRequest httpServletRequest, BindingResult bindingResult,
                         RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "movies/edit";
        }

        movie.setCategories(movieService.getMovieCategories(httpServletRequest));
        movieService.saveMovie(movie);

        redirectAttributes.addFlashAttribute("flashSuccess",
                "Movie updated.");
        return "redirect:/movies/edit/" + id;
    }

    @DeleteMapping(value = "/delete/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@PathVariable("id") int id) {
        movieService.deleteMovie(movieService.getMovie(id));
    }

    @GetMapping("/details/{id}")
    public String details(Model model, @PathVariable("id") int id) {
        model.addAttribute("movie", movieService.getMovie(id));
        model.addAttribute("categories", categoryService.findAll());
        return "movies/details";
    }
}
