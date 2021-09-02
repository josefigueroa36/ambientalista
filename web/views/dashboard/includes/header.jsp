<%-- 
    Document   : header
    Created on : 1/09/2021, 07:28:11 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header>
    <div class="text-header">
        <h1>Bienvenido <b><%= request.getParameter("nickname") %></b></h1>
        <p>Bienvenido al panel del control, usted es <strong>administrador</strong><br>Aqui puede ver y editar publicaciones</p>
    </div>
        <div class='header-logo'>
            <img src='../../images/classroom.png' alt='by freepick'/>
             <img src='../../images/draw.png' alt='by freepick'/>           
        </div>
        <div class='header-user'>
            <h6>Miguel Foliaco Gomez</h6>
            <i class='fas fa-user-tie' id='btn_menu'></i> 
        </div>
</header>