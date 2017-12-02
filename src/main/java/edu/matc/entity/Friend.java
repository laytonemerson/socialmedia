package edu.matc.entity;

import javax.persistence.*;

/**
 * A class to represent a friend.
 *
 * @author lemerson
 */
@Entity
@Table(name = "user_friends")
public class Friend implements java.io.Serializable {

    @Id
    @Column(name = "friend_user_name")
    private String friendUserName;

    @Id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_name", referencedColumnName = "user_name", nullable = false)
    private User user;

    /**
     * Instantiates a new Friend.
     */
    public Friend() {
    }

    /**
     * Instantiates a new friend
     * @param friendUserName the username of the friend.
     */
    public Friend(String friendUserName) {
        this.friendUserName = friendUserName;
    }

    /**
     * Gets friendUserName.
     * @return the friend user name
     */
    public String getFriendUserName() {
        return friendUserName;
    }

    /**
     * Sets friendUserName
     * @param friendUserName the role name
     */
    public void setFriendUserName(String friendUserName) {
        this.friendUserName = friendUserName;
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
     * @return the combined string to help identify the specific friend object.
     */
    @Override
    public String toString() {
        return "Friend {" +
                "friendUserName='" + friendUserName + '\'' +
                '}';
    }

    /**
     * Return true if a Friend object matches.
     * @return the boolean result of the Friend Match.
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Friend friend = (Friend) o;

        if (!friendUserName.equals(friend.friendUserName)) return false;
        return friendUserName.equals(friend.friendUserName);
    }

    /**
     * Used in tandem with the overriden equals method.
     * @return unique value for object.
     */
    @Override
    public int hashCode() {
        return friendUserName.hashCode();
    }

}