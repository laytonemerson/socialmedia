package edu.matc.entity;

import javax.persistence.*;
import java.time.LocalDate;

/**
 * A class to represent a user role.
 *
 * @author lemerson
 */
@Entity
@Table(name = "user_roles")


public class Movie implements java.io.Serializable {


    @Id
    @Column(name = "movie_id")
    private Integer movieId;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_name", referencedColumnName = "user_name", nullable = false)
    private User user;

    @Column(name = "added_date")
    private LocalDate addedDate;

    /**
     * Instantiates a new Movie.
     */
    public Movie() {
    }

    /**
     * Instantiates a
     * @param movieId  f
     * @param addedDate f
     */
    public Movie(Integer movieId, LocalDate addedDate) {
        this.movieId = movieId;
        this.addedDate = addedDate;
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
     * Gets addedDate
     * @return addedDate
     */
    public LocalDate getAddedDate() {
        return addedDate;
    }

    /**
     * Sets addedDate
     * @param addedDate the
     */
    public void setAddedDate(LocalDate addedDate) {
        this.addedDate = addedDate;
    }

    /**
     * Gets the user
     * @return the user for this role
     */
    public User getUser() {
        return this.user;
    }

    /**
     * Sets the user
     * @param user the user for this role
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