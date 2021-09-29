<%@page import="DTO.PublicacionDTO"%>
<%@page import="DAOS.PublicacionDAOS"%>
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
            PublicacionDAOS publicacion = new PublicacionDAOS();
            ArrayList <PublicacionDTO> list=new ArrayList();
            
            list=publicacion.listPublicacion();
            
            for(PublicacionDTO p: list){
            
        %>
        <jsp:include page='./views/includes/post.jsp'>
            <jsp:param name='archivado' value="<%= p.getArchivado() %>" />
            <jsp:param name='id_public' value='<%= p.getId_publicacion() %>' />
            <jsp:param name="title" value="<%= p.getTitle() %>" />
            <jsp:param name="body" value="<%= p.getBody() %>"/>
            <jsp:param name="image" value="<%= p.getImage() %>"/>
            <jsp:param name="fecha" value="<%= p.getFecha() %>"/>
            <jsp:param name="numLike" value="<%= p.getNumlike() %>"/>
         </jsp:include>
        <% } %>
      
<jsp:include page='views/includes/footer.jsp' />
