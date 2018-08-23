<?php
require("config-db/class.db.local.php");
// require("work/php/functions.php");
date_default_timezone_set('America/Tijuana');
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- Meta, title, CSS, favicons, etc. -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta charset="utf-8">    
      <meta name="description" content="Mecanica 1885 |Derechos reservados @ 2018">
      <meta name="author" content="Israel Rodríguez Sánchez">
      <title>Mecanica 1885 | Inicio sesión </title>
      <!-- Bootstrap -->
      <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Font Awesome -->
      <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
      <!-- NProgress -->
      <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
      <!-- Animate.css -->
      <link href="vendors/animate.css/animate.min.css" rel="stylesheet">
      <!-- Custom Theme Style -->
      <link href="build/css/custom.min.css" rel="stylesheet">
   </head>
   <body class="login">
      <div>
         <a class="hiddenanchor" id="signup"></a>
         <a class="hiddenanchor" id="signin"></a>
         <div class="login_wrapper">
            <div class="animate form login_form">
               <section class="login_content">
                  <form id="loginForm">
                     <h1>Iniciar Sesión</h1>                     
                     <div>                     
                        <input type="text"  class="form-control has-error" placeholder="Número de empleado" name="numeroEmpleado" id="numeroEmpleado"/>                        
                     </div>
                     <div>
                        <input type="password" class="form-control" placeholder="Contraseña" name="password" id="password"/>
                     </div>
                     <div>                        
                        <button class="btn btn-info btn-block" type="submit">Iniciar Sesión</button>
                        <a class="reset_pass" href="#">&iquest;Olvidaste tu contraseña?</a>
                     </div>
                     <div class="clearfix"></div>
                     <div class="separator">
                        <p class="change_link">New to site?
                           <a href="#signup" class="to_register"> Create Account </a>
                        </p>
                        <div class="clearfix"></div>
                        <br />
                        <div>
                           <h1><i class="fa fa-black-tie"></i> Mecanica 1885</h1>
                           <p>©2018 Todos los derechos reservados.</p>
                        </div>
                     </div>
                  </form>
               </section>
            </div>
         </div>
      </div>
      <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!--Block UI-->
    <script src="vendors/blockUI/jquery.blockUI.js"></script>
    <!-- jquery validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <!-- sweet alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- login ajax -->
    <script src="work/js/login/login.js"></script>
   </body>
</html>