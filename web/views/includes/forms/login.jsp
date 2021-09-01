<%-- 
    Document   : login
    Created on : 30/08/2021, 03:50:44 PM
    Author     : compaq-cq45
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    




<div class='form-login'>
    <div class='form-text'>
        <h2>Ingreso a la aplicacion</h2>
    </div>
    <div class="form"  >
    <form action='../control/verify.jsp' method='post'>
        <div class='control' id='one'>
            <label for='nickname'>Nickname</label>
            <input type='text' name="nickname" id="nickname" />
            <div class='buttons one'>
                <a href='#two'>Next</a>
            </div>
        </div>
        <div class='control' id='two'>
            <label for='password'>Password</label>
            <input type='password' name="password" id="password" />
            <div class='buttons'>
                <a href='#one'>Back</a>
                <button type="submit" name='send'>Send</button>
            </div>
        </div>
    </form>
    </div>
</div>
    
