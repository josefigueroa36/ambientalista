/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOS;

import DTO.CredencialesDTO;
import config.Database;
import interfaces.Interfaz_Credencial;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Luis Jose
 */
public class CredencialesDAOS implements Interfaz_Credencial{
    Database DB = new Database();
    Connection conex = null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check = false;
    
    public boolean oneCredencial(CredencialesDTO creden){
        int valor=0;
        try{
            
            sql="INSERT INTO credenciales(username, pass, id_persona,id_rol) values ('"+creden.getUsername()+"', '"+creden.getPass()+"','"+creden.getId_persona()+"',4)";
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if(valor!=0){
                return check= true;
            }
           
            
        }
       
        catch(Exception e){
            System.out.println("error al insertar los datos: "+ e.getMessage());
        } 
        return check;
    }
    
    @Override
    public ArrayList<CredencialesDTO> showCredencial() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public boolean newCredencial(CredencialesDTO creden) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateCredencial(CredencialesDTO creden) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteCredencial(CredencialesDTO creden) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
