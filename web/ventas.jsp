<%-- 
    Document   : Venta
    Created on : 30/01/2021, 06:56:44 PM
    Author     : ErikHernandez
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ESTILOS CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style_base.css">
        <link rel="stylesheet" href="css/style_venta.css">

        <!-- ICONOS -->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'>

        <!-- ICONO PESTAÑA -->
        <link rel="shortcut icon" href="img/icono.png">

        <title>Registrar Venta</title>
    </head>
    <body>
        <!-- TITULO DE LA VENTANA -->
        <div class="col-12">
            <h2 class="align-self-center text-center">Ventas</h2>
        </div>

        <div class="row">
            <div class="col-12 col-md-4">
                <div class="card">
                    <form action="Controlador?menu=ventas" method="post">
                        <div class="card-body">
                            <!-- REFERENTE A LOS DATOS DEL EMPLEADO -->
                            <!--
                            <div class="form-group">
                                Datos del empleado
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codEmpleado" class="form-control" placeholder="Código">
                                    <input type="submit" name="accion" value="Buscar" class="btn btn-outline-info">
                                </div>

                                <div class="col-sm-6">
                                    <input type="text" name="nomEmpleado" class="form-control" placeholder="Nombre">
                                </div>
                            </div>
                            -->

                            <!-- REFERENTE A LOS DATOS DEL PRODUCTO -->
                            <div class="form-group">
                                Datos del producto
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 d-flex">
                                    <input type="tel" name="codProducto" value="${producto.getId_libro()}" class="form-control" 
                                           placeholder="Código" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                    <input type="submit" name="accion" value="Buscar" class="btn btn-outline-info">
                                </div>

                                <div class="col-sm-6">
                                    <input type="text" name="nomProducto" value="${producto.getTitulo()}" class="form-control" 
                                           placeholder="Nombre" disabled>
                                </div>
                            </div>

                            <!-- REFERENTE A LOS DETALLES DEL PRODUCTO -->
                            <div class="form-group row">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="precio" value="${producto.getPrecio_v()}" class="form-control" placeholder="0.00">
                                </div>

                                <div class="col-sm-3">
                                    <input type="number" name="cantidad" value="1" class="form-control">
                                </div>

                                <div class="col-sm-3">
                                    <input type="text" name="stock" value="${producto.getExistencia()}" class="form-control" 
                                           placeholder="Stock" disabled="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-outline-success">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-12 col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="col-sm-5 ml-auto row">
                            <label class="col-4 ml-auto">No. Serie:</label>
                            <input type="text" name="No. Serie" value="${nSerie}" class="form-control col-8" disabled>
                        </div>

                        <br>

                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>Num.</th>
                                    <th>Código</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>SubTotal</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="list" items="${listLibros}">
                                    <tr>
                                        <td>${list.getItem()}</td>
                                        <td>${list.getId_producto()}</td>
                                        <td>${list.getTitulo()}</td>
                                        <td>${list.getPrecio_v()}</td>
                                        <td>${list.getCantidad()}</td>
                                        <td>${list.getSubtotal()}</td>
                                        <td>
                                            <a class="btn btn-warning">
                                                <i class='bx bxs-edit' ></i>
                                            </a>
                                            <a class="btn btn-danger">
                                                <i class='bx bx-trash'></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="card-footer row">
                        <div class="col-sm-6">
                            <a type="submit" name="accion" value="Generar Venta" class="btn btn-success">
                                <i class='bx bx-check-shield'> Generar venta</i>
                            </a>
                            <a type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                                <i class='bx bx-x-circle' > Cancelar</i>
                            </a>
                        </div>
                        
                        <div class="col-sm-3"></div>

                        <div col-sm-3 ml-auto>
                            <input type="text" name="txtTotal" value="$ ${totalPagar}0" class="form-control" disabled="">
                        </div>
                    </div>
                </div>


            </div>
        </div>













        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>

    <!-- MAIN JS -->
    <script src="js/main.js"></script>
    <script src="js/valida_form.js"></script>
</html>