package edu.matc.entity;

import javax.persistence.*;

/**
 * A class to represent a user movie
 *
 * @author lemerson
 */
@Entity
@Table(name = "user_movies")


public class Movie implements java.io.Serializable {


    @Id
    @Column(name = "movie_id")
    private Integer movieId;

    @Id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_name", referencedColumnName = "user_name", nullable = false)
    private User user;

    /**
     * Instantiates a new Movie.
     */
    public Movie() {
    }

    /**
     * Instantiates a
     * @param movieId  f
     */
    public Movie(Integer movieId) {
        this.movieId = movieId;
    }

    /**
     * Gets movieId
     * @return movieId
     */
    public Integer getMovieId() {
        return movieId;
    }

    /**
     * Sets movieId.
     * @param movieId the
     */
    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }


    /**
     * Gets the user
     * @return the user for this
     */
    public User getUser() {
        return this.user;
    }

    /**
     * Sets the user
     * @param user the user for this
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Return a string describing the object.
     * @return the combined string to help identify the specific user object.
     */

    @Override
    public String toString() {
        return "User";
    }

}