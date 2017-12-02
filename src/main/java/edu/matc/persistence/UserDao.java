package edu.matc.persistence;

import edu.matc.entity.User;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.ArrayList;
import java.util.List;

/**
 * This is the UserDao Class. It's used for all C-R-U-D access to the user related database tables.
 *
 *@author lemerson
 */
public class UserDao {

    private final Logger log = Logger.getLogger(this.getClass());

    /** Return a list of all users
     *
     * @return All users
     * @exception HibernateException he - Any hibernate exception encountered during database access
     */
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            users = session.createCriteria(User.class).list();
        } catch (HibernateException he) {
            log.error("Error getting all users", he);
            throw he;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return users;
    }

    /**
     * Return a specific user given their user name
     *
     * @param userName the userName for the user
     * @return user the selected used from the database
     * @exception HibernateException he - Any hibernate exception encountered during database access
     */
    public User getUser(String userName) throws HibernateException {
        User user = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            user = (User) session.get(User.class, userName);
        } catch (HibernateException he) {
            log.error("Error getting user with userName: " + userName, he);
            throw he;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return user;
    }

    /**
     * Add a user to the database.
     *
     * @param user the user object to add to the database
     * @return the user name of the inserted record
     * @exception HibernateException he - Any hibernate exception encountered during database access
     */
    public String addUser(User user) throws HibernateException {
        String userName = null;
        Transaction transaction = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            userName = (String)session.save(user);
            transaction.commit();
        } catch (HibernateException he){
            if (transaction != null) {
                try {
                    log.error("Error saving user: " + userName, he);
                    transaction.rollback();
                    throw he;
                } catch (HibernateException he2) {
                    log.error("Error rolling back save of user: " + userName, he2);
                    throw he2;
                }
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return userName;
    }

    /**
     * Delete a user by userName
     *
     * @param userName the user's user name to be deleted
     * @exception HibernateException he - Any hibernate exception encountered during database access
     */
    public void deleteUser(String userName) throws HibernateException{

        User user = new User();
        user.setUserName(userName);

        Transaction transaction = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.delete(user);
            transaction.commit();
        } catch (HibernateException he){
            if (transaction != null) {
                try {
                    transaction.rollback();
                    throw he;
                } catch (HibernateException he2) {
                    log.error("Error rolling back delete of user name: " + userName, he2);
                    throw he2;
                }
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    /**
     * Update the given user
     *
     * @param user the user object to update
     * @exception HibernateException he - Any hibernate exception encountered during database access
     */
    public void updateUser(User user) throws HibernateException{
        Transaction transaction = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(user);
            transaction.commit();
        } catch (HibernateException he){
            if (transaction != null) {
                try {
                    transaction.rollback();
                    throw he;
                } catch (HibernateException he2) {
                    log.error("Error rolling back save of user: " + user, he2);
                    throw he2;
                }
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}