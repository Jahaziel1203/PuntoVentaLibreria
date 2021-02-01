<%-- 
    Document   : listar_empleados
    Created on : 30/01/2021, 07:47:16 PM
    Author     : ErikHernandez
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ESTILOS CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style_base.css">
        <link rel="stylesheet" href="css/style_reg_emp.css">

        <!-- ICONOS -->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'>

        <!-- ICONO PESTAÑA -->
        <link rel="shortcut icon" href="img/icono.png">

        <title>Empleados</title>
    </head>
    <body>
        <!-- TITULO DE LA VENTANA -->
        <div class="col-12">
            <h2 class="align-self-center text-center">Empleados</h2>
        </div>

        <div class="row">
            <!-- ESPACIO PARA EL FORMULARIO -->
            <div class="col-12 col-sm-12 col-md-4 formulario">
                <div class="card-body">
                    <div class="col-12">
                        <h4 class="align-self-center text-center">Datos Empleado</h4>
                    </div>

                    <form class="aplicar-validacion" action="Controlador?menu=Empleado" method="post" novalidate>
                        <div class="row">
                            <!-- CAMPO PARA EL NOMBRE -->
                            <div class="form-group col-12 col-md-6">
                                <label>Nombre(s)</label>
                                <input type="text" name="txtNombreEm" value="${empEdit.getNombre()}" class="form-control" 
                                       placeholder="Nombre(s)" required>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione un nombre correcto</div>
                            </div>

                            <!-- CAMPO PARA EL APELLIDO PATERNO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Apellido Paterno</label>
                                <input type="text" name="txtApPat" value="${empEdit.getApellido_paterno()}" class="form-control" 
                                       placeholder="Apelllido paterno" requiered>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione un apellido correcto</div>
                            </div>    
                        </div>

                        <div class="row">
                            <!-- CAMPO PARA EL APELLIDO MATERNO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Apellido Materno</label>
                                <input type="text" name="txtApMat" value="${empEdit.getApellido_materno()}" class="form-control" 
                                       placeholder="Apelllido materno" requiered>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione un apellido correcto</div>
                            </div>

                            <!-- CAMPO PARA EL NUMERO TELEFONICO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Número Telefónico</label>
                                <input type="tel" name="txtTelEm" value="${empEdit.getCelular()}" class="form-control" 
                                       placeholder="Número Telefónico" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                       pattern="[0-9]{8,10}" required>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione un número telefónico correcto</div>
                            </div>    
                        </div>

                        <div class="row">
                            <!-- CAMPO PARA LA FECHA DE INGRESO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Fecha de Ingreso</label>
                                <input type="date" name="txtFechaI" value="${empEdit.getFecha_ingreso()}" class="form-control" 
                                       placeholder="Fecha de ingreso" required>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione una fecha correcta</div>
                            </div>

                            <!-- CAMPO PARA LA FECHA DE NACIMIENTO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Fecha de Nacimiento</label>
                                <input type="date" name="txtFechaN" value="${empEdit.getFecha_nacimiento()}" class="form-control" 
                                       placeholder="Fecha de nacimiento" required>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Proporcione una fecha correcta</div>
                            </div>
                        </div>


                        <div class="row">
                            <!-- CAMPO PARA TURNO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Turno</label>
                                <select name="txtTurno" required class="form-control" value="${empEdit.getTurno()}">
                                    <option value="" disabled selected>--Seleccione--</option>
                                    <option value="Matutino">Matutino</option>
                                    <option value="Vespertino">Vespertino</option>
                                </select>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Seleccione un turno</div>
                            </div>



                            <!-- CAMPO PARA TIPO DE USUARIO -->
                            <div class="form-group col-12 col-md-6">
                                <label>Tipo de usuario</label>
                                <select name="txtTipoUs" id="type_user" class="form-control" value="${empEdit.getTipo_usuario()}" required>
                                    <option value="" disabled selected>--Seleccione--</option>
                                    <option value="administrador">Administrador</option>
                                    <option value="cajero">Cajero</option>
                                    <option value="servicio al cliente">Servicio al cliente</option>
                                </select>
                                <div class="valid-feedback">Correcto</div>
                                <div class="invalid-feedback">Seleccione un tipo de usuario</div>
                            </div>
                        </div>

                                    <div class="row">
                                        <!-- CAMPO PARA EL USUARIO -->
                        <div class="form-group col-12 col-md-6">
                            <label>Nombre de usuario</label>
                            <input type="text" id="name_user" name="txtUsuario" value="${empEdit.getUsuario()}" class="form-control" 
                                   placeholder="Usuario" disabled="true" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione una nombre de usuario</div>
                        </div>

                        <!-- CAMPO PARA EL PASSWORD -->
                        <div class="form-group col-12 col-md-6">
                            <label>Contraseña</label>
                            <input type="text" id="pass_user" name="txtPassw" value="${empEdit.getPass()}" class="form-control" 
                                   placeholder="Contraseña" disabled="true" required>
                            <div class="valid-feedback">Correcto</div>
                            <div class="invalid-feedback">Proporcione una contraseña</div>
                        </div>
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
                            <th>NOMBRE</th>
                            <th>APELLIDO PATERNO</th>
                            <th>FECHA INGRESO</th>
                            <th>TURNO</th>
                            <th>NUMERO TELÉFONICO</th>
                            <th>TIPO USUARIO</th>
                            <th>OPCIONES</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="em" items="${empleados}">
                            <tr>
                                <td>${em.getId_empleado()}</td>
                                <td>${em.getNombre()}</td>
                                <td>${em.getApellido_paterno()}</td>
                                <td>${em.getFecha_ingreso()}</td>
                                <td>${em.getTurno()}</td>
                                <td>${em.getCelular()}</td>
                                <td>${em.getTipo_usuario()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId_empleado()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Empleado&accion=Eliminar&id=${em.getId_empleado()}">Eliminar</a>
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
    <script src="js/habilitaCampos.js"></script>
</html>