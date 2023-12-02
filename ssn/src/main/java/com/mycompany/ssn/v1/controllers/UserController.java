package com.mycompany.ssn.v1.controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import com.mycompany.ssn.v1.exceptions.UnauthorizedActionException;
import com.mycompany.ssn.v1.exceptions.InvalidContentException;
import com.mycompany.ssn.v1.exceptions.UserNotLoggedInException;
import com.mycompany.ssn.v1.exceptions.DoesNotExistException;
import com.mycompany.ssn.v1.exceptions.AlreadyExistsException;
import com.mycompany.ssn.v1.Models.XPostOLD;
import com.mycompany.ssn.v1.Models.XUserOLD;
import com.mycompany.ssn.v1.database.MockDatabase;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author dimitriroulin
 */
public class UserController {
    private static String username = "";
    private static String firstName = "";
    private static String lastName = "";
    private static String email = "";
    private static String password = "";
    
    
    public static void createAUser() {
        try {
            if (!emailExists() && !usernameExists()) {
                MockDatabase.addAUser(new XUserOLD(generateUniqueId(),username, firstName, lastName, email, password));
            }
        } catch (AlreadyExistsException | DoesNotExistException ex) {
            System.out.println(ex.getMessage());
        }
    }

    protected static XUserOLD findByUsername(String username) throws DoesNotExistException {
        for (XUserOLD user : MockDatabase.getUsers()) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        throw new DoesNotExistException("The user " + username + " does not exist.");
    }

    protected static boolean emailExists() throws AlreadyExistsException {
        for (XUserOLD user : MockDatabase.getUsers()) {
            if (user.getEmail().equals(email)) {
                throw new AlreadyExistsException("The email " + email + " already in use.");
            }
        }
        return false;
    }

    protected static boolean usernameExists() throws DoesNotExistException {
        for (XUserOLD user : MockDatabase.getUsers()) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    public static XUserOLD getUserFromId(int id) throws DoesNotExistException {
        for (XUserOLD user : MockDatabase.getUsers()) {
            if (user.getId() == id) {
                return user;
            }
        }
        throw new DoesNotExistException("The user with id " + id + " does not exist.");
    }
    
    public static int generateUniqueId() {
        List<Integer> listOfExistingId = new ArrayList<Integer>();
        // Assuming User has a method getId() that returns an int
        for (XUserOLD user : MockDatabase.getUsers()) {
            listOfExistingId.add(user.getId());
        }
        // If there are no IDs, start with 1 (or any other starting point you prefer)
        if (listOfExistingId.isEmpty()) {
            return 1;
        }
        // Find the maximum ID in the list
        int maxId = listOfExistingId.stream().max(Integer::compare).get();
        // Return the next ID which is 1 more than the maximum ID found
        return maxId + 1;
    }


    public static String getEmail() {
        return email;
    }

    public static String getFirstName() {
        return firstName;
    }

    public static String getLastName() {
        return lastName;
    }

    public static String getPassword() {
        return password;
    }

    public static String getUsername() {
        return username;
    }

    public static void setEmail(String email) {
        UserController.email = email;
    }

    public static void setFirstName(String firstName) {
        UserController.firstName = firstName;
    }

    public static void setLastName(String lastName) {
        UserController.lastName = lastName;
    }

    public static void setPassword(String password) {
        UserController.password = password;
    }

    public static void followUser(XUserOLD user, XUserOLD userToFollow) throws UnauthorizedActionException {
        if (user.getFollowing().contains(userToFollow) || user.getFollowers().contains(userToFollow)) {
            return;
        }

        userToFollow.addFollower(user);
        user.addFollowing(userToFollow);


    }

    public static void removeUserFromFollowersList(XUserOLD user, XUserOLD userToUnfollow) {
        // Make sure userToUnfollow is following user
        if (!userToUnfollow.getFollowing().contains(user)) {
            return;
        }
        user.getFollowers().remove(userToUnfollow);
    }

    public static void removeUserFromFollowedList(XUserOLD user, XUserOLD userToUnfollow) {
        // Make sure userToUnfollow is following user
        if (!userToUnfollow.getFollowers().contains(user)) {
            return;
        }
        user.getFollowing().remove(userToUnfollow);
    }

    public static void setUsername(String username) {
        UserController.username = username;
    }


}

