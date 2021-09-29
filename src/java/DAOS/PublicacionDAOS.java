
package DAOS;

import DTO.PublicacionDTO;
import config.Database;
import interfaces.Interfaz_Publicacion;
import java.sql.*;
import java.util.ArrayList;

public class PublicacionDAOS implements Interfaz_Publicacion {

    Database DB = new Database();
    Connection conex = null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check = false;

    @Override
    public ArrayList<PublicacionDTO> listPublicacion() {
        try {
            sql = "select * from publicaciones order by fecha desc";
            System.out.println(sql);
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            ArrayList<PublicacionDTO> lista = new ArrayList();
            while (rs.next()) {
                PublicacionDTO publicacion = new PublicacionDTO();
                publicacion.setArchivado(rs.getBoolean("archivado"));
                publicacion.setId_publicacion(rs.getInt("id_publicacion"));
                publicacion.setTitle(rs.getString("title"));
                publicacion.setBody(rs.getString("body"));
                publicacion.setImage(rs.getString("image"));
                publicacion.setFecha(rs.getString("fecha"));
                publicacion.setUsuario(rs.getInt("usuario"));
                publicacion.setNumlike(rs.getInt("numlike"));
                lista.add(publicacion);
            }
            return lista;
        } catch (Exception e) {
            System.out.print("list publication error " + e.toString());
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    }

    public ArrayList<PublicacionDTO> getOnePublication(Integer id_public) {
        try {
            sql = "select * from publicaciones where id_publicacion= " + id_public;
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            ArrayList<PublicacionDTO> one = new ArrayList();
            while (rs.next()) {
                System.out.print(rs.getString("title"));
                PublicacionDTO publicacion = new PublicacionDTO();
                publicacion.setId_publicacion(rs.getInt("id_publicacion"));
                publicacion.setArchivado(rs.getBoolean("archivado"));
                publicacion.setTitle(rs.getString("title"));
                publicacion.setBody(rs.getString("body"));
                publicacion.setImage(rs.getString("image"));
                publicacion.setFecha(rs.getString("fecha"));
                publicacion.setUsuario(rs.getInt("usuario"));
                one.add(publicacion);
            }

            return one;
        } catch (Exception e) {
            System.out.print("get one publication error " + e.toString());
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    }

    @Override
    public boolean newPublicacion(PublicacionDTO publication) {
        int valor = 0;
        try {
            sql = "insert into publicaciones(id_publicacion,title,body,image,fecha,usuario,archivado) "
                    + "values(null,'" + publication.getTitle() + "','" + publication.getBody() + "','" + publication.getImage() + "',"
                    + "null," + publication.getUsuario() + ",0)";
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if (valor != 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.print("errors en insertar" + e.toString());
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        }

    }

    @Override
    public boolean editPublicacion(PublicacionDTO publication, Integer id_publicacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean archivePublication(Integer id_public, boolean archive) {
        int valor = 0;
        try {
            sql = "update publicaciones set archivado=" + archive + " where id_publicacion=" + id_public;
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);
            if (valor == 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            System.out.print(e.toString());
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates. 
    }

    @Override
    public boolean deletePublicacion(Integer id_publicacion) {
        int valor = 0;
        try {
            sql = "delete from publicaciones where id_publicacion=" + id_publicacion;
            conex = DB.conect();
            stm = conex.createStatement();
            valor = stm.executeUpdate(sql);

            if (valor == 0) {
                return false;
            }
            return true;

        } catch (Exception e) {
            System.out.print(e.toString());
            return false;
        }
    }

    public int addnumlike(Integer id_publicacion) {
        int valor = 0;

        try {
                sql = "UPDATE `publicaciones` SET numlike =numlike+ 1 WHERE id_publicacion = "+id_publicacion+" ";
                conex = DB.conect();
                stm = conex.createStatement();
                valor = stm.executeUpdate(sql);
                
                return valor;

            }
            catch (Exception e) {
                System.out.print(e.toString());
                return valor;
            }
        }
    
    public int deletenumlike (Integer id_publicacion){
        int valor = 0;

        try {
                sql = "UPDATE `publicaciones` SET numlike =numlike-1 WHERE id_publicacion = "+id_publicacion+" ";
                conex = DB.conect();
                stm = conex.createStatement();
                valor = stm.executeUpdate(sql);
                
                return valor;

            }
            catch (Exception e) {
                System.out.print(e.toString());
                return valor;
            }
    }
    
}

