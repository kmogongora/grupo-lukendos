<%-- 
    Document   : Home
    Created on : 5/10/2021, 3:19:16 p. m.
    Author     : camilogongora
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
<%@page import="logica.Ingreso"%>
<%@page import="logica.ColeccionIngreso"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>CUENTOMISLUKAS.COM/HOME </title>
        <link rel="stylesheet" href="EstilosPP.css">
    </head>
    <body>
        <!-- MENU -->
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

        <br>

        <!--TABLE EGRESOS -->            
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
                                <!--<th>Acciones</th>-->                    
                            </tr>
                        </thead>
                        <%  DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
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
                                <td>$<%= df.format(spend.getValorIngreso())%></td>
                                <!--<td class="d-flex">
                                    <button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button>
                                    <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                </td>-->
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
                        <input type="text" id="txtTotalIngresos" name="txtTotalIngresos" class="form-control" value="$<%= df.format(sumTotalIngreso)%>"  readonly>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <!--TABLE EGRESOS -->

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
                                <!--<th>Acciones</th>-->                    
                            </tr>
                        </thead>
                        <%  DecimalFormat dfe = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                            ColeccionEgreso egres = new ColeccionEgreso();
                            boolean isDatee = egres.cargarEgreso();
                            Double sumTotalEgreso = 0.0;
                            sumTotalEgreso = egres.totalEgreso();
                        %>
                        <tbody>
                            <% if (isDatee) { %>
                            <% for (Egreso spend : egres.getLista()) {%>
                            <tr>
                            <tr>
                                <td scope="row"><%= spend.getId()%></td>
                                <td class=""><%= spend.getTipoEgreso()%></td>
                                <td><%= egres.getCategoriaEgreso(spend.getIdCategoriaEgreso())%></td>
                                <td><%= spend.getFechaEgreso()%></td>
                                <td><%= spend.getDescripcion()%></td>
                                <td>$<%= dfe.format(spend.getValorEgreso())%></td>
                               <!-- <td class="d-flex">
                                    <button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button>
                                    <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                </td>-->
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
                        <input type="text" id="txtTotalEgresos" name="txtTotalEgresos" class="form-control" value="$<%= df.format(sumTotalEgreso)%>"  readonly>

                    </div>
                </div>
          </div>
                        <br>
                 
                

                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1f253d">Dinero Disponible </h1>
                        </div>
                        <hr style="color: #0056b2;" />

                        <table class="table" table-hover >
                            <input type="text" id="txtDiferencia" name="txtDiferencia" class="form-control" value="$<%= df.format(sumTotalIngreso - sumTotalEgreso)%>"  readonly>
                            </div>
                            <td>
                        </table>
                    </div>
                </div>
               </div>                
        







                </body>
                </html>
