<%-- 
    Document   : reportes
    Created on : 30/01/2021, 07:52:08 PM
    Author     : ErikHernandez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ESTILOS CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style_base.css">
        <link rel="stylesheet" href="css/style_reporte.css">
        <link rel="stylesheet" href="css/printReporte.css">

        <!-- ICONOS -->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'>

        <title>Generar reportes</title>
    </head>

    <body>
        <!-- TITULO DE LA VENTANA -->
        <div class="col-12">
            <h2 class="align-self-center text-center">Ventas</h2>
        </div>

        <div class="container">
            <form action="Controlador?menu=reportes" method="POST">
                <div class="mt-3">
                    <h3 class="text-center">Periodo comprendido</h3>
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="fechaI">Fecha inicial:</label>
                        <input type="date" name="fecha_i" value="${fechaInicial}" id="fechaI" class="form-control"/>
                    </div>
                    <div class="col-6">
                        <label for="fechaF">Fecha Final:</label>
                        <input type="date" name="fecha_f" value="${fechaFinal}" id="fechaF" class="form-control"/>
                    </div>
                </div>
                <br>
                <div class="row d-flex justify-content-center">
                    <button type="submit" name="accion" value="generarReporte" class="btn btn-info">Generar Reporte</button>
                    <div class="h3">${formatoFecha}</div>
                </div>
                
                <br><br>
            </form>

            <div>
                <h3 class="text-center">Reporte de movimientos</h3>
            </div>

            <div class="row table-responsive ml-3">
                <table class="table table-bordered table-hover"> <!-- table table-bordered table-responsive table-hover -->
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Descripcion</th>
                            <th>Balance($)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="movimiento" items="${reporte}">
                            <tr>
                                <td>${movimiento.getFecha()}</td>
                                <td>${movimiento.getOperacion()}</td>
                                <td>$${movimiento.getTotal()}0</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
                
            <br>
            <div class="h2 text-center">${totalReporte}</div>
            <br>
            
            <div class="row d-flex justify-content-center">
                <button type="submit" name="accion" value="imprimirReporte" onclick="print()" class="btn btn-success">Imprimir reporte</button>
            </div>
        </div>

    </body>
</html>