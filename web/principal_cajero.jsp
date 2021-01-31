<%-- 
    Document   : dashboard_cajero
    Created on : 29/01/2021, 02:05:31 AM
    Author     : ErikHernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ESTILOS CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style_sidebar.css">
        <link rel="stylesheet" href="css/style_base.css">
        <link rel="stylesheet" href="css/style_dashboard.css">

        <!-- ICONOS CSS-->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

        <!-- ICONO PESTAÑA -->
        <link rel="shortcut icon" href="img/icono.png">

        <title>Cajero</title>
    </head>
    <body>
        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <!-- LOGO LIBRO -->
                    <div class="nav__logo">
                        <img src="img/libro.png" alt="" class="nav__logo-icon">
                        <p class="nav__logo-text">Aprende Jugando</p>
                    </div>

                    <!-- CIRCULO QUE EXPANDE Y CONTRAE EL MENU -->
                    <div class="nav__toggle" id="nav-toggle">
                        <i class='bx bx-chevron-right'></i>
                    </div>

                    <ul class="nav__list">
                        <!-- ITEM HOME -->
                        <li>
                            <a href="Controlador?accion=dashboard_cajero" class="nav__link active" target="myFrame">
                                <i class='bx bx-home-alt nav__icon'></i>
                                <span class="nav__text">Home</span>
                            </a>
                        </li>

                        <!-- ITEM ARTICULOS -->
                        <li>
                            <a href="Controlador?accion=listar_productos" class="nav__link" target="myFrame">
                                <i class='bx bx-book nav__icon'></i>
                                <span class="nav__text">Artículos</span>
                            </a>
                        </li>

                        <!-- ITEM VENTAS -->
                        <li>
                            <a href="Controlador?accion=ventas" class="nav__link" target="myFrame">
                                <i class='bx bx-cart-alt nav__icon'></i>
                                <span class="nav__text">Venta</span>
                            </a>
                        </li>

                        <!-- ITEM DEVOLUCIONES -->
                        <li>
                            <a href="Controlador?accion=devoluciones" class="nav__link" target="myFrame">
                                <i class='bx bx-refresh nav__icon'></i>
                                <span class="nav__text">Devoluciones</span>
                            </a>
                        </li>

                </div>
                <a href="index.jsp" class="nav__link">
                    <i class='bx bx-log-out-circle nav__icon'></i>
                    <span class="nav__text">Cerrar Sesión</span>
                </a>
            </nav>
        </div>

        <div>
            <!-- ACA EMPIEZA EL ESPACIO PARA LO DE LA CABECERA -->
            <div class="row cabecera fixed-top">

                <!-- Espacio destinado a dejar el espacio en blanco del lado izq de la cabecera -->
                <div class="col-1 col-md-2 col-lg-2 espacio_vacio align-self-end">
                    <h6 class="nomUsuario">
                        ${usuario.toString()}
                    </h6>
                </div>

                <!-- Espacio destinado al titulo dentro de la cabecera -->
                <div class="col-7 col-md-7 col-lg-8 align-self-center text-center espacio_titulo">
                    <h1 class="titulo">Aprende Jugando</h1>
                    <hr class="hr_1">
                </div>

                <!-- Espacio para el logo de la libreria en la cabecera -->
                <div class="col-4 col-md-3 col-lg-2 align-self-center text-center espacio_logo">
                    <img class="img_logo rounded" src="img/logo.jpg" alt="">
                </div>
            </div>
        </div>

        <!-- ACA SE AGREGA LA PARTE DEL CONTENIDO -->
        <div class="row cuerpo" style="height: 500px;">
            <iframe style="width: 100%;" name="myFrame" src="dashboard_cajero.jsp">
            </iframe>
        </div>

        <!-- ACA EMPIEZA EL PIE DE PAGINA -->
        <div class="row pie fixed-bottom">
            <div class="col-12 hr_pie">
                <hr class="hr_2">
            </div>

            <!-- Espacio para mencionar el Facebook de la libreria -->
            <div class="col-12 col-md-3 col-lg-2 align-self-center text-center espacio_facebook">
                <a href="https://www.facebook.com/" class="alert-link" target="_blank">Facebook</a>
            </div>

            <!-- Espacio para la direccion de la libreria -->
            <div class="col-12 col-md-9 col-lg-5 align-self-center text-center espacio_direccion">
                Local No. 27, Mercado "La Soledad", Col. Centro, Santiago Juxtlahuaca
            </div>

            <!-- Espacio para lo de los derechos reservados -->
            <div class="col-12 col-lg-5 align-self-center text-center espacio_derechos">
                &copy Aprende Jugando: Todos los derechos reservados
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>

    <!-- MAIN JS -->
    <script src="js/main.js"></script>
</html>