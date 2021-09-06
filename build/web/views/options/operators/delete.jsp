<%-- 
    Document   : delete
    Created on : 5/09/2021, 03:35:42 PM
    Author     : compaq-cq45
--%>

<%@page import="DAOS.PublicacionDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    
    PublicacionDAOS publicacion=new PublicacionDAOS();
    Integer id_publicacion=Integer.parseInt(request.getParameter("id_publicacion"));
    boolean delete;
    
    delete=publicacion.deletePublicacion(id_publicacion);
    if(delete){
        sesion.setAttribute("delete","ok");
        sesion.setAttribute("msj","La publicacion fue eliminada exitosamente");
        response.sendRedirect("../../dashboard/index.jsp");
        
    }
    else{
        sesion.setAttribute("msj","La publicacion no fue eliminada, ocurrio un error");
        response.sendRedirect("../../dashboard/index.jsp");
    }
%>
