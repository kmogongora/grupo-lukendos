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
<%@page import="logica.Calendario"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% Calendario mesActual = new Calendario();

%>



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
                    <a class="header-menu-tab" href=""><img class ="logo" src="imagenes_cuida/logomenu.png" width="310px" alt=""></a>
                </li>
                <li>

                <li>
                    <a class="header-menu-tab" href="/mavenproject4/Home.jsp"><span class="fas fa-home"></span> <u>INICIO</u></a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/Ingresos.jsp"><span class="fas fa-wallet"></span> INGRESOS</a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/presupuesto.jsp"><span class="fas fa-file-invoice-dollar"></span> EGRESOS</a>
                </li>
                <li>
                    <a class="header-menu-tab" href="#3">AHORRO</a>
                    <!--<a class="header-menu-number" href="#4">5</a>-->
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
        <!-- NOMBRE DE USUARIO Y MES ACTUAL-->
        <div class="d-flex">
            <div class="col-sm-5" >
                <div class="row-ms-3">
                    <div class="card">
                        <div class="card-body">
                            <!-- Titulo contenedor-->
                            <div class="d-flex col-sm-10">
                                <h1 style="color:#1f253d"><i class="fas fa-user-astronaut"></i> Pepe Bocadillo</h1>                        
                            </div>
                            <p style="color:#1f253d"> Resumen de <% out.print(mesActual.CalMes());%></p>
                            <hr style="color: #0056b2;" />
                          

                            <!--BARRAS METAS-->
                            <h2 style="color:#1f253d">Mis metas </h2>
                            <br>
                            <label>Ahorro para la Vespa: 22%</label>
                            <br>
                            <div class="progress">
                               <div class="progress-bar bg-success" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <br>
                            <label>Regalo Cumple Mamá: 86%</label>
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 86%" aria-valuenow="86" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <br>
                            <label>Viaje a Machu Picchu: 75%</label>        
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <br>
                            <label>Fondo para Emergencias: 93%</label>
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: 93%" aria-valuenow="93" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>




            <!--TABLE INGRESOS -->            
            <div class="col-sm-7 ml-auto" >
                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1f253d"><i class="fas fa-tasks"></i> Listado de Ingresos</h1>
                        </div>
                        <hr style="color: #0056b2;" />
                        <!-- Sección de filtro-->                                    
                        <form method="GET" action = "Home.jsp">
                            <div class="form-group d-flex">
                                <div class="mb-3 col-sm-7 d-flex">
                                    <label for="lblFechaFiltro" class="col-form-label col-sm-2">De </label>
                                    <input type="date" class="form-control col-sm-7" id="txtFechaDesde" name="txtFechaDesde" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-2"> A </label>
                                    <input type="date" class="form-control col-sm-7" id="txtFechaHasta" name="txtFechaHasta" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-1"></label>
                                    <button type="button" id="btnFiltroIngreso" class="btn btn-success"><i class="fas fa-search"></i></button>
                                </div> 
                            </div>
                        </form> 
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


                        <!-- Total de Ingresos-->
                        <div class="col-sm-3 ml-auto">
                            <label style="font-size:16px">TOTAL INGRESOS</label>
                            <input type="text" id="txtTotalIngresos" name="txtTotalIngresos" class="form-control font-weight-bold" value="$<%= df.format(sumTotalIngreso)%>"  readonly>
                        </div>
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
                        <h1 style="color:#1f253d"><i class="far fa-list-alt"></i> Listado de Egresos</h1>
                    </div>
                    <hr style="color: #0056b2;" />
                    <!-- Sección de filtro-->                                    
                    <form method="GET" action = "Home.jsp">
                        <div class="form-group d-flex">
                            <div class="mb-3 col-sm-7 d-flex">
                                <label for="lblFechaFiltro" class="col-form-label col-sm-2">De </label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaDesde" name="dtpFechaDesde" >
                                <label for="lblFehaFiltro" class="col-form-label col-sm-2"> A </label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaHasta" name="dtpFechaHasta" >
                                <label for="lblFehaFiltro" class="col-form-label col-sm-1"></label>
                                <button type="button" id="btnFiltroEgreso" class="btn btn-success"><i class="fas fa-search"></i></button>
                            </div> 
                        </div>
                    </form> 
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
                        <input type="text" id="txtTotalEgresos" name="txtTotalEgresos" class="form-control font-weight-bold" value="$<%= df.format(sumTotalEgreso)%>"  readonly>

                    </div>
                </div>
            </div>
            <br>



            <div class="card">
                <div class="card-body">
                    <!-- Titulo contenedor-->
                    <div class="d-flex col-sm-5">
                        <h1 style="color:#1f253d"><i class="fas fa-money-check-alt"></i> Dinero Disponible </h1>
                    </div>
                    <hr style="color: #0056b2;" />

                    <table class="table" table-hover >
                        <input type="text" id="txtDiferencia" name="txtDiferencia" class="form-control font-weight-bold" value="$<%= df.format(sumTotalIngreso - sumTotalEgreso)%>"  readonly>
                        <br>
                        <!--BARRAS COMPARATIVAS INGRESOS VS EGRESOS-->

                        <% DecimalFormat E_B_F= new DecimalFormat("##.#");
                            double egresoBarra = (sumTotalEgreso * 100) / sumTotalIngreso;%>
                        <% //out.print(egresoBarra); %>
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">INGRESOS</div>
                        </div>
                        <br>
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: <% out.print(egresoBarra); %>%" aria-valuenow="<%out.print(egresoBarra); %>" aria-valuemin="0" aria-valuemax="100">EGRESOS <% out.print(E_B_F.format(egresoBarra)); %>%</div>
                        </div>


                </div>
                <td>
                    </table>
            </div>
        </div>
    </div>                








</body>
</html>
