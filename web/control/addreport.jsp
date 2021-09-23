<%-- 
    Document   : addreport
    Created on : 22-sep-2021, 23:41:58
    Author     : 57322
--%>

<%@page import="DAOS.reportDAOS"%>
<%@page import="DTO.reportDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <body>
       <!-- response.sendRedirect("../index.jsp");Integer idUser =(Integer)sesion.getAttribute("persona");--!>
<%
    
            String comentario = request.getParameter("comentario");
            HttpSession sesion=request.getSession();
            
            int idPost = Integer.parseInt(request.getParameter("id_pub"));
    if(sesion.getAttribute("name") != null || request.getAttribute("id_pub") == ""){ 
           reportDTO pdto = new reportDTO();
           reportDAOS reportPost = new reportDAOS();
           pdto.setId_users((Integer)sesion.getAttribute("persona"));
           pdto.setId_posts(idPost);
           boolean agregando = reportPost.Newreport(pdto);
           if(agregando){    
           response.sendRedirect("../views/options/public.jsp?id_public="+idPost+"&sucess=true");
           }else{
           response.sendRedirect("../index.jsp?error=true");
           }
        
    }else{
    response.sendRedirect("../index.jsp?error=true");
    
    }
        
%>
        
        
        
        
    </body>
</html>
