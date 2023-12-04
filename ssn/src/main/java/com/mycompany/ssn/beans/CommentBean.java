package com.mycompany.ssn.beans;

import com.mycompany.ssn.v1.Models.*;
import com.mycompany.ssn.beans.LoginBean;
import com.mycompany.ssn.beans.UserBean;
import com.mycompany.ssn.v1.exceptions.DoesNotExistException;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.io.Serializable;

/**
 *
 * @author jonathanstefanov
 */
@Named(value = "commentBean")
@SessionScoped
public class CommentBean implements Serializable {
    @PersistenceContext(unitName = "soar_PU")
    private EntityManager em;

    private String currentCommentText = "";
    
/**
     * Sets the current comment text.
     *
     * @param currentCommentText The new comment text to be set.
     */


    public void setCurrentCommentText(String currentCommentText) {
        this.currentCommentText = currentCommentText;
        //Line break after 180 characters
        this.currentCommentText = currentCommentText.replaceAll("(.{180})", "$1\n");
    }
/**
     * Gets the current comment text.
     *
     * @return String The current comment text.
     */
    
    public String getCurrentCommentText() {
        return currentCommentText;
    }
/**
     * Creates and adds a new comment to the specified post by the given user.
     *
     * @param user The user making the comment.
     * @param post The post to which the comment is added.
     * @throws IllegalArgumentException If the user, post, or comment text is invalid.
     */

    @Transactional
    public void makeComment(Users user, Posts post) throws IllegalArgumentException {
        // Verify if the user exists
        if (user == null) {
            throw new IllegalArgumentException("Invalid user.");
        }

        // Verify if the post exists
        if (post == null) {
            throw new IllegalArgumentException("Invalid post.");
        }

        // Validate the comment text
        if (this.currentCommentText == null) {
            throw new IllegalArgumentException("Comment text cannot be empty.");
        }
        //Verify the lengh of the comment text
        if (this.currentCommentText == null || this.currentCommentText.length() > 256 || this.currentCommentText.length() == 0) {
            // Faces launch an error message
            FacesContext facesContext = FacesContext.getCurrentInstance();

            facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Comment must be between 1 and 256 characters long", null));
        }
        else{
            Comments comment = new Comments();
            comment.setText(this.currentCommentText);
            comment.setUsers(user);

            em.persist(comment);

            // Add the comment to the post
            post.getCommentsCollection().add(comment);
            em.merge(post);
            this.currentCommentText = ""; // reset the comment handler
        }

    }


}