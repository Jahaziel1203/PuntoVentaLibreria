/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Config.GenerarSerie;
import Modelo.DAOEmpleado;
import Modelo.DAOLibro;
import Modelo.DAOProveedor;
import Modelo.DAOVenta;
import Modelo.Empleado;
import Modelo.Libro;
import Modelo.Proveedor;
import Modelo.Venta;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ErikHernandez
 */
public class Controlador extends HttpServlet {

    private Proveedor prov = new Proveedor();
    private DAOProveedor daoProv = new DAOProveedor();
    private Empleado empl = new Empleado();
    private DAOEmpleado daoEmpl = new DAOEmpleado();
    private Libro libr = new Libro();
    private DAOLibro daoLibr = new DAOLibro();
    private Venta vent = new Venta();
    private DAOVenta daoVen = new DAOVenta();
    private int idProv, idEmpl, idLibr;
    private boolean flagProv, flagEmpl, flagLibr;

    private List<Venta> lista = new ArrayList<>();
    private int item, id_Prod, cant;
    private String titulo, numeroSerie;
    private float precio, subtotal, totalPagar;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("principal_admin")) {
            request.getRequestDispatcher("principal_admin.jsp").forward(request, response);
        }
        if (menu.equals("principal_cajero")) {
            request.getRequestDispatcher("principal_cajero.jsp").forward(request, response);
        }
        if (menu.equals("dashboard_admin")) {
            request.getRequestDispatcher("dashboard_admin.jsp").forward(request, response);
        }
        if (menu.equals("dashboard_cajero")) {
            request.getRequestDispatcher("dashboard_cajero.jsp").forward(request, response);
        }
        if (menu.equals("compras")) {
            request.getRequestDispatcher("compras.jsp").forward(request, response);
        }
        if (menu.equals("devoluciones")) {
            request.getRequestDispatcher("devoluciones.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {
            switch (accion) {
                case "Listar":
                    List listaE = daoEmpl.listar();
                    request.setAttribute("empleados", listaE);
                    break;
                case "Agregar":
                    System.out.println(request.getParameter("txtFechaI") + "   " + request.getParameter("txtFechaN"));

                    String nombre = request.getParameter("txtNombreEm");
                    String apellido_paterno = request.getParameter("txtApPat");
                    String apellido_materno = request.getParameter("txtApMat");

                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                    Date fecha_ingreso = null;
                    Date fecha_nacimiento = null;
                    try {
                        java.util.Date fecha_ingresoU = (java.util.Date) formato.parse(request.getParameter("txtFechaI"));
                        java.util.Date fecha_nacimientoU = (java.util.Date) formato.parse(request.getParameter("txtFechaN"));

                        fecha_ingreso = new java.sql.Date(fecha_ingresoU.getTime());
                        fecha_nacimiento = new java.sql.Date(fecha_nacimientoU.getTime());

                    } catch (ParseException ex) {
                        System.err.println(ex);
                    }

                    String turno = request.getParameter("txtTurno");

                    long numero = 0;
                    try {
                        numero = Long.parseLong(request.getParameter("txtTelEm"));
                    } catch (NumberFormatException e) {
                        System.err.println("Error en la conversion del telefono");
                    }

                    String tipo_usuario = request.getParameter("txtTipoUs");
                    String usuario = request.getParameter("txtUsuario");
                    String pass = request.getParameter("txtPassw");
                    String estado = "activo";

                    empl.setNombre(nombre);
                    empl.setApellido_paterno(apellido_paterno);
                    empl.setApellido_materno(apellido_materno);
                    empl.setFecha_ingreso(fecha_ingreso);
                    empl.setFecha_nacimiento(fecha_nacimiento);
                    empl.setTurno(turno);
                    empl.setCelular(numero);
                    empl.setTipo_usuario(tipo_usuario);
                    empl.setUsuario(usuario);
                    empl.setPass(pass);
                    empl.setEstado(estado);

                    if (flagEmpl) { // Se edita
                        empl.setId_empleado(idEmpl);
                        daoEmpl.editar(empl);
                        flagEmpl = false;
                    } else // Se inserta
                    {
                        daoEmpl.agregar(empl);
                    }

                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

                    break;

                case "Eliminar":
                    idEmpl = Integer.parseInt(request.getParameter("id"));
                    daoEmpl.eliminar(idEmpl);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    flagEmpl = false;
                    break;
                case "Editar":
                    flagEmpl = true;
                    idEmpl = Integer.parseInt(request.getParameter("id"));
                    Empleado em = daoEmpl.buscarEmpl(idEmpl);
                    request.setAttribute("empEdit", em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("empleados.jsp").forward(request, response);
        }
        if (menu.equals("listar_productos")) {
            request.getRequestDispatcher("listar_productos.jsp").forward(request, response);
        }
        if (menu.equals("Proveedor")) {
            switch (accion) {
                case "Listar":
                    List listaP = daoProv.listar();
                    request.setAttribute("proveedores", listaP);
                    break;
                case "Agregar":
                    String razon_social = request.getParameter("txtRazon");
                    long numero = 0;
                    try {
                        numero = Long.parseLong(request.getParameter("txtTel"));
                    } catch (NumberFormatException e) {
                        System.err.println("Error en la conversion del telefono");
                    }
                    String email = request.getParameter("txtEmail");
                    String ciudad = request.getParameter("txtCiudad");
                    prov.setRazon_social(razon_social);
                    prov.setTelefono(numero);
                    prov.setEmail(email);
                    prov.setCiudad(ciudad);

                    if (flagProv) { // Se edita
                        prov.setId_proveedor(idProv);
                        daoProv.editar(prov);
                        flagProv = false;
                    } else // Se inserta
                    {
                        daoProv.agregar(prov);
                    }

                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);

                    break;

                case "Eliminar":
                    idProv = Integer.parseInt(request.getParameter("id"));
                    daoProv.eliminar(idProv);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    flagProv = false;
                    break;
                case "Editar":
                    flagProv = true;
                    idProv = Integer.parseInt(request.getParameter("id"));
                    Proveedor pr = daoProv.buscarProv(idProv);
                    request.setAttribute("provEdit", pr);
                    request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }

            request.getRequestDispatcher("proveedores.jsp").forward(request, response);
        }
        if (menu.equals("registrar_producto")) {
            request.getRequestDispatcher("registrar_producto.jsp").forward(request, response);
        }
        if (menu.equals("reportes")) {
            request.getRequestDispatcher("reportes.jsp").forward(request, response);
        }
        if (menu.equals("ventas")) {
            switch (accion) {
                case "Buscar":
                    int idProd = Integer.parseInt(request.getParameter("codProducto"));
                    libr = daoLibr.buscarLibro(idProd);
                    request.setAttribute("producto", libr);

                    totalPagar = 0;

                    if (lista.size() > 0) {
                        for (int x = 0; x < lista.size(); x++) {
                            totalPagar = totalPagar + lista.get(x).getSubtotal();
                        }

                        request.setAttribute("nSerie", numeroSerie);
                        request.setAttribute("totalPagar", totalPagar);
                        request.setAttribute("listLibros", lista);
                    }
                    break;
                case "Agregar":
                    totalPagar = 0;
                    item = item + 1;
                    id_Prod = libr.getId_libro();
                    titulo = libr.getTitulo();
                    precio = libr.getPrecio_v();
                    cant = Integer.parseInt(request.getParameter("cantidad"));
                    subtotal = precio * cant;

                    vent = new Venta();
                    vent.setItem(item);
                    vent.setId_producto(id_Prod);
                    vent.setTitulo(titulo);
                    vent.setPrecio_v(precio);
                    vent.setCantidad(cant);
                    vent.setSubtotal(subtotal);

                    lista.add(vent);

                    for (int x = 0; x < lista.size(); x++) {
                        totalPagar = totalPagar + lista.get(x).getSubtotal();
                    }

                    if (lista.size() > 0) {
                        request.setAttribute("nSerie", numeroSerie);
                        request.setAttribute("totalPagar", totalPagar);
                        request.setAttribute("listLibros", lista);
                    }
                    break;
                case "GenerarVenta":
                    /* Guardar venta */
                    vent.setId_empleado(1);
                    vent.setNumSerie(numeroSerie);
                    vent.setMonto(totalPagar);
                    //daoVen.guardarVenta(vent);
                    
                    /* Guardar detalles de la venta */
                    int idV = daoVen.maxIdVentas();
                    for (int x = 0; x < lista.size(); x++) {
                        vent = new Venta();
                        vent.setId_venta(idV);
                        vent.setId_producto(lista.get(x).getId_producto());
                        vent.setCantidad(lista.get(x).getCantidad());
                        vent.setPrecio_v(lista.get(x).getPrecio_v());
                        
                        //daoVen.guardarDetalleVenta(vent);
                    }
                    break;
                default:
                    numeroSerie = daoVen.generarSerie();
                    if (numeroSerie == null) {
                        numeroSerie = "00000001";
                        request.setAttribute("nSerie", numeroSerie);
                    } else {
                        int incrementar = Integer.parseInt(numeroSerie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroSerie = gs.numeroSerie(incrementar);
                        request.setAttribute("nSerie", numeroSerie);
                    }
                    request.getRequestDispatcher("ventas.jsp").forward(request, response);
            }

            request.getRequestDispatcher("ventas.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
