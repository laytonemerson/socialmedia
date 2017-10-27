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

    @Column(name = "movie_title")
    private String movieTitle;

    @Column(name = "movie_date")
    private String movieDate;

    @Column(name = "movie_poster")
    private String moviePoster;

    @Column(name = "movie_plot")
    private String moviePlot;

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
     * @param movieDate
     * @param moviePlot
     * @param movieTitle
     * @param moviePoster
     */
    public Movie(Integer movieId, String movieDate, String moviePlot, String movieTitle, String moviePoster) {

        this.movieId = movieId;
        this.movieDate = movieDate;
        this.moviePlot = moviePlot;
        this.movieTitle = movieTitle;
        this.moviePoster = moviePoster;
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
     * Gets movieTitle
     * @return movieTitle
     */
    public String getMovieTitle() {
        return movieTitle;
    }

    /**
     * Sets movieTitle
     * @param movieTitle the
     */
    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    /**
     * Gets moviePlot
     * @return moviePlot
     */
    public String getmoviePlot() {
        return moviePlot;
    }

    /**
     * Sets moviePlot
     * @param moviePlot the
     */
    public void setmoviePlot(String moviePlot) {
        this.moviePlot = moviePlot;
    }

    /**
     * Gets movieDate
     * @return movieDate
     */
    public String getmovieDate() {
        return movieDate;
    }

    /**
     * Sets movieDate
     * @param movieDate the
     */
    public void setmovieDate(String movieDate) {
        this.movieDate = movieDate;
    }

    /**
     * Gets moviePoster
     * @return moviePoster
     */
    public String getmoviePoster() {
        return moviePoster;
    }

    /**
     * Sets moviePoster
     * @param moviePoster the
     */
    public void setmoviePoster(String moviePoster) {
        this.moviePoster = moviePoster;
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