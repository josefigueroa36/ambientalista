<%-- 
    Document   : archivePost
    Created on : 7/09/2021, 11:18:44 AM
    Author     : compaq-cq45
--%>

<%@page import="DAOS.PublicacionDAOS"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession sesion=request.getSession();
    
    boolean archive=Boolean.parseBoolean(request.getParameter("archi"));
    int id_public =Integer.parseInt(request.getParameter("post"));
    boolean check;
    PublicacionDAOS publicacion=new PublicacionDAOS();
    check=publicacion.archivePublication(id_public, archive);
    if(check){
        if(archive){
            sesion.setAttribute("msj","se ha archivado correctamente");
        }
        else{
            sesion.setAttribute("msj","se ha desarchivado correctamente");
        }
        response.sendRedirect("/eaci/views/options/archive.jsp?id_public="+id_public);
    }
    else{
        sesion.setAttribute("msj","ha ocurrido un error");
        response.sendRedirect("/eaci/views/options/archive.jsp?id_public="+id_public);
    }
%>
