/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webfest.silence4aqualife;

/**
 *
 * @author vdeiv
 */
public class DatabaseException extends RuntimeException {


    DatabaseException(String message, Exception e) {
        super(message);
        System.out.print(e.getStackTrace());
    }
    
}
