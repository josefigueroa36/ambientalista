<%-- 
    Document   : outline
    Created on : 31/08/2021, 10:17:19 PM
    Author     : compaq-cq45
--%>

<%@page import="java.util.ArrayList"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")!=null){
        sesion.invalidate();
    }
    response.sendRedirect("../../index.jsp");

%>
