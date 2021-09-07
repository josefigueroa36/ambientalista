<%-- 
    Document   : card
    Created on : 1/09/2021, 09:04:48 PM
    Author     : compaq-cq45
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.PersonaDTO" %>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id_persona=request.getParameter("id_public");
    int id=Integer.parseInt(id_persona);
    String name="";
    PersonaDAOS person = new PersonaDAOS();
    ArrayList <PersonaDTO> listPerson = new ArrayList();
    
    listPerson=person.getPersonCredencial(id);
    
    for(PersonaDTO p:listPerson){
        name=p.getName();
    }
    
%>

<div class='card-content <%= request.getParameter("archivado") %>'>
    <div class='card-subcontent'>
    <div class='time'>
        <p><%= request.getParameter("fecha") %></p>
        <%
            if(Boolean.parseBoolean(request.getParameter("archivado"))!=false){
                %>
                <p><strong>Archivado</strong></p>
                <%
            }
        %>
    </div>
    <div class='card-text'>
        <h3><%= request.getParameter("title") %></h3>
        <p><%= request.getParameter("body") %></p>
        <p><Strong>From </Strong><%= name %></p>
    </div>
    </div>
    <div class='option'>
        <a class='i' href="../options/archive.jsp?id_public=<%= request.getParameter("id_public") %>"><i class='fas fa-folder-minus'></i></a>
        <a href="../options/update.jsp?<%= request.getParameter("id_public") %>"><i class='fas fa-edit'></i></a>
    </div>
    
</div>
