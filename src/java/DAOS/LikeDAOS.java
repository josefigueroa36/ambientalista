
package DAOS;

import DTO.LikeDTO;
import config.Database;
import interfaces.Interfaz_Like;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Luis Jose
 */
public class LikeDAOS implements Interfaz_Like {
    Database DB = new Database();
    Connection conex = null;
    ResultSet rs ;
    Statement stm ;
    String sql;
    boolean check = false;
    
    public ArrayList<LikeDTO> ListLike(String id_public) {
        
        try{
            sql = "select count(*) as numlike from likes where id_post="+id_public+"";
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            ArrayList <LikeDTO> one = new ArrayList();
            while(rs.next()){
                LikeDTO like = new LikeDTO();
                like.setId_likes(rs.getInt("id_likes"));
                like.setId_user(rs.getInt("id_user"));
                like.setId_post(rs.getInt("id_post"));
                one.add(like);
            }
            return one;
        }
        catch(Exception e){
            System.out.println("El error en listar like"+ e.getMessage());
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean NewLike(LikeDTO like) {
        int valor = 0 ;
        try{
            sql = "insert into likes (id_user,id_post)"
                    + "values("+like.getId_user()+","+like.getId_post()+")";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if(valor !=0 ){
                return check =true ;
            }
            else{
                return check =false;
            }
           
        }
        catch(Exception e){
            System.out.println("error en insertar like" + e.getMessage());
        }
        return check;
    }
    
    

    @Override
    public boolean DeleteLike(LikeDTO like) {
        
        int valor = 0 ;
        try{
            sql = "delete from likes where id_user ="+like.getId_user()+" && id_post="+like.getId_post()+"";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if(valor !=0 ){
                return check =true ;
            }
            else{
                return check =false;
            }
           
        }
        catch(Exception e){
            System.out.println("error en insertar like" + e.getMessage());
        }
        return check;
        
    }

    @Override
    public ArrayList<LikeDTO> ListLike() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ResultSet numberlike(String id_public){
        int like  = 0;
        try{
            sql = "select count(*) AS numlikes FROM likes where id_post ='"+id_public+"' ";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            
            while(rs.next()){
                like = rs.getInt("numlikes");
                System.out.println(like);
            }
             
          conex.close();
        }
         catch(Exception e){
            System.out.println("error al listar los likes: "+ e.getMessage());
            
        }
        
       return rs;
    }
    
    public int numbertLike(){
        int numlike =0 ;
        try{
            sql = "select count(*) as numlike from likes where id_post=id_post";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            while(rs.next()){
                
                numlike = rs.getInt("numlike");        
            }
           
        }
        catch(Exception e){
            System.out.println("El error en listar like"+ e.getMessage());
        }
        return numlike;
      
    }

    @Override
    public int UserIslike(LikeDTO like) {
        
        int islike =0 ;
        try{
            sql = "select count(*) as numlike from likes where id_user ="+like.getId_user()+" && id_post="+like.getId_post()+"";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            while(rs.next()){      
                islike = rs.getInt("numlike");        
            }
           
        }
        catch(Exception e){
            System.out.println("El error en listar like"+ e.getMessage());
        }
        return islike;
        
        
    }
}
