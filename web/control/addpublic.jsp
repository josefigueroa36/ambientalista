<%-- 
    Document   : addpublic
    Created on : 9/09/2021, 09:53:55 AM
    Author     : compaq-cq45
--%>

<%@page import="DAOS.PublicacionDAOS"%>
<%@page import="DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    HttpSession sesion=request.getSession();
    File file;
    //String ruta="C:/xampp/htdocs/img";
    //cambiar la ruta
;
    String image="";
    String contenType=request.getContentType();
    ArrayList<String> lista=new ArrayList();
    PublicacionDTO publi=new PublicacionDTO();
    if(contenType.indexOf("multipart/form-data")>=0){
        
        DiskFileItemFactory factory= new DiskFileItemFactory();
        //factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload=new ServletFileUpload(factory);
        try{
            List fileItem=upload.parseRequest(request);
            Iterator i=fileItem.iterator();
            while(i.hasNext()){
                FileItem fi=(FileItem) i.next();
                if(!fi.isFormField()){
                    String fieldName=fi.getFieldName();
                    String fileName=fi.getName();

                    boolean isInMemory=fi.isInMemory();
                    long sizeInByte=fi.getSize();
                    file =new File("C:/xampp/htdocs/img/" + fileName);
                    fi.write(file);

                    image= "http://localhost/img/" + fileName; 
                 
                }
                else{
                    lista.add(fi.getString());
                   }
            }
            
            publi.setImage(image);
            publi.setTitle(lista.get(0));
            publi.setBody(lista.get(1));
            publi.setUsuario(1);
            PublicacionDAOS publiDAO= new PublicacionDAOS();
            boolean check=publiDAO.newPublicacion(publi);
            System.out.print("subida "+check);
            response.sendRedirect("/eaci/views/dashboard");
            
        }
        catch(Exception e){
            System.out.println(e);
            response.sendRedirect("/eaci/views/dashboard/addpublic.jsp?error=true");
        }
    }
    else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
    }
%>