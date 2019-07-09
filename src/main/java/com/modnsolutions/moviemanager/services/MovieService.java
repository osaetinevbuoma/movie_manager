package com.modnsolutions.moviemanager.services;

import com.modnsolutions.moviemanager.db.model.Category;
import com.modnsolutions.moviemanager.db.model.Movie;
import com.modnsolutions.moviemanager.db.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class MovieService {
    @Autowired
    MovieRepository movieRepository;

    @Autowired
    CategoryService categoryService;

    public Page<Movie> listMovies(Pageable pageable) {
        int itemsPerPage = 5;
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * itemsPerPage;
        List<Movie> movies;
        List<Movie> allMovies = findAll();

        if (allMovies.size() < startItem) movies = Collections.emptyList();
        else {
            int toIndex = Math.min(startItem + itemsPerPage, allMovies.size());
            movies = allMovies.subList(startItem, toIndex);
        }

        return new PageImpl<>(movies, PageRequest.of(currentPage, itemsPerPage),
                allMovies.size());
    }

    public Page<Movie> listMovies(int categoryId, Pageable pageable) {
        return movieRepository.findMoviesByCategory(categoryId, pageable);
    }

    public List<Movie> findAll() {
        return movieRepository.findAll();
    }

    public void saveMovie(Movie movie) {
        movieRepository.saveAndFlush(movie);
    }

    public Movie getMovie(int id) {
        return movieRepository.getOne(id);
    }

    public void deleteMovie(Movie movie) {
        movieRepository.delete(movie);
    }

    public Set<Category> getMovieCategories(HttpServletRequest httpServletRequest) {
        Set<Category> categories = new HashSet<>();
        String[] categoryIds = httpServletRequest.getParameterValues("type[]");
        for (String categoryId : categoryIds) {
            categories.add(categoryService.findOneCategory(Integer.valueOf(categoryId)));
        }

        return categories;
    }


}
