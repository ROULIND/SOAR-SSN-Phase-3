package com.mycompany.ssn.v1.Models; 

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;

@Entity
@Table(name = "Likes")
@NamedQueries({
    @NamedQuery(name = "Likes.findAll", query = "SELECT l FROM Likes l"),
    @NamedQuery(name = "Likes.findByUsername", query = "SELECT l FROM Likes l WHERE l.user.userId = :userId")
})

public class Likes {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "like_id")
    private Integer likeId;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "post_id", referencedColumnName = "post_id")
    private Posts post;

    // Constructors
    public Likes() {
    }

    public Likes(Users user, Posts post) {
        this.user = user;
        this.post = post;
    }

    // Getters and Setters
    public Integer getLikeId() {
        return likeId;
    }

    public void setLikeId(Integer likeId) {
        this.likeId = likeId;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Posts getPost() {
        return post;
    }

    public void setPost(Posts post) {
        this.post = post;
    }
}
