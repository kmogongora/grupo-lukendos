<%-- 
    Document   : presupuesto
    Created on : 21/09/2021, 4:15:56 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Ingreso"%>
<%@page import="logica.ColeccionIngreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>CUENTOMISLUKAS.COM/PAGINAPRESUPUESTO </title>
    <link rel="stylesheet" href="EstilosPP.css">
</head>
<body>
    <header class="block">
        <ul class="header-menu horizontal-list">

            <li>
                <a class="header-menu-tab" href="#1"><span class="fas fa-home"></span>INICIO</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#2">PRESUPUESTO</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#3">AHORRO</a>
                <a class="header-menu-number" href="#4">5</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#5">METAS</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#5">CONFIGURACIÓN</a>
            </li>
        </ul>
        <div class="profile-menu">
            <p>USUARIO <a href="#26"></a></p>
            <div class="profile-picture small-profile-picture">
                <img width="40px" alt="img usuario" src="imagenes_cuida/logoprot.png">
            </div>
        </div>
    </header>
    
   
    <!-- SECCIÓN DE INGRESOS-->
    <section>
        <%
                double totalIngresos;
                String accion = request.getParameter("accion");
                int id = 0;
                String tipoIngreso = "";
                int idCategoriaIngreso = 0;
                String fechaIngreso = "";
                double valorIngreso = 0;
                String descripcion = "";                                
        %>
        <div class="card-body">
            <hr style="color: #0056b2;" />
            <h1>INGRESOS</h1>
        </div>

        <div class="d-flex">
            <!-- Formulario para registrar Ingresos-->
            <div class="col-sm-5">
                <div class="card">
                    <form method="POST" action="registroIngreso.jsp">
                        <div class="card-body">
                            <!-- Titulo de la sección de registro de Ingresos-->
                            <div class="form-group">
                                <h1 for="txtTituloIngresos" style="color:#1f253d"><i class="fas fa-money-bill-wave fa-xs"></i>Registro de Ingresos</h1>
                            </div>

                            <hr style="color: #0056b2;" />
                            <!-- ID del Ingreso-->
                                <div class="row mb-3">
                                    <label for="txtId" class="col-form-label col-sm-5 ">ID</label>
                                    <input type="text" class="form-control col-sm-6" id="txtId" name="txtId" value="<%= id %>" readonly>
                                </div>
                            <!-- Tipo de Ingresos-->                     
                            <div class="row mb-3">
                                <label for="txtTipoIngreso" class="col-form-label col-sm-5 ">* Tipo de Ingreso</label>
                                    <div class="form-check col-sm-2 mt-2">
                                        <input class="form-check-input" type="radio" name="radTipoIngreso" id="radDisponibilidad1" value="Fijo" <%= tipoIngreso.equals("Fijo") ? "checked" : "" %>>
                                        <label class="form-check-label" for="radTipoIngreso1">Fijo</label>
                                    </div>
                                    <div class="form-check col-sm-2 mt-2">
                                        <input class="form-check-input" type="radio" name="radTipoIngreso" id="radDisponibilidad2" value="Variable" <%= tipoIngreso.equals("Variable") ? "checked" : "" %>>
                                        <label class="form-check-label" for="radTipoIngreso2">Variable</label>
                                    </div>
                            </div>
                            <!-- Categoria de los Ingresos-->
                            <div class="row mb-3">
                                <label for="selCategoriaIngreso" class="col-form-label col-sm-5">* Categoria</label>
                                <%ColeccionIngreso colection = new ColeccionIngreso();
                                TreeMap<Integer, String> Categoria = colection.getCategoriaIngresos();
                                %>
                                <select class="form-control col-sm-6" id="selCategoriaIngreso" name="selCategoriaIngreso">
                                    <option selected value=""></option>
                                    <% for (Map.Entry<Integer, String> entrada : Categoria.entrySet()) { %>
                                    <option <%= entrada.getKey()== idCategoriaIngreso ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <!-- Fecha del registro del Ingreso-->
                            <div class="row mb-3">
                                <label for="dtpFechaIngreso" class="col-form-label col-sm-5">* Fecha del Ingreso</label>
                                <input type="date" class="form-control col-sm-6" id="dtpFechaIngreso" name="dtpFechaIngreso" value="<%= fechaIngreso %>">
                            </div>
                            <!-- Valor del Ingreso-->
                            <div class="row mb-3">
                                <label for="txtValorIngreso" class="col-form-label col-sm-5 ">* Valor</label>
                                <input type="text" class="form-control col-sm-6" id="txtValorIngreso" name="txtValorIngreso" value="<%= valorIngreso %>" placeholder="Valor">
                            </div>   
                            <!-- Descripción-->
                            <div class="row mb-3">
                                <label for="txtDescripcion" class="col-form-label col-sm-5 ">Descripción</label>
                                <input type="text" class="form-control col-sm-6" id="txtDescripcion" name="txtDescripcion" value="<%= descripcion %>"  placeholder="Descripción breve">
                            </div>

                            <div class="card-footer">
                                <div>
                                    <input type="submit" id="btnSubmit" name="btnSubmit"value="Agregar Ingreso" class="btn btn-success">
                                </div>
                            </div>
                        </div>
                    </form>    
                </div> 
            </div>

            <!-- Tabla Lista Ingresos-->
            <div class="col-sm-7 ml-auto" >
                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1f253d">Listado de Ingresos</h1>
                        </div>
                        <hr style="color: #0056b2;" />
                        <!-- Sección de filtro-->                                    
                        <div class="form-group d-flex">
                            <div class="mb-3 col-sm-6 d-flex">
                                <label for="txtFehsFiltro" class="col-form-label col-sm-5">Fechas</label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaInicioEgreso" name="dtpFechaInicioIngreso" >
                                <input type="date" class="form-control col-sm-7" id="dtpFechaFinEgreso" name="dtpFechaFinIngreso" >
                                <input type="submit" name="accion" value="Filtrar" class="btn btn-success">
                            </div> 
                        </div>
                        <!-- Tabla para mostrar los registros de Ingresos-->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tipo</th>
                                    <th>Categoria</th>
                                    <th>Fecha</th>
                                    <th>Descripción</th>
                                    <th>Valor</th>
                                    <th>Acciones</th>                    
                                </tr>
                            </thead>
                            <%  DecimalFormat df = new DecimalFormat( "#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                                ColeccionIngreso ingres = new ColeccionIngreso();
                                boolean isDate = ingres.cargarIngreso();
                                Double sumTotalIngreso = 0.0;
                                sumTotalIngreso = ingres.totalIngreso();
                            %>
                            <tbody>
                                <% if (isDate) { %>
                                <% for (Ingreso spend : ingres.getLista()) {%>
                                <tr>
                                    <tr>
                                        <td scope="row"><%= spend.getId()%></td>
                                        <td class=""><%= spend.getTipoIngreso()%></td>
                                        <td><%= ingres.getCategoriaIngreso(spend.getIdCategoriaIngreso())%></td>
                                        <td><%= spend.getFechaIngreso()%></td>
                                        <td><%= spend.getDescripcion()%></td>
                                        <td><%= df.format(spend.getValorIngreso()) %></td>
                                        <td class="d-flex">
                                            <button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button>
                                            <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                        </td>
                                    </tr>
                                    <% } %>
                                    <% } else { %>
                                    <tr>
                                        <td colspan="5">No hay datos</td>
                                    </tr>
                                    <% }%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Pie de pagina del contenedor-->
                    <div class="card-footer d-flex">
                        <!-- Total de Egresos-->
                        <div class="col-sm-3 ml-auto">
                            <label style="font-size:16px">TOTAL INGRESOS</label>
                            <input type="text" id="txtTotalIngresos" name="txtTotalIngresos" class="form-control" value="<%= df.format(sumTotalIngreso) %>"  readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
</body>
</html>
