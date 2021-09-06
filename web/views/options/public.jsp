<%-- 
    Document   : public
    Created on : 6/09/2021, 09:45:07 AM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='../dashboard/css/index.css' />
</jsp:include>


<jsp:include page='../includes/header.jsp' />
<header class="h-login">
    <h1>Ambientalista De Cartagena</h1>
<jsp:include page='../includes/navs/navInicio.jsp' />
</header>

 <div class='post'>
    <jsp:include page='includes/post.jsp'>
        <jsp:param name='id' value='<%= request.getParameter("id_public") %>'/>

    </jsp:include>
</div>