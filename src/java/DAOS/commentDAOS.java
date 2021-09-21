/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOS;

import DTO.comentarioDTO;
import config.Database;
import interfaces.Interfazcomentario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author 57322
 */
public class commentDAOS implements Interfazcomentario{
    
    Database DB=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;

    @Override
    public ArrayList<comentarioDTO> getcommentpost(String cp) {
        
            try{
            sql="SELECT * FROM `comentarios` WHERE idpost="+cp+"";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql); 
            
            ArrayList <comentarioDTO> comment = new ArrayList();
            while(rs.next()){
                comentarioDTO data=new comentarioDTO();
                data.setId_coment(rs.getInt("idcoment"));
                data.setUser(rs.getInt("user"));
                data.setIdpost(rs.getInt("idpost"));
                data.setComentario(rs.getString("comentario"));
                comment.add(data);
            }
            return comment;
        }
        catch(Exception e){
            System.out.print(e);
            return null;
        }
       
    }

    @Override
    public boolean newcomment(comentarioDTO person) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
