package com.mycompany.ssn.beans;
import com.mycompany.ssn.beans.LoginBean;
import com.mycompany.ssn.beans.UserBean;
import com.mycompany.ssn.v1.Models.Posts;
import com.mycompany.ssn.v1.Models.Users;
import com.mycompany.ssn.v1.exceptions.DoesNotExistException;
import com.mycompany.ssn.v1.exceptions.InvalidContentException;
import com.mycompany.ssn.v1.exceptions.UnauthorizedActionException;
import com.mycompany.ssn.v1.exceptions.UserNotLoggedInException;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author jonathanstefanov
 *
 * The PostBean class serves as a managed bean for handling posts in the system.
 * It is session-scoped and is responsible for managing the creation, retrieval,
 * and interaction with posts, including likes and comments.
 */
@Named(value = "postBean")
@SessionScoped
public class PostBean implements Serializable {
    // Fields representing user attributes and uploaded profile picture
    @PersistenceContext(unitName = "soar_PU")
    private EntityManager em;
    private String currentPostText = "";

    private Posts selectedPost;
    // List for storing publications
    private String errorMessage;


    
    protected Posts findPostById(String postId) throws DoesNotExistException {
        int intPostId = Integer.parseInt(postId);
        Query query = em.createNamedQuery("Posts.findByPostId", Posts.class);
        List<Posts> post = query.setParameter( "postId", intPostId).getResultList();
        if (!post.isEmpty()) { 
            return post.get(0);
        }
        throw new DoesNotExistException("The post with id : " + postId + ", does not exist.");
    }
    
    /**
     * Sets the current post text.
     *
     * @param currentPostText The new post text to be set.
     */
    public void setCurrentPostText(String currentPostText) {
        this.currentPostText = currentPostText;
    } 
    
    /**
     * Gets the current post text.
     *
     * @return String The current post text.
     */
    public String getCurrentPostText() {
        return currentPostText;
    }
    
    /**
     * Retrieves posts made by a specific user.
     *
     * @param user The user whose posts are to be retrieved.
     * @return ArrayList<Posts> The list of posts made by the user, reversed.
     */
    public static ArrayList<Posts> getPostsByUser(Users user) {
        // Create a new ArrayList from the collection
        ArrayList<Posts> postsByUser = new ArrayList<>(user.getPostsCollection1());

        // Reverse the new list
        Collections.reverse(postsByUser);
        return postsByUser;
    }

/**
     * Redirects to the page for creating a new post.
     *
     * @return String The navigation outcome.
     */
    public String goToCreatePostPage() {
        return "/PostPage/CreatePostPage.xhtml?faces-redirect=true";
    }
/**
     * Creates a new post and adds it to the list of posts.
     *
     * @param user The user creating the post.
     * @return String The navigation outcome.
     */
    @Transactional
    public String createPost(Users user) {
        String text = this.currentPostText;

        try {
            // Check if user is logged in
            if (user == null) {
                throw new UserNotLoggedInException("User must be logged in to create a post.");
            }

            // Check the validity of publication content
            if (text == null || text.isEmpty() || text.length() > 256) {
                throw new InvalidContentException("Invalid post content. Post must be 1-256 characters long.");
            }

            //Line break after 150 characters
            text = text.replaceAll("(.{150})", "$1\n");

            // Create a new publication and add it to the list of publications
            Posts newPost = new Posts();
            newPost.setText(this.currentPostText);
            newPost.setUsers(user);
            newPost.setDatePublished(new Date()); // Set the current date and time manually
            em.persist(newPost);


            user.getPostsCollection().add(newPost);
            em.merge(user);
            

            this.currentPostText = "";
            this.errorMessage = null;  // Reset error message on success

            return "/UserPage/UserMainPage.xhtml?faces-redirect=true";
        } catch (UserNotLoggedInException | InvalidContentException e) {
            this.errorMessage = e.getMessage();
            return null;  // Navigation fails on error
    }
}
/**
     * Gets the error message related to post creation failures.
     *
     * @return String The error message.
     */    
     public String getErrorMessage() {
        return errorMessage;
    }
     
/**
     * Retrieves the list of posts, reversed.
     *
     * @return List<Posts> The reversed list of posts.
     */
public ArrayList<Posts> getPosts() {
    Query query = em.createNamedQuery("Posts.findAll");
    List<Posts> postList = new ArrayList<>(query.getResultList());

    // Reverse the new list
    Collections.reverse(postList);

    return new ArrayList<>(postList); // Return a copy to avoid unintended modifications
}

/**
     * Toggles the like status for a post by a user.
     *
     * @param user The user performing the like/unlike action.
     * @param post The post to like/unlike.
     * @throws DoesNotExistException If the post or user does not exist.
     */
    @Transactional
    public void toggleLike(Users user, Posts post) throws DoesNotExistException {
        if(postIsLikedByUser(user, post)){
            removeLike(user, post);
        } else {
            addLike(user, post);
        }
    }

/**
     * Adds a like to the specified post by the given user.
     *
     * @param user The user adding the like.
     * @param post The post to which the like is added.
     * @throws DoesNotExistException If the post or user does not exist.
     */
    public void addLike(Users user, Posts post) throws DoesNotExistException {
        if (post == null) {
            throw new DoesNotExistException("Post does not exist.");
        }
        if (user == null) {
            throw new DoesNotExistException("User does not exist.");
        }

        // Adds a like to the post
        post.getUsersCollection().add(user);
        em.merge(post);

    }

/**
     * Removes a like from the specified post by the given user.
     *
     * @param user The user removing the like.
     * @param post The post from which the like is removed.
     * @throws DoesNotExistException If the post or user does not exist.
     */
    public void removeLike(Users user, Posts post) throws DoesNotExistException {
        if (post == null) {
            throw new DoesNotExistException("Post does not exist.");
        }
        if (user == null) {
            throw new DoesNotExistException("User does not exist.");
        }

        // Removes a like from the post
        post.getUsersCollection().remove(user);
        em.merge(post);
    }

/**
     * Checks if a post is liked by a specific user.
     *
     * @param user The user whose like status is checked.
     * @param post The post to check for likes.
     * @return Boolean True if the post is liked by the user, false otherwise.
     * @throws DoesNotExistException If the post or user does not exist.
     */
    public boolean postIsLikedByUser(Users user, Posts post) throws DoesNotExistException {
        if (post == null) {
            throw new DoesNotExistException("Post does not exist.");
        }
        if (user == null) {
            throw new DoesNotExistException("User does not exist.");
        }

        return post.getUsersCollection().contains(user);

    }

    /**
     * Displays the details of all posts as a string.
     *
     * @return String A concatenated string of post details.
     */
    public String displayPosts() {
        String strDisplay = "";
        for(Posts post : getPosts()){
            strDisplay = strDisplay + post.toString();
        }
        return strDisplay;
    }
/**
     * Gets the currently selected post.
     *
     * @return Post The currently selected post.
     */
    public Posts getSelectedPost() {
        return selectedPost;
    }
/**
     * Sets the selected post based on its ID and navigates to the post page.
     *
     * @param postId The ID of the post to set as selected.
     * @return String The navigation outcome.
     * @throws com.mycompany.ssn.v1.exceptions.DoesNotExistException
     */
    public String setSelectedPost(int postId) throws DoesNotExistException {        
        this.selectedPost = findPostById(String.valueOf(postId));
        return "/PostPage/PostPage.xhtml?faces-redirect=true";

    }



}