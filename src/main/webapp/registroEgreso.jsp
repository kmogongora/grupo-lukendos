<%-- 
    Document   : registroEgreso
    Created on : 22/09/2021, 5:24:39 p. m.
    Author     : Carolina
--%>

<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("txtId");
            String tipoEgreso = request.getParameter("radTipoEgreso");
            int idCategoriaEgreso = Integer.parseInt(request.getParameter("selCategoriaEgreso"));
            String fechaEgreso = request.getParameter("dtpFechaEgreso");
            double valorEgreso = Double.parseDouble(request.getParameter("txtValorEgreso"));
            String descripcion = request.getParameter("txtDescripcion");
            int idUsuario = 1;
            String accion = request.getParameter("btnSubmit");
            
            if (accion.equals("Agregar Egreso")){
                Egreso spend = new Egreso(tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
                ColeccionEgreso colection = new ColeccionEgreso();

                boolean guardado = colection.guardarNuevoEgreso(spend);
                if (guardado == true) {
                    out.println("Egreso registrado exitosamente");
                    }
                else {
                    out.println("Informacion de egreso no se guardo");
                }
            }
        %>
        <a href="presupuesto.jsp"><button type="submit" class="btn btn-primary" id="btnSubmit">Volver los Egresos</button></a>
    </body>
</html>
