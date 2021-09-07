<%-- 
    Document   : archive
    Created on : 4/09/2021, 08:49:29 PM
    Author     : compaq-cq45
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    

%>
<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='../dashboard/css/index.css'/>
</jsp:include>
<div class='header' id='header'>
<jsp:include page='../dashboard/includes/header.jsp'>
    <jsp:param name='nickname' value='<%= sesion.getAttribute("name") %>' />
        <jsp:param name='name' value='<%= sesion.getAttribute("nombre")+" "+sesion.getAttribute("secondname")+" "+sesion.getAttribute("lastname")+" "+sesion.getAttribute("secondLastname") %>' />
        <jsp:param name='rol' value='<%= sesion.getAttribute("elRol") %>' />
</jsp:include>
</div>
<jsp:include page='../dashboard/includes/navdashboar.jsp' />

<div id='cardList'>
    <div class='post'>
    <jsp:include page='includes/post.jsp'>
        <jsp:param name='id' value='<%= request.getParameter("id_public") %>'/>
        <jsp:param name='archive' value="archive"/>
        <jsp:param name='admin' value='true'/>
    </jsp:include>
    </div>
</div>

<script type="text/javascript">
    <%
        if(sesion.getAttribute("msj")!=null){
            %>
                alert('<%= sesion.getAttribute("msj") %>');
            <%
                sesion.removeAttribute("msj");
        }
    %>
</script>
<script src='../dashboard/js/menu.js' type='text/javascript' ></script>
<jsp:include page='../includes/footer.jsp' />