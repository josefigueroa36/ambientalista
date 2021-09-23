<%-- 
    Document   : reportesregister
    Created on : 22-sep-2021, 23:04:26
    Author     : 57322
--%>

<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.reportDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.reportDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>

<%
    HttpSession sesion=request.getSession();
    System.out.println(sesion.getAttribute("persona"));
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes</title>
    </head>
    <body>
        <h1>Publicaciones reportadas</h1>
        <div class="reports">
  <%
        reportDAOS coment = new reportDAOS();
        ArrayList <reportDTO> list=new ArrayList(); 
        list=coment.ListReport();
            
        for(reportDTO p: list){
            
        %>
        
        
        
        <%
            PersonaDAOS person=new PersonaDAOS(); 
            ArrayList <PersonaDTO> ListPersonCredential=new ArrayList();
            int id_persona=0;
            String name="";
            int user=p.getId_users();
            ListPersonCredential=person.getOnePerson(user);
            for(PersonaDTO ps: ListPersonCredential){
                          
               name=ps.getName();
               
            }
        %>
        
        <div class="divreport">
        <h2 class="nameuser"><%= name %></h2>      
        <a class="ver" href="http://localhost:8080/eaci/views/options/public.jsp?id_public=<%= p.getId_posts() %>">Ver publicacion</a>
        <a class="delete" href="delete">eliminar</a>
        </div>  

              
        <% } %>
        </div>
        
    </body>
</html>
