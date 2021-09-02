<%-- 
    Document   : card
    Created on : 1/09/2021, 09:04:48 PM
    Author     : compaq-cq45
--%>


<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class='card-content'>
    <div class='card-subcontent'>
    <div class='time'>
        <p><%= request.getParameter("fecha") %></p>
    </div>
    <div class='card-text'>
        <h3><%= request.getParameter("title") %></h3>
        <p><%= request.getParameter("body") %></p>
    </div>
    </div>
    <div class='option'>
        <i class='fas fa-trash'></i>
        <i class='fas fa-edit'></i>
    </div>
</div>
