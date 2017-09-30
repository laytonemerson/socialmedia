package edu.matc.entity;

import javax.persistence.*;

/**
 * A class to represent a user.
 *
 * @author lemerson
 */
@Entity
@Table(name = "users")

public class User {

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
    public User(String userName, String password, String emailAddress, String firstName, String lastName) {
        this.userName = userName;
        this.password = password;
        this.emailAddress = emailAddress;
        this.firstName = firstName;
        this.lastName = lastName;
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
     * Return a string describing the object.
     * @return the combined string to help identify the specific user object.
     */
    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }

}