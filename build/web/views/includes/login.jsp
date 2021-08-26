<%-- 
    Document   : login
    Created on : 24/08/2021, 10:14:38 AM
    Author     : compaq-cq45
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="formulario" style='width:30%; margin:40px auto;'>
    <div class="card-body">
        <h2 class='text-center my-2'>Ingresa Crack</h2>
    <form class="form" action="./newProfeVerify.jsp" method="post">
        <div class="form-group mb-3">
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" class='form-control'/>
        </div>
        <div class="form-group mb-4">
            <label for="ciudad">Ciudad</label>
            <input type="text" name="ciudad" class='form-control'/>
        </div>
        <div class="form-group mb-4">
            <label for="cedula">Cedula</label>
            <input type="number" name="cedula" class='form-control'/>
        </div>
        <button type='submit'>Save</button>
    </form>
    </div>
</div>
