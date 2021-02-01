<%-- 
    Document   : registrar_proveedor
    Created on : 30/01/2021, 06:17:54 PM
    Author     : ErikHernandez
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link rel="stylesheet" href="css/style_reg_prov.css">

        <!-- ICONOS -->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'>

        <!-- ICONO PESTAÑA -->
        <link rel="shortcut icon" href="img/icono.png">

        <title>Registrar proveedor</title>
    </head>
    <body>
        <!-- TITULO DE LA VENTANA -->
        <div class="col-12">
            <h2 class="align-self-center text-center">Proveedores</h2>
        </div>

        <div class="row">
            <!-- ESPACIO PARA EL FORMULARIO -->
            <div class="col-12 col-sm-12 col-md-4 formulario">
                <div class="card-body">
                    <div class="col-12">
                        <h4 class="align-self-center text-center">Datos Proveedor</h4>
                    </div>

                    <form class="aplicar-validacion" action="Controlador?menu=Proveedor" method="post" novalidate>
                        <!-- CAMPO PARA LA RAZON SOCIAL -->
                        <div class="form-group">
                            <label>Razón Social</label>
                            <input type="text" name="txtRazon" value="${provEdit.getRazon_social()}" class="form-control" placeholder="Razón Social" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione un nombre correcto</div>
                        </div>

                        <!-- CAMPO PARA EL NUMERO TELEFONICO -->
                        <div class="form-group">
                            <label>Número Telefónico</label>
                            <input type="tel" name="txtTel" value="${provEdit.getTelefono()}" class="form-control" 
                                   placeholder="Número Telefónico" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                   pattern="[0-9]{8,10}" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione un número telefónico correcto</div>
                        </div>

                        <!-- CAMPO PARA EL CORREO ELECTRONICO -->
                        <div class="form-group">
                            <label>Correo Electrónico</label>
                            <input type="email" name="txtEmail" value="${provEdit.getEmail()}" class="form-control" placeholder="Correo Electrónico" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione un correo correcto</div>
                        </div>

                        <!-- CAMPO PARA LA CIUDAD -->
                        <div class="form-group">
                            <label>Ciudad</label>
                            <input type="text" name="txtCiudad" value="${provEdit.getCiudad()}" class="form-control" placeholder="Ciudad" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione una ciudad correcta</div>
                        </div>

                        <!-- ESPACIO PARA LOS BOTONES -->
                        <div class="form-row justify-content-center espacio_boton">
                            <!-- BOTON DE GUARDADO -->
                            <button class="btn btn-primary enviar" value="Agregar" type="submit" name="accion">
                                <i class='bx bx-save nav__icon'></i>
                                <span class="nav__text enviar">Guardar</span>
                            </button>

                            <!-- BOTON PARA LIMPIAR -->
                            <button class="btn btn-secondary enviar enviar2" type="reset">
                                <i class='bx bx-reset nav__icon'></i>
                                <span class="nav__text enviar">Limpiar</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-md-8 tabla">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>RAZÓN SOCIAL</th>
                            <th>TELÉFONO</th>
                            <th>EMAIL</th>
                            <th>CIUDAD</th>
                            <th>OPCIONES</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="pr" items="${proveedores}">
                            <tr>
                                <td>${pr.getId_proveedor()}</td>
                                <td>${pr.getRazon_social()}</td>
                                <td>${pr.getTelefono()}</td>
                                <td>${pr.getEmail()}</td>
                                <td>${pr.getCiudad()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Proveedor&accion=Editar&id=${pr.getId_proveedor()}">
                                        <i class='bx bxs-edit'></i>
                                    </a>
                                    <a class="btn btn-danger" href="Controlador?menu=Proveedor&accion=Eliminar&id=${pr.getId_proveedor()}">
                                        <i class='bx bxs-trash'></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
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