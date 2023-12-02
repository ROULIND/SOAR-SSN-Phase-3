/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ssn.v1.database;

import java.util.ArrayList;
import com.mycompany.ssn.v1.Models.XUserOLD;
import com.mycompany.ssn.v1.Models.XPostOLD;
import com.mycompany.ssn.v1.Models.XCommentOLD;
import com.mycompany.ssn.v1.controllers.UserController;

import java.util.Date;
import java.util.concurrent.TimeUnit;
/**
 *
 * @author dimitriroulin
 */
public class MockDatabase {
    
    private static ArrayList<XUserOLD> users = new ArrayList<XUserOLD>() {
        {
            add(new XUserOLD(1,"amart", "Alice", "Martin", "alice.martin@email.com", "1234", "Denizkun-PP.jpeg"));
            add(new XUserOLD(2,"bsmit", "Bob", "Smith", "bob.smith@email.com", "1234", "Abstract-PP.jpg"));
            add(new XUserOLD(3,"cbrow", "Charlie", "Brown", "charlie.brown@email.com", "1234", "Gretz-PP.jpeg"));
            add(new XUserOLD(4,"djohn", "David", "Johnson", "david.johnson@email.com", "1234", "Sierro-PP.jpeg"));
        }
    };
    
    private static ArrayList<XPostOLD> posts = new ArrayList<XPostOLD>() {
        {
            add(new XPostOLD(1, 1, "Hello world! This is my first post on SSN.", subtractDays(new Date(), 10)));
            add(new XPostOLD(2, 2, "Just joined SSN! Looking forward to connecting with everyone.", subtractDays(new Date(), 7)));
            add(new XPostOLD(3, 3, "Does anyone have book recommendations?", subtractDays(new Date(), 5)));
            add(new XPostOLD(4, 4, "Happy to be here!", subtractDays(new Date(), 2)));
        }
    };

    private static ArrayList<XCommentOLD> comments = new ArrayList<XCommentOLD>() {
        {
            add(new XCommentOLD(1, 1, "Welcome to SSN, Alice!"));
            add(new XCommentOLD(2, 2,  "Welcome, Bob!"));
            add(new XCommentOLD(3, 3,  "I recommend 'The Great Gatsby'."));
            add(new XCommentOLD(4, 3, "How about 'To Kill a Mockingbird'?"));
            add(new XCommentOLD(5, 4, "My looove for the rose"));
        }
    };
    
     // Helper method to subtract days from the current date
    private static Date subtractDays(Date date, int days) {
        long millis = date.getTime();
        long subtractedMillis = TimeUnit.DAYS.toMillis(days);
        return new Date(millis - subtractedMillis);
    }
    
    
    /* Add a user to the list of existing users in the mock database */
    public static void addAUser(XUserOLD user) {
        users.add(user);
    }
    
    /* Return the list of existing users in the mock database */
    public static ArrayList<XUserOLD> getUsers() {
        return users;
    }
    
    public static void addAPost(XPostOLD post) {
        posts.add(post);
    }
    
    public static ArrayList<XPostOLD> getPosts() {
        return posts;
    }
    
    public static ArrayList<XCommentOLD> getComments(){
        return comments;
    }
    
    public static void addAComment(XCommentOLD comment) {
        comments.add(comment);
    }
   
    
}
