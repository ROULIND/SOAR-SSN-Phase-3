/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ssn.v1.controllers;
import com.mycompany.ssn.v1.exceptions.DoesNotExistException;
import com.mycompany.ssn.v1.Models.XUserOLD;
import com.mycompany.ssn.v1.controllers.UserController;

/**
 *
 * @author dimitriroulin
 */
public class LoginController {

    private static String username = "";
    private static String password = "";
    private static XUserOLD currentUser;

    public static void userLogsIn() {
        try {
            XUserOLD user = UserController.findByUsername(username);
            if (user != null && user.isPasswordCorrect(password)) {
                currentUser = user;
            }
        } catch (DoesNotExistException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static void userLogsout() {
        currentUser = null;
    }

    public static XUserOLD getUserLoggedIn() {
        return currentUser;
    }

    public static String getPassword() {
        return password;
    }

    public static String getUsername() {
        return username;
    }

    public static void setCurrentUser(XUserOLD currentUser) {
        LoginController.currentUser = currentUser;
    }

    public static void setPassword(String password) {
        LoginController.password = password;
    }

    public static void setUsername(String username) {
        LoginController.username = username;
    }

}

