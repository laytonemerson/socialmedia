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
public class Response {

	@JsonProperty("page")
	private int page;

	@JsonProperty("total_pages")
	private int totalPages;

	@JsonProperty("results")
	private List<ResultsItem> results;

	@JsonProperty("total_results")
	private int totalResults;

	/**
	 * Sets the page instance variable
	 * @param page
	 */
	public void setPage(int page){
		this.page = page;
	}

	/**
	 * Gets the page instance variable
	 * @return page instance variable
	 */
	public int getPage(){
		return page;
	}

	/**
	 * Sets the totalPages instance variable
	 * @param totalPages
	 */
	public void setTotalPages(int totalPages){
		this.totalPages = totalPages;
	}

	/**
	 * Gets the totalPages instance variable
	 * @return totalPages instance variable
	 */
	public int getTotalPages(){
		return totalPages;
	}

	/**
	 * Sets the results instance variable
	 * @param results
	 */
	public void setResults(List<ResultsItem> results){
		this.results = results;
	}

	/**
	 * Gets the results instance variable
	 * @return results instance variable
	 */
	public List<ResultsItem> getResults(){
		return results;
	}

	/**
	 * Sets the totalResults instance variable
	 * @param totalResults
	 */
	public void setTotalResults(int totalResults){
		this.totalResults = totalResults;
	}

	/**
	 * Gets the totalResults instance variable
	 * @return totalResults instance variable
	 */
	public int getTotalResults(){
		return totalResults;
	}

	/**
	 * Return a string describing the object.
	 * @return the combined string to help identify the specific Response object.
	 */
	@Override
 	public String toString(){
		return 
			"Response {" +
			" page = '" + page + '\'' +
			",total_pages = '" + totalPages + '\'' + 
			",results = '" + results + '\'' + 
			",total_results = '" + totalResults + '\'' + 
			"}";
		}
}