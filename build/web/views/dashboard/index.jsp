<%-- 
    Document   : index
    Created on : 31/08/2021, 09:46:57 PM
    Author     : compaq-cq45
--%>

<%@page import="DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PublicacionDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    HttpSession sesion=request.getSession();
    
    if(session.getAttribute("name")==null){
        response.sendRedirect("../login.jsp");
    }
    
    PublicacionDAOS publicacion = new PublicacionDAOS();
    ArrayList <PublicacionDTO> list=new ArrayList();
    
    list=publicacion.listPublicacion();
    
    String username=(String)sesion.getAttribute("name");
%>
<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='./css/index.css'/>
</jsp:include>

<div class='header'>   
<jsp:include page='includes/header.jsp' >
        <jsp:param name='nickname' value='<%= username %>' />
</jsp:include>
</div>
<jsp:include page='includes/navdashboar.jsp'/>

<div class='card-list'>
    <%
        for(PublicacionDTO p:list){
    %>
    <jsp:include page='includes/card.jsp'>
        <jsp:param name='title' value="<%= p.getTitle() %>" />
        <jsp:param name='body' value="<%= p.getBody()%>" />
        <jsp:param name='image' value="<%= p.getImage()%>" />
        <jsp:param name='fecha' value="<%= p.getFecha()%>" />
        <jsp:param name="id" value="<%= p.getId_publicacion() %>" />
        <jsp:param name="id_user" value="<%= p.getUsuario() %>" />
       
    </jsp:include>
    
    <%}%>
</div>




<script src='./js/menu.js' type='text/javascript'></script>
<jsp:include page='../includes/footer.jsp'/>
