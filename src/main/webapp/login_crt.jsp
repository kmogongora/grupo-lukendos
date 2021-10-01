<%-- 
    Document   : login_crt
    Created on : 30/09/2021, 3:04:36 p. m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.ColeccionRegistro"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controlador login</title>
    </head>
    <body>
        <%
            String nombre = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");
            ColeccionRegistro coleccionRegistro = new ColeccionRegistro();
            boolean existe = coleccionRegistro.login(nombre, pass);
            if (existe) {
            }else  
            response.sendRedirect(""); 
                %>
                <h1>funciono el login</h1>
                <%
            }
        %>
    </body>
</html>
