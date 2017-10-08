package edu.matc.entity;

import javax.persistence.*;

/**
 * A class to represent a user role.
 *
 * @author lemerson
 */
@Entity
@Table(name = "user_roles")


public class UserRole implements java.io.Serializable {

    private String userName;
    private String roleName;
    private User user;

    /**
     * Instantiates a new User.
     */
    public UserRole() {
    }

    /**
     * Instantiates a new User.
     *
     * @param userName the first name

     */
    public UserRole(String userName, String roleName) {
        this.userName = userName;
        this.roleName = roleName;
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

    /**CREATE TABLE `user_roles` (  `user_name` varchar(15) NOT NULL,`role_name` varchar(15) NOT NULL,PRIMARY KEY (`user_name`,`role_name`),CONSTRAINT `user_roles_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

     * Sets user name.
     * @param userName the user name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets role name.
     * @return the role name
     */
    @Id
    @Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    /**
     * Sets role name.
     * @param roleName the role name
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_name", nullable = false)
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    /**
     * Return a string describing the object.
     * @return the combined string to help identify the specific user object.
     */
    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", roleName='" + roleName + '\'' +
                '}';
    }

}