/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOS;

import DTO.ProfesorDTO;
import config.Database;
import config.connect;
import interfaces.Interfaz_profe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author compaq-cq45
 */
public class ProfesorDaos implements Interfaz_profe{
    
    Database db=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;
    
    @Override
    public ArrayList<ProfesorDTO> ListProfe() {
        try{
            sql="select * from profesor";
            conex=db.getDatabase();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql);
            ArrayList <ProfesorDTO> listas=new ArrayList();
            while(rs.next()){
                ProfesorDTO profesor=new ProfesorDTO();
                profesor.setCedula(rs.getInt("cedula"));
                profesor.setNombre(rs.getString("nombre"));
                profesor.setCiudad(rs.getString("ciudad"));
                
                listas.add(profesor);
            }
            return listas;
        }
        catch(Exception e){
            System.out.println("error en listar");
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean NewProfe(ProfesorDTO profe) {
        try{
        sql="insert into profesor (cedula,nombre,ciudad) values("+profe.getCedula()+",'"+profe.getNombre()+"','"+profe.getCiudad()+"')";
        conex=db.getDatabase();
        stm=conex.createStatement();
        int ok=stm.executeUpdate(sql);
        if(ok==1){
            check=true;
            return check;
        }
        return check;
        }
        catch(Exception e){
            System.out.println("error al insertar los datos"+e.getMessage());
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean DeleteProfe(ProfesorDTO profe) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateProfe(ProfesorDTO profe) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
