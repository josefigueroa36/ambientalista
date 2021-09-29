<%-- 
    Document   : deletereports
    Created on : 28-sep-2021, 1:39:32
    Author     : 57322
--%>

<%@page import="DAOS.reportDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    
    reportDAOS reports=new reportDAOS();
    
    boolean delete=reports.DeleteAllreport();
    if(delete){    
        response.sendRedirect("../views/dashboard/reportesregister.jsp");
        
    }
    else{
        response.sendRedirect("../views/dashboard/reportesregister.jsp");
    }
%>
