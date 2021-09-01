<%-- 
    Document   : login
    Created on : 30/08/2021, 03:44:53 PM
    Author     : compaq-cq45
--%>


<%@page import="java.util.ArrayList"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page='./includes/header.jsp' >
    <jsp:param name="css" value="../css/index.css"/>
</jsp:include>

    <header class='h-login'>
        <h1>Ambientalista de Cartagena</h1>
        <jsp:include page='./includes/navs/navInicio.jsp'/>
    </header>
    <%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("name")!=null){
        response.sendRedirect("./dashboard/");
    }
    if(sesion.getAttribute("error")!=null){
        %>
        <div class="msj" id="msj">
            <div class="close-btn">
                <div class="close" id="close">
                    <span>x</span>
                </div>
            </div>
            <div>
                <p>
                    <%= sesion.getAttribute("error")%>
                </p>
            </div>
        </div>
        <%
    }
%>
        <main>
            <jsp:include page='includes/forms/login.jsp' />
        </main>
        
<%
    if(sesion.getAttribute("error") !=null){
        sesion.removeAttribute("error");
        %>
        <script src="../js/close.js" type="text/javascript" ></script>
        <%
    }

%>
 
<jsp:include page='./includes/footer.jsp' />