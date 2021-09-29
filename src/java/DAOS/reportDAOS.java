/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOS;

import DTO.reportDTO;
import config.Database;
import interfaces.Interfaz_report;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author 57322
 */
public class reportDAOS implements Interfaz_report {
    Database DB=new Database();
    Connection conex=null;
    ResultSet rs;
    Statement stm;
    String sql;
    boolean check=false;
    

    @Override
    public ArrayList<reportDTO> ListReport() {
            try{
            sql="SELECT * FROM `report`";
            conex=DB.conect();
            stm=conex.createStatement();
            rs=stm.executeQuery(sql); 
            
            ArrayList <reportDTO> reporteslist = new ArrayList();
            while(rs.next()){
                reportDTO data=new reportDTO();
                data.setReport_ids(rs.getInt("report_id"));
                data.setId_users(rs.getInt("id_user"));
                data.setId_posts(rs.getInt("id_post"));

                reporteslist.add(data);
            }
            return reporteslist;
        }
        catch(Exception e){
            System.out.print(e);
            return null;
        }
    }

    @Override
    public boolean Newreport(reportDTO reporte) {
        int valor=0;
        try{
            sql="INSERT INTO report( id_user,id_post) values ('"+reporte.getId_users()+"', '"+reporte.getId_posts()+"')";
           conex=DB.conect();
           stm=conex.createStatement();
           valor=stm.executeUpdate(sql);
           if(valor!=0){
               return true;
           }
           else{
               return false;
           }
        }
        catch(Exception e){
            System.out.print("errors en insertar"+e.toString());
        }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean DeleteReport(reportDTO reporte) {
        int valor = 0 ;
        try{
            sql = "delete from report where id_user ="+reporte.getId_users()+" && id_post="+reporte.getId_posts()+"";
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
            System.out.println("error en eliminar reporte" + e.getMessage());
        }
        return check;
    }

    @Override
    public int UserIsReport(reportDTO reporte) {
        
        int isReport =0 ;
        try{
            sql = "select count(*) as numreport from report where id_user ="+reporte.getId_users()+" && id_post="+reporte.getId_posts()+"";
            conex = DB.conect();
            stm = conex.createStatement();
            rs = stm.executeQuery(sql);
            while(rs.next()){      
                isReport = rs.getInt("numreport");        
            }
           
        }
        catch(Exception e){
            System.out.println("El error en listar report"+ e.getMessage());
        }
        return isReport;
        
    }

    @Override
    public boolean DeleteAllreport() {
         int valor = 0 ;
        try{
            sql = "delete from report";
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
            System.out.println("error en borrar todo" + e.getMessage());
        }
        return check;
    }
    


    
}
