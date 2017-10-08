package edu.matc.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
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

    private String userName;
    private String password;
    private String emailAddress;
    private String firstName;
    private String lastName;
    private Set<UserRole> roles = new HashSet<UserRole>(0);

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
    @Column(name = "first_name")
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
    @Column(name = "last_name")
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
    @Id
    @Column(name = "user_name")
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
    @Column(name = "user_pass")
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
    @Column(name = "email_addr")
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

    @OneToMany(mappedBy = "user")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    public Set<UserRole> getUserRoles() {
        return this.roles;
    }

    public void setUserRoles(Set<UserRole> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }

}