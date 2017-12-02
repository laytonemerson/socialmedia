package org.themoviedb;

import com.fasterxml.jackson.annotation.JsonProperty;
import javax.annotation.Generated;
import java.util.List;

/**
 * An automated class created by robopojogenerator to hold the results from TMBD.ORG
 *
 * @author robopojo
 */
@Generated("com.robohorse.robopojogenerator")
public class ResultsItem {

	@JsonProperty("overview")
	private String overview;

	@JsonProperty("original_language")
	private String originalLanguage;

	@JsonProperty("original_title")
	private String originalTitle;

	@JsonProperty("video")
	private boolean video;

	@JsonProperty("title")
	private String title;

	@JsonProperty("genre_ids")
	private List<Integer> genreIds;

	@JsonProperty("poster_path")
	private String posterPath;

	@JsonProperty("backdrop_path")
	private String backdropPath;

	@JsonProperty("release_date")
	private String releaseDate;

	@JsonProperty("vote_average")
	private double voteAverage;

	@JsonProperty("popularity")
	private double popularity;

	@JsonProperty("id")
	private int id;

	@JsonProperty("adult")
	private boolean adult;

	@JsonProperty("vote_count")
	private int voteCount;

	@JsonProperty("user_has")
	private boolean userHas;

	/**
	 * Sets the overview instance variable
	 * @param overview
	 */
	public void setOverview(String overview){
		this.overview = overview;
	}

	/**
	 * Gets the overview instance variable
	 * @return overview instance variable
	 */
	public String getOverview(){
		return overview;
	}

	/**
	 * Sets the originalLanguage instance variable
	 * @param originalLanguage
	 */
	public void setOriginalLanguage(String originalLanguage){
		this.originalLanguage = originalLanguage;
	}

	/**
	 * Gets the originalLanguage instance variable
	 * @return originalLanguage instance variable
	 */
	public String getOriginalLanguage(){
		return originalLanguage;
	}

	/**
	 * Sets the originalTitle instance variable
	 * @param originalTitle
	 */
	public void setOriginalTitle(String originalTitle){
		this.originalTitle = originalTitle;
	}

	/**
	 * Gets the originalTitle instance variable
	 * @return originalTitle instance variable
	 */
	public String getOriginalTitle(){
		return originalTitle;
	}

	/**
	 * Sets the video instance variable
	 * @param video
	 */
	public void setVideo(boolean video){
		this.video = video;
	}

	/**
	 * Gets the video instance variable
	 * @return video instance variable
	 */
	public boolean isVideo(){
		return video;
	}

	/**
	 * Sets the title instance variable
	 * @param title
	 */
	public void setTitle(String title){
		this.title = title;
	}

	/**
	 * Gets the title instance variable
	 * @return title instance variable
	 */
	public String getTitle(){
		return title;
	}

	/**
	 * Sets the genreIds instance variable
	 * @param genreIds
	 */
	public void setGenreIds(List<Integer> genreIds){
		this.genreIds = genreIds;
	}

	/**
	 * Gets the genreIds instance variable
	 * @return genreIds instance variable
	 */
	public List<Integer> getGenreIds(){
		return genreIds;
	}

	/**
	 * Sets the posterPath instance variable
	 * @param posterPath
	 */
	public void setPosterPath(String posterPath){
		this.posterPath = posterPath;
	}

	/**
	 * Gets the posterPath instance variable
	 * @return posterPath instance variable
	 */
	public String getPosterPath(){
		return posterPath;
	}

	/**
	 * Sets the backdropPath instance variable
	 * @param backdropPath
	 */
	public void setBackdropPath(String backdropPath){
		this.backdropPath = backdropPath;
	}

	/**
	 * Gets the backdropPath instance variable
	 * @return backdropPath instance variable
	 */
	public String getBackdropPath(){
		return backdropPath;
	}

	/**
	 * Sets the releaseDate instance variable
	 * @param releaseDate
	 */
	public void setReleaseDate(String releaseDate){
		this.releaseDate = releaseDate;
	}

	/**
	 * Gets the releaseDate instance variable
	 * @return releaseDate instance variable
	 */
	public String getReleaseDate(){
		return releaseDate;
	}

	/**
	 * Sets the voteAverage instance variable
	 * @param voteAverage
	 */
	public void setVoteAverage(double voteAverage){
		this.voteAverage = voteAverage;
	}

	/**
	 * Gets the voteAverage instance variable
	 * @return voteAverage instance variable
	 */
	public double getVoteAverage(){
		return voteAverage;
	}

	/**
	 * Sets the popularity instance variable
	 * @param popularity
	 */
	public void setPopularity(double popularity){
		this.popularity = popularity;
	}

	/**
	 * Gets the popularity instance variable
	 * @return popularity instance variable
	 */
	public double getPopularity(){
		return popularity;
	}

	/**
	 * Sets the id instance variable
	 * @param id
	 */
	public void setId(int id){
		this.id = id;
	}

	/**
	 * Gets the id instance variable
	 * @return id instance variable
	 */
	public int getId(){
		return id;
	}

	/**
	 * Sets the adult instance variable
	 * @param adult
	 */
	public void setAdult(boolean adult){
		this.adult = adult;
	}

	/**
	 * Gets the adult instance variable
	 * @return adult instance variable
	 */
	public boolean isAdult(){
		return adult;
	}

	/**
	 * Sets the userHas instance variable
	 * @param userHas
	 */
	public void setUserHas(boolean userHas){
		this.userHas = userHas;
	}

	/**
	 * Gets the userHas instance variable
	 * @return userHas instance variable
	 */
	public boolean userHas(){
		return userHas;
	}

	/**
	 * Sets the voteCount instance variable
	 * @param voteCount
	 */
	public void setVoteCount(int voteCount){
		this.voteCount = voteCount;
	}

	/**
	 * Gets the voteCount instance variable
	 * @return voteCount instance variable
	 */
	public int getVoteCount(){
		return voteCount;
	}

	/**
	 * Return a string describing the object.
	 * @return the combined string to help identify the specific ResultsItem object.
	 */
	@Override
 	public String toString(){
		return 
			"ResultsItem {" +
			"overview = '" + overview + '\'' + 
			",original_language = '" + originalLanguage + '\'' + 
			",original_title = '" + originalTitle + '\'' + 
			",video = '" + video + '\'' + 
			",title = '" + title + '\'' + 
			",genre_ids = '" + genreIds + '\'' + 
			",poster_path = '" + posterPath + '\'' + 
			",backdrop_path = '" + backdropPath + '\'' + 
			",release_date = '" + releaseDate + '\'' + 
			",vote_average = '" + voteAverage + '\'' + 
			",popularity = '" + popularity + '\'' + 
			",id = '" + id + '\'' + 
			",adult = '" + adult + '\'' + 
			",vote_count = '" + voteCount + '\'' + 
			"}";
		}
}