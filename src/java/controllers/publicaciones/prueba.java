/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.publicaciones;

import DAOS.PublicacionDAOS;
import DTO.PublicacionDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author compaq-cq45
 */
@WebServlet(name = "prueba", urlPatterns = {"/prueba"})
public class prueba extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.print("ok");
        ArrayList<PublicacionDTO> newPublic=new ArrayList();
        PublicacionDTO publi=new PublicacionDTO();
        String publication=request.getParameter("newUpload");
        
        if("Publicar".equals(publication)){
            ArrayList<String> lista=new ArrayList<>();
            try{
               FileItemFactory file = new DiskFileItemFactory();
               ServletFileUpload fileUpload= new ServletFileUpload(file);
               List items=fileUpload.parseRequest(request);
               for(int i=0;i<items.size();i++){
                   FileItem fileItem=(FileItem)items.get(i);
                   if(!fileItem.isFormField()){
                       File f=new File("C:\\images\\uploads\\"+fileItem.getName());
                       fileItem.write(f);
                       //publi.setImage(fileItem.getName());
                       
                   }
                   else{
                       lista.add(fileItem.getString());
                  
                   }
               }
               publi.setImage(lista.get(0));
               publi.setTitle(request.getParameter("title"));
               publi.setBody(request.getParameter("body"));
               publi.setUsuario(Integer.parseInt(request.getParameter("rol")));
               PublicacionDAOS publiDAO= new PublicacionDAOS();
               boolean check=publiDAO.newPublicacion(publi);
               System.out.print("subida "+check);
               response.sendRedirect("/eaci/views/dashboard");
               
            }
            catch(Exception e){
                System.out.print("error en serlvet"+e.toString());
            }
            
            
            
            
            
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
