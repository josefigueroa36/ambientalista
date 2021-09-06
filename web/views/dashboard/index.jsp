<%-- 
    Document   : index
    Created on : 31/08/2021, 09:46:57 PM
    Author     : compaq-cq45
--%>

<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.RolDTO"%>
<%@page import="DAOS.RolDAOS"%>
<%@page import="DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PublicacionDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    
    PublicacionDAOS publicacion = new PublicacionDAOS();
    ArrayList <PublicacionDTO> list=new ArrayList();
    
    RolDAOS rol=new RolDAOS();
    ArrayList <RolDTO> listRol=new ArrayList();
    
    PersonaDAOS persona = new PersonaDAOS();
    ArrayList <PersonaDTO> listPerson=new ArrayList();
    
    listPerson=persona.getOnePerson((Integer)sesion.getAttribute("persona"));
    
    list=publicacion.listPublicacion();
    String username=(String)sesion.getAttribute("name");
    
    String nombrePersona="";
    String secondname="";
    String lastname="";
    String secondLastname="";
    for(PersonaDTO person: listPerson){
        nombrePersona=person.getName();
        secondname=person.getMiddlename();
        lastname=person.getLastname();
        secondLastname=person.getSecondlasname();
    }
    sesion.setAttribute("nombre",nombrePersona);
    sesion.setAttribute("secondname",secondname);
    sesion.setAttribute("lastname",lastname);
    sesion.setAttribute("secondLastname",secondLastname);
%>
<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='./css/index.css'/>
</jsp:include>
<%
    if(sesion.getAttribute("delete")!=null){
%>
<jsp:include page='includes/alert.jsp' >
    <jsp:param name='msj' value='<%= sesion.getAttribute("msj") %>'/>
</jsp:include>
<%
    
    sesion.removeAttribute("delete");
    sesion.removeAttribute("msj");
    }
else{
    if(sesion.getAttribute("msj")!=null){
%>
    <jsp:include page='includes/alert.jsp' >
    <jsp:param name='msj' value='<%= sesion.getAttribute("msj") %>'/>
    <jsp:param name='red' value='red'/>
</jsp:include>
<%
    sesion.removeAttribute("msj");
    }
}
%>
<div class='header' id='header'>   
   <% 
       String elRol="";
       
       System.out.print("id rolll is"+((Object)sesion.getAttribute("rol")).getClass().getSimpleName()+sesion.getAttribute("rol"));
       System.out.print(sesion.getAttribute("rol"));
       
       listRol=rol.getOne((Integer)sesion.getAttribute("rol"));
       for(RolDTO r:listRol){
           elRol=r.getRol();
       }
       sesion.setAttribute("elRol",elRol);
  %>
<jsp:include page='includes/header.jsp' >
        <jsp:param name='nickname' value='<%= username %>' />
        <jsp:param name='name' value='<%= sesion.getAttribute("nombre")+" "+sesion.getAttribute("secondname")+" "+sesion.getAttribute("lastname")+" "+sesion.getAttribute("secondLastname") %>' />

        <jsp:param name='rol' value='<%= sesion.getAttribute("elRol") %>' />
        
</jsp:include>

</div>
<jsp:include page='includes/navdashboar.jsp'/>

<div class='card-list' id='cardList'>
    <%
        
        
        for(PublicacionDTO p:list){
        listRol=rol.getOne(p.getUsuario());
        
        
    %>
    <jsp:include page='includes/card.jsp'>
        <jsp:param name="archivado" value="<%= p.getArchivado() %>" />
        <jsp:param name='title' value="<%= p.getTitle() %>" />
        <jsp:param name='body' value="<%= p.getBody()%>" />
        <jsp:param name='image' value="<%= p.getImage()%>" />
        <jsp:param name='fecha' value="<%= p.getFecha()%>" />
        <jsp:param name="id_public" value="<%= p.getId_publicacion() %>" />
        <jsp:param name="id_user" value="<%= p.getUsuario() %>" />
        
        
    </jsp:include>
    
    <%}%>
</div>




<script src='./js/menu.js' type='text/javascript'></script>
<script src='./js/close.js' type='text/javascript'></script>

<jsp:include page='../includes/footer.jsp'/>
