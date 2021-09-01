/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.sessiones;

import config.Database;
import java.sql.Connection;
import java.sql.ResultSet;
import models.ModelUser;

/**
 *
 * @author compaq-cq45
 */
public class Login {
    public ResultSet getUserOne(String nickname,String pass){
        Database DB=new Database();
        ModelUser mUser=new ModelUser();
        ResultSet user=mUser.getUserOneModel((Connection)DB.conect(), nickname,pass);
        return user;
    }
}
