<%-- 
    Document   : dashboard_cajero
    Created on : 28/01/2021, 08:29:04 PM
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
        <link rel="stylesheet" href="css/style_base.css">
        <link rel="stylesheet" href="css/style_login.css">

        <!-- ICONO PESTAÑA -->
        <link rel="shortcut icon" href="img/icono.png">

        <title>Login</title>
    </head>

    <body id="body">
        <!-- ACA SE AGREGA LA PARTE DEL CONTENIDO -->
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-11">
                <div class="card-body">
                    <form class="form-sign aplicar-validacion" action="Validar" method="post" novalidate> 
                        <div class="form-group text-center">
                            <h1>Bienvenido</h1>
                            <img class="img_logo" src="img/logo.jpg" alt="logo"/>
                        </div>
                        
                        <div class="form-group">
                            <label>Usuario: (*)</label>
                            <input type="text" name="txtUser" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label>Contraseña: (*)</label>
                            <input type="password" name="txtPassword" class="form-control" required>
                        </div>
                        
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
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
    <script src="js/valida_form.js"></script>
</html>