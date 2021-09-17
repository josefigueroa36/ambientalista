<%-- 
    Document   : card
    Created on : 1/09/2021, 09:04:48 PM
    Author     : compaq-cq45
--%>


<%@page import="DAOS.RolDAOS"%>
<%@page import="DTO.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.PersonaDTO" %>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    
    RolDAOS rol=new RolDAOS();
    ArrayList <RolDTO> listRol=new ArrayList();
    
     String elRol="";
       
       System.out.print("id rolll is"+((Object)sesion.getAttribute("rol")).getClass().getSimpleName()+sesion.getAttribute("rol"));
       System.out.print(sesion.getAttribute("rol"));
       
       listRol=rol.getOne((Integer)sesion.getAttribute("rol"));
       for(RolDTO r:listRol){
           elRol=r.getRol();
           sesion.setAttribute("id_rol",r.getId_rol());
       }
       sesion.setAttribute("elRol",elRol);
    
    String id_persona=request.getParameter("id_public");
    int id=Integer.parseInt(id_persona);
    String name="";
    PersonaDAOS person = new PersonaDAOS();
    ArrayList <PersonaDTO> listPerson = new ArrayList();
    
    listPerson=person.getPersonCredencial(id);
    
    for(PersonaDTO p:listPerson){
        name=p.getName();
    }
    
%>

<div class='card-content <%= request.getParameter("archivado") %>'>
    <div class='card-subcontent'>
    <div class='time'>
        <p><%= request.getParameter("fecha") %></p>
        <%
            if(Boolean.parseBoolean(request.getParameter("archivado"))!=false){
                %>
                <p><strong>Archivado</strong></p>
                <%
            }
        %>
    </div>
    <div class='card-text'>
        <h3><%= request.getParameter("title") %></h3>
        <p><%= request.getParameter("body") %></p>
        <p><Strong>From </Strong><%= name %></p>
    </div>
    </div>
    <div class='option'>
        <% 
            if(elRol.equals("administrador")|| elRol.equals("sub administrador")){
            %>
        <a class='i' href="../options/archive.jsp?id_public=<%= request.getParameter("id_public") %>"><i class='fas fa-folder-minus'></i></a>
        <% 
        }
        %>
        <a href="../options/update.jsp?<%= request.getParameter("id_public") %>"><i class='fas fa-edit'></i></a>
    </div>
    
</div>
