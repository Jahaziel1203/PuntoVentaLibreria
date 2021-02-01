/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Config.ConexionDBMS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ErikHernandez
 */
public class DAOVenta {
    private Connection cn;
    private ConexionDBMS cnDBMS;
    private PreparedStatement ps;
    private ResultSet rs;
    private int r;
    
    public String generarSerie () {
        cnDBMS = new ConexionDBMS ();
        String numeroSerie = "";
        String sql = "select max(numSerie) from libreria.venta;";
        
        try {
            cn = cnDBMS.conectar();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                numeroSerie = rs.getString(1);
            }
            
            cnDBMS.desconectar(cn);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        return numeroSerie;
    }
    
    public int maxIdVentas () {
        int idVenta = 0;
        String sql = "select max (id_venta) from libreria.venta;";
        
        try {
            cn = cnDBMS.conectar();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                idVenta = rs.getInt(1);
            }
            
            cnDBMS.desconectar(cn);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        return idVenta;
    }
    
    public int guardarVenta (Venta vent) {
        String sql = "insert into libreria.venta (id_empleado, numSerie) values (?, ?);";
        
        try {
            cn = cnDBMS.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, vent.getId_empleado());
            ps.setString(2, vent.getNumSerie());
            
            ps.executeUpdate();
            
            cnDBMS.desconectar(cn);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        return r;
    }
    
    public int guardarDetalleVenta (Venta venta) {
        String sql = "insert into libreria.detalle_venta (id_venta, id_libro, cantidad, precio_v) values (?, ?, ?, ?)";
        
        try {
            cn = cnDBMS.conectar();
            ps = cn.prepareStatement(sql);
            
            ps.setInt(1, venta.getId_venta());
            ps.setInt(2, venta.getId_producto());
            ps.setInt(3, venta.getCantidad());
            ps.setFloat(4, venta.getPrecio_v()  );
            
            ps.executeUpdate();
            
            cnDBMS.desconectar(cn);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return r;
    }  
}