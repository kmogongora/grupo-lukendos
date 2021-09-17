<%-- 
    Document   : index
    Created on : 13/09/2021, 5:58:55 p. m.
    Author     : camilogongora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" con
           tent="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- titulo pestaña  -->
    <title>CUIDOMISLUKAS.COM/LOGIN</title>
    <!-- añadir logo  -->
    <link rel="icon" href="imagenes_cuida/logopequeno.jpg" type="image/jpg">
    <link rel="stylesheet" href="EstilosLog.css">
</head>
<body>
    <div class="login-wrap">
        <div class="login-html">
          <!-- cracion de dos tablas una de ingreso y otra de registro   -->  
          <!-- ingreso -->
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Ingresar </label>
            <!-- registro  -->
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">inscribirse</label>
           
          <!-- creacion formulario  -->
            <div class="login-form">
                <div class="sign-in-htm">
                    <!-- Usurio  -->
                    <div class="group">
                        <label for="user" class="label">Usuario</label>
                        <input id="user" type="text" class="input">
                    </div>
                    <!-- Contraseña  -->
                    <div class="group">
                        <label for="pass" class="label"> CLAVE DE ACCESO</label>
                        <input id="pass" type="password" class="input" data-type="password">
                    </div>
                     <!--Mantenme registrado -->
                    <div class="group">
                        <input id="check" type="checkbox" class="check" checked>
                        <label for="check"><span class="icon"></span> Mantenerme registrado</label>
                    </div>
                     <!--  boton ingresar  -->
                    <div class="group">
                        <input type="submit" class="button" value="Ingresar">
                    </div>
                    <!-- logo -->
                    <div align="center"> <img class="logo" src="imagenes_cuida/logopequeño.jpg" alt=""></div>
                    <div class="hr"></div>
                    <!--  olvidaste tu Contraseña  -->
                    <div class="foot-lnk">
                           
                        <a href="#forgot">¿OLVIDASTE TU CLAVE DE ACCESO?</a>
                         
                    </div>
                </div>
                <!-- inicio tabla de REGISTRO-->

                <div class="sign-up-htm">
                    <!-- DOCUMENTO  -->
                    <div class="group">
                        <label for="user" class="label">Documento</label>
                        <input id="user" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Nombre Completo</label>
                        <input id="name" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Fecha de Nacimiento</label>
                        <input id="date" type="date" class="date">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Genero</label>
                        <input id="gen" type="text" class="input">
                    </div>
                  <!-- correo electronico -->
                  <div class="group">
                    <label for="pass" class="label">Correo Electronico</label>
                    <input id="email" type="text" class="input">
                </div>
                
                 <div class="group">
                    <label for="pass" class="label">Nombre de Usuario</label>
                    <input id="pass" type="text" class="input">
                </div>
                
                        <!-- contraseña   -->
                    <div class="group">
                        <label for="pass" class="label">Clave de Acceso</label>
                        <input id="pass" type="password" class="input" data-type="password">
                    </div>
                    
                   
                    <!-- boton inscribirse  -->
                    <div class="group">
                        <input type="submit" class="button" value="inscribirse">
                    </div>
                     <!-- linea separadora -->
                    <div class="hr"></div>
                     <!-- ya estas registrado -->
                    <div class="foot-lnk">
                        <label for="tab-1">¿YA ESTAS REGISTRADO?</label>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</body>
</html>