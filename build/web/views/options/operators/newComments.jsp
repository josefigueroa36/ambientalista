<%-- 
    Document   : newComments
    Created on : 21-sep-2021, 22:51:58
    Author     : 57322
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <title>Añadiendo Comentario</title>
        <style>
            .nav{
                background-color: #F9A602;
                width: 100%;
                padding: 10px;
                text-decoration: none;
                
            } 
            .nav a{
                color:white;
                font-weight: bold;
                font-size: 18px;
            }
            .nav a:hover{
                color:black;
            }
            .comentario{
                width: 50%;
                margin:auto;
                margin-top: 100px;
                text-align: center;
                background-color: #F7F8F9;
                border-radius: 16px;
                padding: 10px;
            }
            .title{
                font-size: 20px;
            }
        </style>
    </head>

    
           <%
            String value = request.getParameter("id_publics");
            Integer value2= Integer.parseInt(request.getParameter("id_publics"));
            
           
            if(!value.equals("")){        
                %>
                <div class="nav">
                 <a href="../public.jsp?id_public=<%=value2%>"><i class="fas fa-arrow-circle-left"></i>regresar</a>   
                </div>
                
                <div class="comentario ">   
            <form action="../../../control/addComment.jsp?id_pub=<%= value %>" method="post">
                <div class="mb-3">
                <label for="comentario" class="form-label title">Comentario</label>
                <input type="text" class="form-control input" id="exampleInputEmail1" name="comentario" aria-describedby="emailHelp">
                </div>
        
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
                </div> 
                <%}

                else{

                %>
                <p>Page Not Found :(</p>
                <%
                                    
                }%>
    


</html>