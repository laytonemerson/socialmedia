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


    @Id
    @Column(name = "role_name")
    private String roleName;

    @Id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_name", referencedColumnName = "user_name", nullable = false)
    private User user;

    /**
     * Instantiates a new User.
     */
    public UserRole() {
    }

    /**
     * Instantiates a new User Role
     * @param roleName the role being created
     */
    public UserRole(String roleName) {
        this.roleName = roleName;
    }

    /**
     * Gets role name.
     * @return the role name
     */
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
        return "User{" +
                ", roleName='" + roleName + '\'' +
                '}';
    }

}