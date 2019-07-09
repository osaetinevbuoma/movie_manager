package com.modnsolutions.moviemanager.db.repository;

import com.modnsolutions.moviemanager.db.model.Movie;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
    @Query(value = "SELECT movie.* FROM movie INNER JOIN movie_categories ON movie.id = " +
            "movie_categories.movie_id AND movie_categories.category_id = :categoryId ORDER BY " +
            "movie.title ASC",
            countQuery = "SELECT COUNT(movie.id) FROM movie INNER JOIN movie_categories ON " +
                    "movie.id = movie_categories.movie_id AND movie_categories.category_id " +
                    "= :categoryId", nativeQuery = true)
    Page<Movie> findMoviesByCategory(@Param("categoryId") int categoryId, Pageable pageable);
}
