<%-- 
    Document   : dashboard_cajero
    Created on : 30/01/2021, 06:49:29 PM
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

        <title>Dashboard Cajero</title>
    </head>
    <body>
        <div class="col-12 justify-content-center">
            <h2 class="text-center">Dashboard</h2>
            <!-- <p>Bienvenido al <strong>DASHBOARD PRINCIPAL</strong> </p> -->
        </div>

        <div class="col-12">
            <h3 class="text-center">
                <!-- TARJETA PRODUCTOS -->
                <a href="#" class="btn tarjeta cambio">
                    <i class='bx bx-book-add icon_dash'></i>
                    <div class="card-body cuerpo_tarjeta">
                        <h5 class="card-title">PRODUCTOS</h5>
                    </div>
                </a>

                <!-- TARJETA VENTAS -->
                <a href="Controlador?menu=ventas&accion=default" class="btn tarjeta cambio">
                    <i class='bx bx-cart-alt icon_dash'></i>
                    <div class="card-body cuerpo_tarjeta">
                        <h5 class="card-title">VENTAS</h5>
                    </div>
                </a>

                <!-- TARJETA DEVOLUCIONES -->
                <a href="#" class="btn tarjeta cambio">
                    <i class='bx bx-refresh icon_dash'></i>
                    <div class="card-body cuerpo_tarjeta">
                        <h5 class="card-title">DEVOLUCIONES</h5>
                    </div>
                </a>
            </h3>
        </div>
    </body>
</html>