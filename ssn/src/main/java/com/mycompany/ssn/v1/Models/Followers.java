package com.mycompany.ssn.v1.Models; 

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
@Table(name = "Followers")
@NamedQueries({
    @NamedQuery(name = "Followers.findAll", query = "SELECT f FROM Followers f"),
    @NamedQuery(name = "Followers.findByFollowerUsername", query = "SELECT f FROM Followers f WHERE f.follower.username = :username"),
    @NamedQuery(name = "Followers.findByFollowedUsername", query = "SELECT f FROM Followers f WHERE f.followedUser.username = :username")
})
public class Followers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer followerId;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private Users follower;

    @ManyToOne
    @JoinColumn(name = "followed_user_id", referencedColumnName = "user_id")
    private Users followedUser;

    // Constructors
    public Followers() {
    }

    public Followers(Users follower, Users followedUser) {
        this.follower = follower;
        this.followedUser = followedUser;
    }

    // Getters and Setters
    public Integer getFollowerId() {
        return followerId;
    }

    public void setFollowerId(Integer followerId) {
        this.followerId = followerId;
    }

    public Users getFollower() {
        return follower;
    }

    public void setFollower(Users follower) {
        this.follower = follower;
    }

    public Users getFollowedUser() {
        return followedUser;
    }

    public void setFollowedUser(Users followedUser) {
        this.followedUser = followedUser;
    }
}
