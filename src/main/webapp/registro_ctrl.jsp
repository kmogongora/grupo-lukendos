<%-- 
    Document   : registro_ctrl
    Created on : 19/09/2021, 1:27:17 a. m.
    Author     : Carolina Bernal
--%>
<%@page import="logica.Usuario"%>
<%@page import="logica.ColeccionRegistro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            String id = request.getParameter("txtId");
            String documento = request.getParameter("txtDocumento");
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String fechaNacimiento = request.getParameter("txtFechaNacimiento");
            int idGenero = Integer.parseInt(request.getParameter("radGenero"));
            String email = request.getParameter("txtEmail");
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtPassword");
            String estado = "Activo";
            int rol = 3;
            String accion = request.getParameter("btnSubmit");

            if (accion.equals("nuevo")) {
                Usuario user = new Usuario(documento, nombre, apellido, fechaNacimiento, idGenero, email, usuario, clave, estado, rol);
                ColeccionRegistro coleccion = new ColeccionRegistro();

                boolean guardado = coleccion.guardarUsuario(user);
                if (guardado == true) {
        %>
        <div class="alert alert-success" role = "alert"> 
            A simple success alert—check it out! 
        </div> 
        <%
                    
                    response.sendRedirect("Home.jsp");

                } else {
                    out.println("Informacion de usuario no se guardo, intentalo de nuevo o contacta a servicio tecnico");
                }
            }
        %>

    </body>
</html>
