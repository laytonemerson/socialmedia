package edu.matc.entity;

import org.hibernate.annotations.GenericGenerator;

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
    @GeneratedValue(generator="increment")
    @GenericGenerator(name="increment", strategy = "increment")
    @Column(name = "user_role_id")
    private int user_role_id;

    @Column(name = "role_name")
    private String roleName;

    @ManyToOne(fetch = FetchType.LAZY)
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

    /**
     * Gets user role id.
     * @return the user role id
     */
    public int getUserRoleId() {
        return user_role_id;
    }

    /**
     * Sets user role id.
     * @param user_role_id the user role id
     */
    public void setUserId(int user_role_id) {
        this.user_role_id = user_role_id;
    }


    @Override
    public String toString() {
        return "User{" +
                ", roleName='" + roleName + '\'' +
                '}';
    }

}