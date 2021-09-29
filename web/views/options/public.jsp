<%-- 
    Document   : public
    Created on : 6/09/2021, 09:45:07 AM
    Author     : compaq-cq45
--%>

<%@page import="java.util.Objects"%>
<%@page import="DTO.PersonaDTO"%>
<%@page import="DAOS.PersonaDAOS"%>
<%@page import="DTO.comentarioDTO"%>
<%@page import="DAOS.commentDAOS"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true' %>
<style>
    .comments{
        width: 100%;
             
    }
    .titlecomment{
        color:#F9A602; 
        font-size: 25px;
        border-bottom: 1px solid #F9A602;
        padding:10px;
    }
    .pcomment{
        margin-left: 5px;
        word-break: break-all;
    }
    .sep{
       background-color: #F7F8F9; 
       padding: 5px;
       margin: 6px;
        border-radius: 16px;
    }
    .create{
        width: 100%;
        margin-bottom: 5px;
        text-align: center
    }
    .create button{
        background-color: #F00A46;
        padding: 5px;
        border-radius: 16px;
        border:none;
       box-shadow: 0px 2px 7px #F00A46;
    }
    .create button a{
        text-decoration: none;
       color: white;
       font-weight: bold;
    }
    .report{
        text-align: center;
        background-color: #FF6C5C;
        color: white;
        font-weight: bold;
        padding: 3px;
    }
</style>

<jsp:include page='../includes/header.jsp'>
    <jsp:param name='css' value='../dashboard/css/index.css' />
</jsp:include>


<jsp:include page='../includes/header.jsp' />
<header class="h-login">
    <h1>Ambientalista De Cartagena</h1>
<jsp:include page='../includes/navs/navInicio.jsp' />
</header>

    <%
    
    if(request.getParameter("sucess") != null ){
    %><p class="report">la publicacion ha sido reportada exitosamente</p><%
    }
    %>

 <div class='post'>
    <jsp:include page='includes/post.jsp'>
        <jsp:param name='id' value='<%= request.getParameter("id_public") %>'/>

    </jsp:include>
     
               

            <%
            
            HttpSession sesion=request.getSession();

            if(sesion.getAttribute("name") != null ){        
             
            %>
                
            <div class="create">
            <button type="submit"><a href="operators/newComments.jsp?id_publics=<%= request.getParameter("id_public") %>">Añadir Comentario</a></button>
            </div>
                
                <%}else{
                
                }

%>
     

     
     <div class="comments">
                 <%
        commentDAOS coment = new commentDAOS();
        ArrayList <comentarioDTO> list=new ArrayList();
        String postid= request.getParameter("id_public");  
        list=coment.getcommentpost(postid);
            
        for(comentarioDTO p: list){
            
        %>
        
        
        
        <%
            PersonaDAOS person=new PersonaDAOS(); 
            ArrayList <PersonaDTO> ListPersonCredential=new ArrayList();
            int id_persona=0;
            String name="";
            int user=p.getUser();
            ListPersonCredential=person.getOnePerson(user);
            for(PersonaDTO ps: ListPersonCredential){
                          
               name=ps.getName();
               
            }
        %>
        
        <div class="sep">
        <h2 class="titlecomment"><%= name %></h2>
        <p class="pcomment"><%= p.getComentario() %></p>  
        </div>  

              
        <% } %>
     </div>
</div>