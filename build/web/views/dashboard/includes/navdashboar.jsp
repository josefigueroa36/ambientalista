<%-- 
    Document   : navdashboar
    Created on : 1/09/2021, 12:46:39 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="nav-left" id='menu'>
    <div class='logo'>
        <div>
            <i class='fas fa-school'></i>
            <h2>Ambientalista<br>Panel</h2>
        </div>
    </div>
    <ul class='lista'>
        <li>
            <a href='/eaci/views/dashboard'>Inicio</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./usuarios.jsp'>Usuarios</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./'>Mensajes</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./'>Archivados</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='./'>Configraciones</a>
            <span class='linea'></span>
        </li>
        <li>
            <a href='../includes/outline.jsp' ><i class='fas fa-sign-out-alt'></i> Log out</a>
            <span class='linea'></span>
        </li>
    </ul>
</nav>
