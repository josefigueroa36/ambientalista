<%-- 
    Document   : user
    Created on : 3/09/2021, 10:55:39 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<li class='user-item'>
    <div class='user-header'>
        <div class='photo-user'>
            <i class='fas fa-user-circle'></i>
        </div>
        <h3><%= request.getParameter("nombre")+" "+request.getParameter("middlename")+" "+request.getParameter("lastname")+" "+request.getParameter("secondLastname")  %></h3>
        
    </div>
    <div clas='user-body'>
        <h4>N° de documento: <%= request.getParameter("cedula") %></h4>
        <h4>Email: <%= request.getParameter("email") %></h4>
        <h4>Telefono: <%= request.getParameter("telefono") %></h4>
        <h4>Rol: indefinido</h4>
    </div>
</li>