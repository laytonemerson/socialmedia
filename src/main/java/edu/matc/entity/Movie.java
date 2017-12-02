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
     * Instantiates a new Movie
     * @param movieId the ID of the movie
     * @param movieDate the release date of the movie
     * @param moviePlot the plot of the movie
     * @param movieTitle the title of the movie
     * @param moviePoster the poster url for the movie
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
     * @return movieId the ID of the movie
     */
    public Integer getMovieId() {
        return movieId;
    }

    /**
     * Sets movieId
     * @param movieId the ID of the movie
     */
    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    /**
     * Gets movieTitle
     * @return movieTitle the title of the movie
     */
    public String getMovieTitle() {
        return movieTitle;
    }

    /**
     * Sets movieTitle
     * @param movieTitle the title of the movie
     */
    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    /**
     * Gets moviePlot
     * @return moviePlot the plot of the movie
     */
    public String getmoviePlot() {
        return moviePlot;
    }

    /**
     * Sets moviePlot
     * @param moviePlot the plot of the movie
     */
    public void setmoviePlot(String moviePlot) {
        this.moviePlot = moviePlot;
    }

    /**
     * Gets movieDate
     * @return movieDate the release date of the movie
     */
    public String getmovieDate() {
        return movieDate;
    }

    /**
     * Sets movieDate
     * @param movieDate the release date of the movie
     */
    public void setmovieDate(String movieDate) {
        this.movieDate = movieDate;
    }

    /**
     * Gets moviePoster
     * @return moviePoster the movie poster url
     */
    public String getmoviePoster() {
        return moviePoster;
    }

    /**
     * Sets moviePoster
     * @param moviePoster the movie poster url
     */
    public void setmoviePoster(String moviePoster) {
        this.moviePoster = moviePoster;
    }

    /**
     * Gets the user
     * @return the user for this movie
     */
    public User getUser() {
        return this.user;
    }

    /**
     * Sets the user
     * @param user the user for this movie
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Return a string describing the object.
     * @return the combined string to help identify the specific movie object.
     */
    @Override
    public String toString() {
        return "Movie {" +
                "movieId='" + movieId + '\'' +
                ", movieDate='" + movieDate + '\'' +
                ", moviePlot='" + moviePlot + '\'' +
                ", movieTitle='" + movieTitle + '\'' +
                ", moviePoster='" + moviePoster + '\'' +
                '}';
    }

    /**
     * Return true if a Movie object matches.
     * @return the boolean result of the Movie Match.
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Movie movie = (Movie) o;
        if (!movieDate.equals(movie.movieDate)) return false;
        if (!moviePlot.equals(movie.moviePlot)) return false;
        if (!movieTitle.equals(movie.movieTitle)) return false;
        if (!moviePoster.equals(movie.moviePoster)) return false;
        return movieId.equals(movie.movieId);
    }

    /**
     * Used in tandem with the overriden equals method.
     * @return unique value for object.
     */
    @Override
    public int hashCode() {
        int result = movieId.hashCode();
        result = 31 * result + movieDate.hashCode();
        result = 31 * result + moviePlot.hashCode();
        result = 31 * result + movieTitle.hashCode();
        result = 31 * result + moviePoster.hashCode();
        return result;
    }

}