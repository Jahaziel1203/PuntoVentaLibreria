/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import Config.ConexionDBMS;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.swing.JOptionPane;
/**
 *
 * @author daniel
 */
public class DAOReporte {
    
    public ArrayList<Reporte> reporteVentas(String fechaI, String fechaF){
        ArrayList<Reporte> reporteVentas = new ArrayList<Reporte>();
        ConexionDBMS cn = new ConexionDBMS();
        Connection c =cn.conectar();
        String sql = "SELECT fecha, sum(cantidad*precio_v)  as total FROM libreria.venta "
                + "NATURAL JOIN libreria.detalle_venta WHERE fecha BETWEEN "
                + "'"+fechaI+"' AND '"+fechaF+"'GROUP BY fecha ORDER BY fecha;";
        PreparedStatement ps;
        try {
            ps=c.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Reporte r = new Reporte();
                r.setFecha(rs.getString("fecha"));
                r.setTotal(rs.getFloat("total"));
                r.setOperacion("Venta");
                reporteVentas.add(r);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            Logger.getLogger(DAOReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reporteVentas;
    }
    
    public ArrayList<Reporte> reporteCompras(String fechaI, String fechaF){
        ArrayList<Reporte> reporteCompras = new ArrayList<Reporte>();
        ConexionDBMS cn = new ConexionDBMS();
        Connection c =cn.conectar();
        String sql = "SELECT fecha, sum(cantidad*precio_c)  as total FROM libreria.compra "
                + "NATURAL JOIN libreria.detalle_compra NATURAL JOIN libreria.libro WHERE fecha BETWEEN "
                + "'"+fechaI+"' AND '"+fechaF+"'GROUP BY fecha ORDER BY fecha;";
        PreparedStatement ps;
        try {
            ps=c.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Reporte r = new Reporte();
                r.setFecha(rs.getString("fecha"));
                r.setTotal(rs.getFloat("total")*-1);
                r.setOperacion("Compra");
                reporteCompras.add(r);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            Logger.getLogger(DAOReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reporteCompras;
    }
    
    public ArrayList<Reporte> reporteTotal(String fechaI, String fechaF){
        ArrayList<Reporte> reporteTotal = new ArrayList<Reporte>();
        ConexionDBMS cn = new ConexionDBMS();
        Connection c =cn.conectar();
        String sql = "SELECT v.fecha, v.total, c.fecha as cfecha, c.total as ctotal FROM reporteVentas('"+fechaI+"','"+fechaF+"') as v "
                + "FULL OUTER JOIN reporteCompras('"+fechaI+"','"+fechaF+"')  as c "
                + "on v.fecha=c.fecha;";
        PreparedStatement ps;
        try {
            ps=c.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String fechaV="";
                String fechaC="";
                fechaV=rs.getString("fecha");
                fechaC=rs.getString("cfecha");
                float totalV=rs.getFloat("total");
                float totalC=rs.getFloat("ctotal");
                if(fechaV==null){
                    Reporte r = new Reporte();
                    r.setFecha(fechaC);
                    r.setTotal(0);
                    r.setOperacion("Venta");
                    reporteTotal.add(r);
                    Reporte r2 = new Reporte();
                    r2.setFecha(fechaC);
                    r2.setTotal(totalC*-1);
                    r2.setOperacion("Compra");
                    reporteTotal.add(r2);
                }
                else if(fechaC==null){
                    Reporte r = new Reporte();
                    r.setFecha(fechaV);
                    r.setTotal(totalV);
                    r.setOperacion("Venta");
                    reporteTotal.add(r);
                    Reporte r2 = new Reporte();
                    r2.setFecha(fechaV);
                    r2.setTotal(0);
                    r2.setOperacion("Compra");
                    reporteTotal.add(r2);
                }
                else{
                    Reporte r = new Reporte();
                    r.setFecha(fechaV);
                    r.setTotal(totalV);
                    r.setOperacion("Venta");
                    reporteTotal.add(r);
                    Reporte r2 = new Reporte();
                    r2.setFecha(fechaC);
                    r2.setTotal(totalC);
                    r2.setOperacion("Compra");
                    reporteTotal.add(r2);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return reporteTotal;
    }   
}