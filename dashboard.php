<?php
   require("config-db/class.db.local.php");
   require("work/php/funciones/funciones.php");
   if (empty($_SESSION['numero_empleado'])) {
       header("Location: index.php");
       die("Redirecting to index.php");
   }
   ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>TestLab | Sucursal <?php echo $_SESSION['sucursal'];?> </title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- data tables -->
    <!-- <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet"> -->
    <link href="vendors/DataTables/datatables.min.css" rel="stylesheet">
    
    <!-- file input -->  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

    <!-- Custom Theme Style -->
    <!-- <link href="build/css/custom.min.css" rel="stylesheet"> -->
    <link href="build/css/custom.css" rel="stylesheet">
    <!-- custom css -->
    <link href="work/css/mecanica_custom.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="dashboard.php" class="site_title"><i class="fa fa-black-tie"></i> <span>Test Lab</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<?php echo $_SESSION['imagen_perfil'];?>" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span></span>
                <h5><?php echo $_SESSION['nombre_empleado']; ?></h5>                
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />

            <!-- sidebar menu -->
            <?php
              switch (strtoupper($_SESSION['tipo_usuario'])) {
                  case 'ADMINISTRADOR':
                      include("work/php/menu/menu_administrador.php");
                      break;
                  case 'MOSTRADOR': 
                      include("work/php/menu/menu_mostrador.php");
                      break;
                  case 'CAJERO': break;
                  case 'CAPTURISTA': break;
                }          
              ?>
            <?php ;?>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <!-- <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout.php">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div> -->
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <!-- <img src="images/img.jpg" alt=""> -->
                    <img src="<?php echo $_SESSION['imagen_perfil'];?>" alt="">
                    <?php echo $_SESSION['nombre_empleado'];?>                    
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="#"><i class="fa fa-user pull-right" aria-hidden="true"></i>Perfil</a></li>
                    <li><a href="#"><i class="fa fa-key pull-right" aria-hidden="true"></i>Cambiar contraseña</a></li>                    
                    <li><a href="javascript:;"><i class="fa fa-question pull-right" aria-hidden="true"></i>Ayuda</a></li>
                    <li><a href="logout.php"><i class="fa fa-sign-out pull-right"></i>Cerrar Sesión</a></li>
                  </ul>
                </li>
                <!-- <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li> -->
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <!-- <div id="main_area">    -->
        <div class="right_col" role="main" id="main_area">
          <div class="">       
        <?php
          switch (strtoupper($_SESSION['tipo_usuario'])) {
              case 'ADMINISTRADOR':
                  include("work/php/panel/panel_administrador.php");
                  break;
              case 'MECANICO': break;
              case 'CAJERO': break;
              case 'CAPTURISTA': break;
          }          
         ?>
         </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            TestLab - Derechos reservados &copy; <?php echo date("Y");?>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- data tables -->
    <!-- <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> -->
    <script src="vendors/DataTables/datatables.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/nprogress/nprogress.js"></script>
    <!-- input mask -->    
    <script src="vendors/jquery.inputmask/dist/jquery.inputmask.bundle.js"></script>
    <!-- Select 2 -->
    <script src="vendors/select2/dist/js/select2.min.js"></script>
    <!-- Chart.js -->
    <!-- <script src="vendors/Chart.js/dist/Chart.min.js"></script> -->
    <!-- jQuery Sparklines -->
    <!-- <script src="vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script> -->
    <!-- Flot -->
    <!-- <script src="vendors/Flot/jquery.flot.js"></script>
    <script src="vendors/Flot/jquery.flot.pie.js"></script>
    <script src="vendors/Flot/jquery.flot.time.js"></script>
    <script src="vendors/Flot/jquery.flot.stack.js"></script>
    <script src="vendors/Flot/jquery.flot.resize.js"></script> -->
    <!-- Flot plugins -->
    <!-- <script src="vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="vendors/flot.curvedlines/curvedLines.js"></script> -->
    <!-- DateJS -->
    <script src="vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment-with-locales.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>    
    <!-- Custom Theme Scripts -->
    <!-- <script src="build/js/custom.min.js"></script> -->
    <script src="build/js/custom.js"></script>
    <!--Block UI-->
    <script src="vendors/blockUI/jquery.blockUI.js"></script>
    <!-- jquery validate -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <!-- sweet alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- file upload-->
    <script src="vendors/file-upload/fileinput.min.js"></script>
    <script src="vendors/file-upload/locales/es.js"></script>
    <!-- carga menus-->
    <script src="work/js/menus/carga_menus.js"></script>
    <!-- dashboard miscelanea -->
    <script src="work/js/dashboard/dashboard.js"></script>
  </body>
</html>