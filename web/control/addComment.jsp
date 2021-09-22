<%-- 
    Document   : addComment
    Created on : 21-sep-2021, 22:37:31
    Author     : 57322
--%>

<%@page import="DAOS.commentDAOS"%>
<%@page import="DTO.comentarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <body>
        
        
        <%
         String comentario = request.getParameter("comentario");
         HttpSession sesion=request.getSession();
         Integer idUser =(Integer)sesion.getAttribute("persona");
         int idPost = Integer.parseInt(request.getParameter("id_pub"));
 if(comentario.length()== 0 || request.getAttribute("id_pub") == "" ){ 
     
     response.sendRedirect("../index.jsp");
 }else{
        comentarioDTO pdto = new comentarioDTO();
        commentDAOS commentPost = new commentDAOS();
        pdto.setUser(idUser);
        pdto.setIdpost(idPost);
        pdto.setComentario(comentario);
        boolean agregando = commentPost.newcomment(pdto);
        String idPostString=(String)request.getParameter("id_pub");
        if(agregando){    
        response.sendRedirect("../views/options/public.jsp?id_public="+idPostString+"");
        }else{
        response.sendRedirect("../views/options/public.jsp?id_public="+idPostString+"");
        }
        
        
     
 }
        
        %>
    </body>

</html>
