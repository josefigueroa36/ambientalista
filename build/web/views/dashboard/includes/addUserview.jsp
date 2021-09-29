<%-- 
    Document   : addUser
    Created on : 15/09/2021, 05:30:07 PM
    Author     : Luis Jose
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
        <title>añadiendo usuario</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100&display=swap');
        .formdata{
            width: 500px;
            margin:auto;
            background-color: #F5F5F5;
            padding: 10px;
            border-radius: 16px;
            margin-top: 50px;
            text-align: center
        }
        .formdata div{
        text-align: justify;
        }
        label{
            font-family: 'Poppins', sans-serif;
            font-weight: bold;
        }
        .nav{
            background-color: #F6F8FA;
            width: 100%;
            padding: 10px;
            text-decoration: none;             
            } 
            .nav a{
            color:#F9A602;
            font-weight: bold;
            font-size: 18px;
            font-family: 'Poppins', sans-serif;
            text-decoration: none; 
            margin-right: 5px;
            }
            .nav a:hover{
            color:black;
            }
    </style>
    
        <div class="nav">
            <a href="../usuarios.jsp"><i class="fas fa-arrow-circle-left"></i>Regresar</a>  
        </div>
    
    
    <div class="formdata">
        
    <form action="../../../control/addUser.jsp" method="post" class="">
        <div class="mb-3">
            <label for="cedula" class="form-label">Cedula</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name="cedula" aria-describedby="emailHelp">

        </div>

        <div class="mb-3">
            <label for="nombre" class="form-label">Primer Nombre</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="nombre" required>
        </div>

        <div class="mb-3">
            <label for="segundo_nombre" class="form-label">Segundo Nombre</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="segundo_nombre">
        </div>
        
        <div class="mb-3">
            <label for="apellido" class="form-label">Primer Apellido</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="apellido" required>
        </div>
        
        <div class="mb-3">
            <label for="segundo_apellido" class="form-label">Segundo Apellido</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="segundo_apellido">
        </div>
        
        <div class="mb-3">
            <label for="telefono" class="form-label">telefono</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="telefono" required>
        </div>
        
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="email" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    
 </div>
</body>
</html>
