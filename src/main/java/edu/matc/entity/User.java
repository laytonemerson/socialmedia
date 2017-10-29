package edu.matc.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

/**
 * A class to represent a user.
 *
 * @author lemerson
 */
@Entity
@Table(name = "users")
public class User implements java.io.Serializable {

    @Id
    @Column(name = "user_name")
    private String userName;

    @Column(name = "user_pass")
    private String password;

    @Column(name = "email_addr")
    private String emailAddress;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "user_picture")
    private String userPicture;

    @Column(name = "user_bio")
    private String userBio;

    @Column(name = "user_movies")
    private Integer movieCount;

    @OneToMany(mappedBy = "user")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    private Set<UserRole> roles = new HashSet<UserRole>(0);

    @OneToMany(mappedBy = "user", orphanRemoval=true)
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    private Set<Movie> movies = new HashSet<Movie>(0);

    @OneToMany(mappedBy = "user", orphanRemoval=true)
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    private Set<Friend> friends = new HashSet<Friend>(0);

    /**
     * Instantiates a new User.
     */
    public User() {
    }

    /**
     * Instantiates a new User.
     *
     * @param userName the first name
     * @param password the password
     * @param emailAddress the email address
     * @param firstName the first name
     * @param lastName  the last name
     */
    public User(String userName, String password, String emailAddress, String firstName, String lastName,
                String userPicture, String userBio, Integer movieCount) {
        this.userName = userName;
        this.password = password;
        this.emailAddress = emailAddress;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userPicture = userPicture;
        this.userBio = userBio;
        this.movieCount = movieCount;
    }

    /**
     * Gets first name.
     * @return the first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets first name.
     * @param firstName the first name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets last name.
     * @return the last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets last name.
     * @param lastName the last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets user name.
     * @return the user name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets user name.
     * @param userName the user name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets password.
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets password
     * @param password the password for the user
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets email address
     * @return the email address
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * Sets email address
     * @param emailAddress the email address of the user
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * Gets user picture url
     * @return the user picture url
     */
    public String getUserPicture() {
        return userPicture;
    }

    /**
     * Sets userpicture
     * @param userPicture the url picture address of the user
     */
    public void setUserPicture (String userPicture) {
        this.userPicture = userPicture;
    }

    /**
     * Gets user bio
     * @return the user bio
     */
    public String getUserBio() {
        return userBio;
    }

    /**
     * Sets userBio
     * @param userBio the bio of the user
     */
    public void setUserBio (String userBio) {
        this.userBio = userBio;
    }

    /**
     * Gets user movie count
     * @return the user movie count
     */
    public Integer getMovieCount() {
        return movieCount;
    }

    /**
     * Sets userMovieCount
     * @param movieCount the movie count of the user
     */
    public void setMovieCount (Integer movieCount) {
        this.movieCount = movieCount;
    }

    /**
     * Gets the set of roles for the user
     * @return roles the set of roles for the user
     */
    public Set<UserRole> getUserRoles() {
        return this.roles;
    }

    /**
     * Sets the set of roles for the user
     * @param roles the set of roles for the user
     */
    public void setUserRoles(Set<UserRole> roles) {
        this.roles = roles;
    }

    /**
     * Gets the list of movies for the user
     * @return movies the set of movies for the user
     */
    public Set<Movie> getUserMovies() {
        return this.movies;
    }

    /**
     * Sets the set of movies for the user
     * @param movies the set of movies for the user
     */
    public void setUserMovies(Set<Movie> movies) {
        this.movies = movies;
    }

    /**
     * Gets the list of friends for the user
     * @return the set of friends for the user
     */
    public Set<Friend> getUserFriends() {
        return this.friends;
    }

    /**
     * Sets the set of friends for the user
     * @param friends the set of friends for the user
     */
    public void setUserFriends(Set<Friend> friends) {
        this.friends = friends;
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (!userName.equals(userName)) return false;
        if (!firstName.equals(user.firstName)) return false;
        if (!lastName.equals(user.lastName)) return false;
        if (!emailAddress.equals(user.emailAddress)) return false;
        if (!password.equals(user.password)) return false;
        return userName.equals(user.userName);
    }

    @Override
    public int hashCode() {
        int result = firstName.hashCode();
        result = 31 * result + lastName.hashCode();
        result = 31 * result + userName.hashCode();
        result = 31 * result + emailAddress.hashCode();
        result = 31 * result + password.hashCode();
        result = 31 * result + userName.hashCode();
        return result;
    }

}