<%-- 
    Document   : presupuesto
    Created on : 21/09/2021, 4:15:56 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
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
                <a class="header-menu-tab" href="#1">INICIO</a>
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
    
   
    <!-- SECCIÓN DE EGRESOS-->
    <section>
        <div class="card-body">
            <hr style="color: #0056b2;" />
            <h1>EGRESOS</h1>
        </div>

        <div class="d-flex">
            <!-- Formulario para registrar Egresos-->
            <div class="col-sm-5">
                <div class="card">
                    <form method="POST" action="registroEgreso.jsp">
                        <div class="card-body">
                            <!-- Titulo de la sección de registro de Egresos-->
                            <div class="form-group">
                                <h1 for="txtTituloEgresos" style="color:#1f253d"><i class="fas fa-money-bill-wave fa-xs"></i>Registro de Egresos</h1>
                            </div>

                            <hr style="color: #0056b2;" />
                            <!-- Tipo de Egresos-->                     
                            <div class="row mb-3">
                                <label for="txtTipoEgreso" class="col-form-label col-sm-5 ">* Tipo de Egreso</label>
                                    <div class="form-check col-sm-2 mt-2">
                                        <input class="form-check-input" type="radio" name="radTipoEgreso" id="radDisponibilidad1" value="Fijo">
                                        <label class="form-check-label" for="radTipoEgreso1">Fijo</label>
                                    </div>
                                    <div class="form-check col-sm-2 mt-2">
                                        <input class="form-check-input" type="radio" name="radTipoEgreso" id="radDisponibilidad2" value="Variable">
                                        <label class="form-check-label" for="radTipoEgreso2">Variable</label>
                                    </div>
                            </div>
                            <!-- Categoria de los Egresos-->
                            <div class="row mb-3">
                                <label for="selCategoriaEgreso" class="col-form-label col-sm-5">* Categoria</label>
                                <select class="form-control col-sm-6" id="selCategoriaEgreso" name="selCategoriaEgreso">
                                    <option selected value=""></option>
                                    <option value="1">Arriendo</option>
                                    <option value="2">Mercado</option>
                                    <option value="3">Servicios</option>
                                    <option value="4">Transportes</option>
                                    <option value="5">Educación</option>
                                    <option value="6">Ropa</option>
                                    <option value="7">Viaje</option>
                                    <option value="8">Otros</option>
                                </select>
                            </div>
                            <!-- Fecha del registro del Egreso-->
                            <div class="row mb-3">
                                <label for="dtpFechaEgreso" class="col-form-label col-sm-5">* Fecha del Egreso</label>
                                <input type="date" class="form-control col-sm-6" id="dtpFechaEgreso" name="dtpFechaEgreso">
                            </div>
                            <!-- Valor del Egreso-->
                            <div class="row mb-3">
                                <label for="txtValorEgreso" class="col-form-label col-sm-5 ">* Valor</label>
                                <input type="text" class="form-control col-sm-6" id="txtValorEgreso" name="txtValorEgreso" value="" placeholder="Valor">
                            </div>   
                            <!-- Descripción-->
                            <div class="row mb-3">
                                <label for="txtDescripcion" class="col-form-label col-sm-5 ">Descripción</label>
                                <input type="text" class="form-control col-sm-6" id="txtDescripcion" name="txtDescripcion" value=""placeholder="Descripción breve">
                            </div>

                            <div class="card-footer">
                                <div>
                                    <input type="submit" id="btnSubmit" name="btnSubmit"value="Agregar Egreso" class="btn btn-success">
                                </div>
                            </div>
                        </div>
                    </form>    
                </div> 
            </div>

            <!-- Tabla Lista Egresos-->
            <div class="col-sm-7 ml-auto" >
                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1f253d">Listado de Egresos</h1>
                        </div>
                        <hr style="color: #0056b2;" />
                        <!-- Sección de filtro-->                                    
                        <div class="form-group d-flex">
                            <div class="mb-3 col-sm-6 d-flex">
                                <label for="txtFehsFiltro" class="col-form-label col-sm-5">Fechas</label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaInicioEgreso" name="dtpFechaInicioEgreso" >
                                <input type="date" class="form-control col-sm-7" id="dtpFechaFinEgreso" name="dtpFechaFinEgreso" >
                                <input type="submit" name="accion" value="Filtrar" class="btn btn-success">
                            </div> 
                        </div>
                        <!-- Tabla para mostrar los registros de Egresos-->
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
                                ColeccionEgreso colection = new ColeccionEgreso();
                                boolean isDate = colection.cargarEgreso();
                            %>
                            <tbody>
                                <% if (isDate) { %>
                                <% for (Egreso spend : colection.getLista()) {%>
                                <tr>
                                    <tr>
                                        <td scope="row"><%= spend.getId()%></td>
                                        <td class=""><%= spend.getTipoEgreso()%></td>
                                        <td><%= colection.getCategoriaEgreso(spend.getIdCategoriaEgreso())%></td>
                                        <td><%= spend.getFechaEgreso()%></td>
                                        <td><%= spend.getDescripcion()%></td>
                                        <td><%= df.format(spend.getValorEgreso()) %></td>
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
                            <label style="font-size:16px">TOTAL EGRESOS</label>
                            <input type="text" id="txtTotalEgresos" name="txtTotalEgresos" class="form-control" value=""  readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
</body>
</html>
