package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class ModelUser {
    public ResultSet getUserOneModel(Connection DB,String nickname,String pass){
        System.out.print(nickname);
        try{
            String sql="select * from credenciales where username='"+nickname+"' and pass='"+pass+"'";
            Statement stm=DB.createStatement();
            ResultSet rs=stm.executeQuery(sql);
            return rs;
        }
        catch(Exception e){
            System.out.println("error en el login  model "+e);
            return null;
        }
    }
}
