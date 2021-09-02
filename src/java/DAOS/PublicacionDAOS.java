
package DAOS;

import DTO.PublicacionDTO;
import config.Database;
import interfaces.Interfaz_Publicacion;
import java.sql.*;
import java.util.ArrayList;


public class PublicacionDAOS implements Interfaz_Publicacion{
    
    Database DB=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;
    
    @Override
    public ArrayList<PublicacionDTO> listPublicacion() {
        try{
            sql="select * from publicaciones order by fecha desc";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql);
            ArrayList <PublicacionDTO> lista= new ArrayList();
            while(rs.next()){
                PublicacionDTO publicacion=new PublicacionDTO();
                publicacion.setId_publicacion(rs.getInt("id_publicacion"));
                publicacion.setTitle(rs.getString("title"));
                publicacion.setBody(rs.getString("body"));
                publicacion.setImage(rs.getString("image"));
                publicacion.setFecha(rs.getString("fecha"));
                publicacion.setUsuario(rs.getInt("usuario"));
                lista.add(publicacion);
            }
            return lista;
        }
        catch(Exception e){
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    }

    @Override
    public boolean newPublicacion(PublicacionDTO publication) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editPublicacion(PublicacionDTO publication) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deletePublicacion(PublicacionDTO publication) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
