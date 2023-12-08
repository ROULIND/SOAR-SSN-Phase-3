package com.mycompany.ssn.beans;

import com.mycompany.ssn.v1.Models.Users;
import com.mycompany.ssn.v1.exceptions.AlreadyExistsException;
import com.mycompany.ssn.v1.exceptions.DoesNotExistException;
import com.mycompany.ssn.v1.exceptions.UnauthorizedActionException;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.http.Part;
import jakarta.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.primefaces.shaded.commons.io.FilenameUtils;

/**
 *
 * @author dimitriroulin
 *
 * Bean class representing user-related operations and interactions.
 *
 * This class is annotated as a named session-scoped bean, making it suitable
 * for handling user-related actions and data throughout a user's session.
 */
@Named(value = "userBean")
@SessionScoped
public class UserBean implements Serializable {
    // Fields representing user attributes and uploaded profile picture
    @PersistenceContext(unitName = "soar_PU")
    private EntityManager em;
    
    private String username = "";
    private String firstName = "";
    private String lastName = "";
    private String email = "";
    private String password = "";
    private Part uploadedFile; // Represents the uploaded file
    private String profilePicture = "Default-PP.jpeg";
    private Users selectedUser;


/**
     * Sets the selected user for further interactions.
     *
     * @param user The user to set as selected.
     */    
    public void setSelectedUser(Users user) {
        this.selectedUser = user;
    }
/**
     * Gets the currently selected user.
     *
     * @return User The currently selected user.
     */
    public Users getSelectedUser() {
        return selectedUser;
    }
/**
     * Navigates to the user's profile page.
     *
     * @param user The user whose profile page is being accessed.
     * @return String The navigation outcome.
     */
    public String goToProfilePage(Users user) {
        this.selectedUser = user;
        return "/ProfilePage/ProfilePage.xhtml?faces-redirect=true";
    }
/**
     * Navigates to the user's information page.
     *
     * @param user The user whose information page is being accessed.
     * @return String The navigation outcome.
     */    
    public String goToInfoPage(Users user) {
        this.username = user.getUsername();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.email = user.getEmail();
        this.profilePicture = user.getPictureProfile();
        return "/UserPage/UserInfoPage.xhtml?faces-redirect=true";
    }
    
/**
     * Creates a new user and adds it to the MockDatabase.
     * Displays appropriate messages based on success or failure.
     */  
    @Transactional
    public void createAUser() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        try {
            if (!emailExists() && !usernameExists()) {
                Users newUser = new Users();
                newUser.setUsername(username);
                newUser.setFirstName(firstName);
                newUser.setLastName(lastName);
                newUser.setEmail(email);
                newUser.setPassword(password.hashCode());
                newUser.setPictureProfile("Default-PP.jpeg");
                em.persist(newUser); // The container manages the transaction boundaries

                facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "User created successfully!", null));
            }
        } catch (AlreadyExistsException | DoesNotExistException ex) {
            facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, ex.getMessage(), null));
            System.out.println(ex.getMessage());
        } 
        facesContext.getExternalContext().getFlash().setKeepMessages(true);
    }

    public String getUserPictureProfile(Users user) {
        String imagePath = user.getPictureProfile();

        // Check if the image exists in the resources
        // Note: This assumes that the 'images' directory is in the web-accessible resources folder
        // Adjust the path according to your project structure
        String imageUrl = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/images/" + imagePath);
        System.out.println(imageUrl);
        if (imageUrl != null) {
            // Image exists
            return imagePath;
        } else {
            // Image does not exist, return default image path
            return "Abstract-PP.jpg";
        }
    }


/**
     * Deletes a user, removing associated posts, likes, and comments.
     *
     * @return String The navigation outcome.
     */    
    /*public String deleteAUser() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        
        try {
            Query query = em.createNamedQuery("Users.findByUsername");
            List<Users> users = query.setParameter("username", this.username).getResultList();
            Users userToDelete = users.get(0);
            if (userToDelete != null) {
                
                // Remove the user's posts
               userToDelete.getPostsCollection().empty();
                      
                
                // Remove the user from the users list
                MockDatabase.getUsers().remove(userToDelete);

                // Remove the user from other users' followers and following lists
                for (Users user : MockDatabase.getUsers()) {
                    user.getFollowers().remove(userToDelete);
                    user.getFollowing().remove(userToDelete);
                }

                // Iterate through all posts and remove likes associated with the user
                for (PostOLD post : MockDatabase.getPosts()) {
                    // Remove the user's ID from the post's likes
                    post.getLikes().removeIf(likeUserId -> likeUserId == userToDelete.getId());
                    post.getComments().removeIf(comment -> comment.getUserId() == userToDelete.getId());
                }

                
                // Remove the user's posts and comments
                MockDatabase.getPosts().removeIf(post -> post.getUserId() == userToDelete.getId());
                MockDatabase.getComments().removeIf(comment -> comment.getUserId() == userToDelete.getId());
                
                facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Account successfully deleted.", null));
                // Additional cleanup (e.g., session invalidation) goes here
                
                return "/MainPage/MainPage.xhtml?faces-redirect=true";
            } else {
                facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "User not found.", null));
            }
        } catch (DoesNotExistException e) {
            facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), null));
        }
        return null;
    }*/

/**
     * Modifies user information and updates the MockDatabase.
     *
     * @param targettedUser The user to modify.
     */    
    @Transactional
    public void modifyAUser(Users targettedUser) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        // Check if the username or email is already taken by another user
        
        Query query = em.createNamedQuery("Users.findAll");
        List<Users> users = query.getResultList();
        
        try {
            for (Users user : users) {
                if (!Objects.equals(user.getUserId(), targettedUser.getUserId())) {
                    if (user.getUsername().equals(this.username)) {
                        throw new IllegalStateException("Username already used.");
                    }
                    if (user.getEmail().equals(this.email)) {
                        throw new IllegalStateException("Email already used.");
                    }
                }
            }
        } catch (IllegalStateException ex) {
            facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, ex.getMessage(), null));
            System.out.println(ex.getMessage());
            return;
        }
        
        targettedUser.setUsername(this.username);
        targettedUser.setFirstName(this.firstName);
        targettedUser.setLastName(this.lastName);
        targettedUser.setEmail(this.email);
        
        em.merge(targettedUser);
        // Do not update the password here for security reasons
        // If you need to update the password, ensure it's done securely
        facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Informations sucessfully modified !", null));

        
    }

    

    /**
    * Checks if an email already exists in the MockDatabase.
    *
    * @return boolean True if the email exists, throws AlreadyExistsException otherwise.
    * @throws AlreadyExistsException If the email already exists.
    */
    private boolean emailExists() throws AlreadyExistsException {
        Query query = em.createNamedQuery("Users.findByEmail");
        List<Users> users = query.setParameter("email", email).getResultList();
        return !users.isEmpty();
    }

    
    /**
     * Checks if a username already exists in the MockDatabase.
    *
    * @return boolean True if the username exists, throws AlreadyExistsException otherwise.
    * @throws AlreadyExistsException If the username already exists.
    */
    private boolean usernameExists() throws DoesNotExistException {
        Query query = em.createNamedQuery("Users.findByUsername");
        List<Users> users = query.setParameter("username", username).getResultList();
        return !users.isEmpty();
    }
    




/**
 * Gets the email of the user.
 *
 * @return String The email of the user.
 */
    public String getEmail() {
        return email;
    }
    
/**
 * Gets the first name of the user.
 *
 * @return String The first name of the user.
 */
    public String getFirstName() {
        return firstName;
    }
    
/**
 * Gets the last name of the user.
 *
 * @return String The last name of the user.
 */
    public String getLastName() {
        return lastName;
    }
    
/**
 * Gets the password of the user.
 *
 * @return String The password of the user.
 */
    public String getPassword() {
        return password;
    }
    
/**
 * Gets the username of the user.
 *
 * @return String The username of the user.
 */
    public String getUsername() {
        return username;
    }
    
/**
 * Gets the profile picture path of the user.
 *
 * @return String The profile picture path of the user.
 */    
    public String getProfilePicture() {
        return profilePicture;
    }
    
/**
 * Sets the username of the user.
 *
 * @param username The new username to set.
 */    
    public void setUsername(String username) {
        this.username = username;
    }
    
/**
 * Sets the email of the user.
 *
 * @param email The new email to set.
 */    
    public void setEmail(String email) {
        this.email = email;
    }
    
/**
 * Sets the first name of the user.
 *
 * @param firstName The new first name to set.
 */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

/**
 * Sets the last name of the user.
 *
 * @param lastName The new last name to set.
 */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

/**
 * Sets the password of the user.
 *
 * @param password The new password to set.
 */
    public void setPassword(String password) {
        this.password = password;
    }

/**
 * Sets the profile picture path of the user.
 *
 * @param profilePicture The new profile picture path to set.
 */
    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

/**
 * Gets the uploaded file representing the user's profile picture.
 *
 * @return Part The uploaded file.
 */
    public Part getUploadedFile() {
        return uploadedFile;
    }

/**
 * Sets the uploaded file representing the user's profile picture.
 *
 * @param uploadedFile The new uploaded file to set.
 */
    public void setUploadedFile(Part uploadedFile) {
        this.uploadedFile = uploadedFile;
    }

/**
 * Allows the current user to follow another user.
 *
 * @param user The current user.
 * @param userToFollow The user to follow.
 * @throws UnauthorizedActionException If the action is not authorized.
 */
    public void followUser(Users user, Users userToFollow) throws UnauthorizedActionException {
        if (user.getUsersCollection1().contains(userToFollow)) {
            return;
        }

        // Adds a like to the post
        userToFollow.getUsersCollection().add(user);
        user.getUsersCollection1().add(userToFollow);
        em.merge(userToFollow);
        em.merge(user);


    }
    
/**
 * Allows the current user to unfollow another user.
 *
 * @param user The current user.
 * @param userToUnfollow The user to unfollow.
 */
    public void unfollowUser(Users user, Users userToUnfollow){
        if ((!userToUnfollow.getUsersCollection().contains(user)) && !(user.getUsersCollection1().contains(userToUnfollow))) {
            return;
        }
        // Adds a like to the post
        userToUnfollow.getUsersCollection().remove(user);
        user.getUsersCollection1().remove(userToUnfollow);
        em.merge(userToUnfollow);
        em.merge(user);
        
    }
    
    /**
     * Toggles the follow status of the current user for another user.
     *
     * @param user The
     * @param userTargetted The user to toggle follow status.
     * @throws UnauthorizedActionException If the action is not authorized.
     */    
    @Transactional
    public void toggleFollow(Users user, Users userTargetted) throws UnauthorizedActionException{
        if ((userTargetted.getUsersCollection().contains(user)) && (user.getUsersCollection1().contains(userTargetted))) {
            unfollowUser(user, userTargetted);
        } else {
            followUser(user, userTargetted);
        }
        
    }


/**
 * Checks if the current user is following another user.
 *
 * @param user The current user.
 * @param userToCheck The user to check if the current user is following.
 * @return boolean True if the current user is following, false otherwise.
 */    
    public boolean checkIfFollowing(Users user, Users userToCheck) {
             
        if ((userToCheck.getUsersCollection().contains(user)) && (user.getUsersCollection1().contains(userToCheck))) {
            return true;
        } else {
            return false;
        }
    }


    
}
