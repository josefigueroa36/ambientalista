<%-- 
    Document   : verify
    Created on : 30/08/2021, 07:57:53 PM
    Author     : compaq-cq45
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="controllers.sessiones.Login"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion=request.getSession(true);


    String nickname=request.getParameter("nickname").replace(" ","");
    String pass=request.getParameter("password").replace(" ","");
    System.out.print("hola "+nickname+" "+pass);
    
    if(nickname.length()==0 || pass.length()==0 || nickname.length()==0 || pass.length()==0){
        
        sesion.setAttribute("error","No puedes enviar los datos vacios");
        
        response.sendRedirect("../views/login.jsp");
    }
    else{
    
    Login control=new Login();
    ResultSet rs=control.getUserOne(nickname,pass);
    System.out.print("ok "+rs);
    
    if(rs==null){
        sesion.setAttribute("error","No existen esas credenciales en el sistema");
        response.sendRedirect("../views/login.jsp");
        return;
    }
    else{
        while(rs.next()){
            
                sesion.setAttribute("name",rs.getString("username"));
                //Integer id_rol=rs.getInt("id_rol");
                sesion.setAttribute("rol",rs.getInt("id_rol"));
                sesion.setAttribute("persona",rs.getInt("id_persona"));
                System.out.print("la seionn es"+rs.getInt("id_persona"));
                response.sendRedirect("../views/dashboard/index.jsp");
            }
        return;
        }
    }


%>
