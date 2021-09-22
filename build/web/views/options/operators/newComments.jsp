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
        <title>Añadiendo Comentario</title>
    </head>
    <body>
        

          
           <%
            String value = request.getParameter("id_publics");
            
            
            if(!value.equals("")){        
                %>
                
            <form action="../../../control/addComment.jsp?id_pub=<%= value %>" method="post">
                <div class="mb-3">
                <label for="comentario" class="form-label">Comentario</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="comentario" aria-describedby="emailHelp">
                </div>
        
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
                
                <%}

                else{

                %>
                <p>Page Not Found :(</p>
                <%
                                    
                }%>
    

</body>
</html>