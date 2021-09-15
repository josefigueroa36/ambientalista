<%-- 
    Document   : post
    Created on : 23/08/2021, 11:49:43 AM
    Author     : compaq-cq45
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%
    System.out.print(request.getParameter("archivado"));
    if(Boolean.parseBoolean(request.getParameter("archivado"))){
        return;
    }
    else{
%>
<div class='post-content'>
    <div class='fecha'>
        <p><%= request.getParameter("fecha") %></p>
    </div>
    <div class='header'>
        <%
            PersonaDAOS person=new PersonaDAOS(); 
            ArrayList <PersonaDTO> ListPersonCredential=new ArrayList();
            int id_persona=0;
            String name="";
            ListPersonCredential=person.getPersonCredencial(Integer.parseInt(request.getParameter("id_public")));
            for(PersonaDTO p: ListPersonCredential){
                
               
               name=p.getName();
            }
        %>
        <h2><%= name %></h2>
        <h3><a href="http://localhost:8080/eaci/views/options/public.jsp?id_public=<%= request.getParameter("id_public") %>"><%= request.getParameter("title") %></a></h3>
        <p><%= request.getParameter("body") %></p>
    </div>
    <div class='body'>
        <div class='img-content'>
            <img src="<%= request.getParameter("image") %>" > 
        </div>
    </div>
    <div class='reaction-content'>
        <div class='left-reaction'>
            
        <a><i class='fas fa-heart like'></i></a>
        <a><i class='fas fa-comment-dots coments'></i></a>
        <a><i class='fas fa-share share'></i></a>

        </div>
        
        <a><i class='fas fa-exclamation-circle report'></i></a>
    </div>
</div>
<%
 }
%>    