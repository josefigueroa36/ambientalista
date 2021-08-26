/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author compaq-cq4 
 */
public class Database {
    String driver="com.mysql.jdbc.Driver";
    String user="root";
    String pass="";
    String db="jdbc:mysql://localhost:3306/estudiantes";
    Connection conex=null;
    
    public Database(){
        try{
            Class.forName(driver);
            conex=DriverManager.getConnection(db,user,pass);
            System.out.println("connect success");
        }
        catch(Exception e){
            System.out.println("error en la conexion \n"+e);
        }
    }

    public Connection getDatabase(){
        if(conex==null){
            new Database();
            return conex;
        }
        return conex;     
    }
}

