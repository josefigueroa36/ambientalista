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
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100&display=swap');
    .reports .elements{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        
        width: 100%;
        flex-direction: row;
        font-family: 'Poppins', sans-serif;
    } 
    .reports .elements .divreport{
        margin: 10px;
        background-color:#F9A602;
        display: flex;
        flex-direction: column;
        width: 200px;
        text-align: center;
        border-radius:16px;
    }
    .reports .elements .divreport h2{
    color:black;
    
    }
   .reports .elements .divreport a:nth-child(2){ 
    background-color: greenyellow;
    color:black;
    font-weight: bold
    }
       .reports .elements .divreport a:nth-child(3){
    background-color: #FF441F;
    color:black;
    font-weight: bold;
    font-size: 18px;
    border-radius: 16px;
       }
    .reports .elements .divreport a{
    color:black;
    text-decoration: none;
    padding: 5px;
    transition: 1s;
    
    }
    .reports .elements .divreport a:hover{
    font-size: 20px;
    
    }
    body{
        text-align: center;
        background-color: #F7F8F9;
        padding: 0;
        margin: 0;
    }
    h1{
        font-family: 'Poppins', sans-serif;
    }
    
    .nav{
    background-color: white;
    width: 100%;
    padding: 10px;
    text-decoration: none;             
    } 
    .nav a{
    color:#F9A602;
    font-weight: bold;
    font-size: 18px;
    font-family: 'Poppins', sans-serif;
    text-decoration: none; 
    margin-right: 5px;
    }
    .nav a:hover{
    color:black;
    }
    
</style>

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
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

    </head>
    <body>
             <div class="nav">
                 <a href="http://localhost:8080/eaci/views/dashboard/"><i class="fas fa-arrow-circle-left"></i>regresar</a>
                 <a href="../../control/deletereports.jsp">Eliminar todos los registros</a>   
                </div>
        <h1>Publicaciones reportadas</h1>
        <div class="reports">
            <div class="elements">
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
        <a class="delete" href="http://localhost:8080/eaci/views/options/archive.jsp?id_public=<%= p.getId_posts() %>">eliminar post</a>
        </div>
        

              
        <% } %>
        </div>
        
    </body>
</html>
