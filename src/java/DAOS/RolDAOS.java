package DAOS;

import DTO.RolDTO;
import config.Database;
import interfaces.RolInterfaz;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class RolDAOS implements RolInterfaz{
        
    Database DB=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;
    
    @Override
    public ArrayList<RolDTO> getsRol() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<RolDTO> getOne(Integer id){
       
        try{
            sql="SELECT rols.id_rol,rols.rol FROM `rols` WHERE rols.id_rol="+id+"";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql); 
            
            ArrayList <RolDTO> rol = new ArrayList();
            while(rs.next()){
                RolDTO data=new RolDTO();
                data.setId_rol(rs.getInt("id_rol"));
                data.setRol(rs.getString("rol"));
                rol.add(data);
            }
            return rol;
        }
        catch(Exception e){
            System.out.print(e);
            return null;
        }
    }
    
}
