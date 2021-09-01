<%-- 
    Document   : index
    Created on : 31/08/2021, 09:46:57 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    HttpSession sesion=request.getSession();
    
    if(session.getAttribute("name")==null){
        response.sendRedirect("../login.jsp");
    }
    
    String username=(String)sesion.getAttribute("name");
%>
<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='../css/index.css'/>
</jsp:include>
     
    <jsp:include page='./navs/navdashboar.jsp'/>




        
<jsp:include page='../includes/footer.jsp'/>
