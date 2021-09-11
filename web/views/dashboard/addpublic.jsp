<%-- 
    Document   : addpublic
    Created on : 8/09/2021, 09:21:44 PM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true' %>
<%
    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<jsp:include page="../includes/header.jsp" >
    <jsp:param name='css' value='./css/index.css' />
</jsp:include>
<header class="header" id="header">
<jsp:include page='includes/header.jsp' >
        <jsp:param name='nickname' value='<%= sesion.getAttribute("name") %>' />
        <jsp:param name='name' value='<%= sesion.getAttribute("nombre")+" "+sesion.getAttribute("secondname")+" "+sesion.getAttribute("lastname")+" "+sesion.getAttribute("secondLastname") %>' />

        <jsp:param name='rol' value='<%= sesion.getAttribute("elRol") %>' />
        <jsp:param name='id_rol' value='<%= sesion.getAttribute("rol") %>' />
</jsp:include>
</header>

<jsp:include page='includes/navdashboar.jsp'/>

<div class="cardList" id="cardList">
    <jsp:include page='includes/addPost.jsp'/>
</div>






<script src="js/menu.js"></script>
<jsp:include page='../includes/footer.jsp' />
