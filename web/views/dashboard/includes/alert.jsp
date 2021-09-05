<%-- 
    Document   : alert
    Created on : 5/09/2021, 04:51:41 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class='alert-content <%= request.getParameter("red") %>' id='msj'>
    
    <h6><%= request.getParameter("msj") %></h6>
    <i class='fas fa-times-circle' id='close'></i>
    
</div>