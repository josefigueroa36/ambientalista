<%-- 
    Document   : post
    Created on : 5/09/2021, 01:06:42 PM
    Author     : compaq-cq45
--%>

<%@page import="DAOS.reportDAOS"%>
<%@page import="DTO.reportDTO"%>
<%@page import="DAOS.LikeDAOS"%>
<%@page import="DTO.LikeDTO"%>
<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOS.PublicacionDAOS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .report{
        background-color: white
    }
</style>

<%
    
    
    Integer id_public=Integer.parseInt(request.getParameter("id_public")==null ? "0" :request.getParameter("id_public"));
    PersonaDAOS persona=new PersonaDAOS();
    ArrayList <PersonaDTO> personaone=new ArrayList();
    
    PublicacionDAOS publication=new PublicacionDAOS();
    ArrayList <PublicacionDTO> onePublication=new ArrayList();
    
    onePublication=publication.getOnePublication(id_public);
    
    String title="";
    String body="";
    String image="";
    Integer id_usuario=0;
    Integer id_pub=0;
    String fecha="";
    String name="";
    boolean archivado=false;
    
    for(PublicacionDTO p: onePublication){
        archivado=p.getArchivado();
        title=p.getTitle();
        id_pub=p.getId_publicacion() == 0 ? 0 : p.getId_publicacion();
        body=p.getBody();
        image=p.getImage();
        id_usuario=p.getId_publicacion();
        fecha=p.getFecha();
    }
    System.out.print("el boleanod "+Boolean.parseBoolean(request.getParameter("admin")));
    if(id_pub!=0){
        if(!archivado || Boolean.parseBoolean(request.getParameter("admin"))==true){
            personaone=persona.getPersonCredencial(id_public);
            for(PersonaDTO p:personaone){
                name=p.getName();
            }
%>

<div class='post-content'>
    <div class='fecha'>
        <p><%= fecha %></p>
    </div>
    <%  
        if(request.getParameter("archive")!=null){%>
        
        <div class='content-options'>
            <div>
                <a href='operators/delete.jsp?id_publicacion=<%= id_public %>'><i class='fas fa-trash'></i>
                    <p>Eliminar</p></a>
            </div>
            <div>
                <%
                if(archivado){
                %>
                <a href='/eaci/views/options/operators/archivePost.jsp?archi=false&post=<%= id_public%>'><i class='fas fa-folder-minus' style="color:green"></i><p>Desarchivar</p></a>
                <%
                    }
                    else{
                %>
                <a href='/eaci/views/options/operators/archivePost.jsp?archi=true&post=<%= id_public %>'><i class='fas fa-folder-minus'></i><p>Archivar</p></a>
                <%
                }
                %>
            </div>
        </div>
        
            <%
        }
    %>
    <div class='header-post'>
        <h2><%= name %></h2>
        <h3><%= title %></h3>
        <p><%= body %></p>
    </div>
    <div class='body-post'>
        <div class='img-content'>
          <%
          String total = image;
          if(total != null){
          %><img src="<%= total %>" >  <%
          }else{
          %><img src="https://i.ytimg.com/vi/AUTh--Afz0k/mqdefault.jpg" >  <%
          }
          %>

        </div>
    </div>
    <div class='reaction-content'>
        <div class='left-reaction'>
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
            int result=countlikes.UserIslike(pdto);
            if(result == 1){
            %><a href="http://localhost:8080/eaci/control/addLikes.jsp?id_public=<%= request.getParameter("id_public") %>" ><i class="fas fa-heart"></i></a><%    
             }
            else{
            %><a href="http://localhost:8080/eaci/control/addLikes.jsp?id_public=<%= request.getParameter("id_public") %>" ><i class="far fa-heart"></i></a><%
            }
            

            }

          %>             
            
            
        <a><i class='fas fa-comment-dots coments'></i></a>
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
else{
%>
<jsp:include page="../../includes/404.jsp"/>

<%
    }
    }
%>
