<%-- 
    Document   : post
    Created on : 23/08/2021, 11:49:43 AM
    Author     : compaq-cq45
--%>


<%@page import="DAOS.reportDAOS"%>
<%@page import="DTO.reportDTO"%>
<%@page import="DTO.LikeDTO"%>
<%@page import="DAOS.LikeDAOS"%>
<%@page import="DTO.PublicacionDTO"%>
<%@page import="DAOS.PublicacionDAOS"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@ page session="true" %>

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
            
          <%
          String value = request.getParameter("image");
          if(!value.equals("null")){
          %><img src="<%= request.getParameter("image") %>" >  <%
          }else{
          %><img src="https://i.ytimg.com/vi/AUTh--Afz0k/mqdefault.jpg" >  <%
          }
          %>
          
        </div>
    </div>
    <div class='reaction-content'>
        <div class='left-reaction'>
            <span><%= request.getParameter("numLike")    %></span>
          <%
              
        HttpSession sesion=request.getSession();
        if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
         %><a href="#" ><i class="far fa-heart"></i></a><%      
       
        }
        
        else{
            
            int valor=0;
            int  idpost=Integer.parseInt(request.getParameter("id_public"));
            Integer user=(Integer)sesion.getAttribute("persona");
            LikeDTO pdto = new LikeDTO();
            LikeDAOS countlikes=new LikeDAOS(); 
            pdto.setId_user(user);
            pdto.setId_post(idpost);
            int total=countlikes.UserIslike(pdto);
            if(total == 1){
            %><a href="http://localhost:8080/eaci/control/addLikes.jsp?id_public=<%= request.getParameter("id_public") %>" ><i class="fas fa-heart"></i></a><%    
             }
            else{
            %><a href="http://localhost:8080/eaci/control/addLikes.jsp?id_public=<%= request.getParameter("id_public") %>" ><i class="far fa-heart"></i></a><%
            }
            

            }

          %>    
            
            
            
        <a href="http://localhost:8080/eaci/views/options/public.jsp?id_public=<%= request.getParameter("id_public") %>"><i class='fas fa-comment-dots coments'></i></a>
        <a><i class='fas fa-share share'></i></a>

        </div>  
        
                  <%            
        if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
          %><a href="#"><i class='fas fa-exclamation-circle report'></i></a><%    
        
        }
        
        else{
            
            int valor=0;
            int  idpost=Integer.parseInt(request.getParameter("id_public"));
            Integer user=(Integer)sesion.getAttribute("persona");
            reportDTO pdto = new reportDTO();
            reportDAOS countreport=new reportDAOS(); 
            pdto.setId_users(user);
            pdto.setId_posts(idpost);
            int reporttotal=countreport.UserIsReport(pdto);
            if(reporttotal == 1){
            %><a href="http://localhost:8080/eaci/control/addreport.jsp?id_pub=<%= request.getParameter("id_public") %>"><i class='fas fa-exclamation-circle report'></i>reportada</a><%    
             }
            else{
            %><a href="http://localhost:8080/eaci/control/addreport.jsp?id_pub=<%= request.getParameter("id_public") %>"><i class='fas fa-exclamation-circle report'></i>reportar</a><%    
            }
            

            }

          %>    
    </div>
</div>
<%
 }
%>    