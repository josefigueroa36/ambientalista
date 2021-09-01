<%@page import="DTO.ProfesorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.ProfesorDaos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='views/includes/header.jsp'>
    <jsp:param name='css' value='./css/index.css'/>
</jsp:include>
<header>
    <jsp:include page='views/includes/navs/navInicio.jsp'/>
    <h1>Ambientalista de Cartagena<br>de Indias</h1>
    <button><a href='#'>Show More</a></button>
    <img class='left' src='./images/left.svg'/>
</header>
    
        <%
            ProfesorDaos profe= new ProfesorDaos();
            ArrayList <ProfesorDTO> listProfe= new ArrayList();
            listProfe=profe.ListProfe();
            for(ProfesorDTO p: listProfe){
        %>
        <jsp:include page='./views/includes/post.jsp'>
            <jsp:param name="name" value="<%= p.getNombre() %>" />
            <jsp:param name="ciudad" value="<%= p.getCiudad() %>"/>
            <jsp:param name="cedula" value="<%= p.getCiudad() %>"/>
        </jsp:include>
        <% } %>
      
<jsp:include page='views/includes/footer.jsp' />
