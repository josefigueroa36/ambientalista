<%-- 
    Document   : ingresa
    Created on : 24/08/2021, 10:04:38 AM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='./includes/header.jsp'>
    <jsp:param name='css' value='../css/index.css' />
</jsp:include>
    <header class='h-login'>
        <h1>Ambientalista de Cartagena</h1>
        <jsp:include page='./includes/navs/navInicio.jsp'/>
    </header>
        <main>
            <jsp:include page='includes/login.jsp' />
        </main>
<jsp:include page='./includes/footer.jsp'/>


