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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ErikHernandez
 */
public class DAOProveedor {
    private int r;

    /**
     * OPERACIONES CRUD
     */
    /* Metodo para agregar un nuevo proveedor*/
    public List listar() {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.proveedor order by id_proveedor";

        List<Proveedor> listaProv = new ArrayList<>();
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Proveedor prov = new Proveedor();
                prov.setId_proveedor(rs.getInt(1));
                prov.setRazon_social(rs.getString(2));
                prov.setCiudad(rs.getString(3));
                prov.setTelefono(rs.getLong(4));
                prov.setEmail(rs.getString(5));
                
                listaProv.add(prov);
            }
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listaProv;
    }

    /* Metodo para listar los proveedores */
    public int agregar(Proveedor prov) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "insert into libreria.proveedor (razon_social, ciudad, telefono, email) values (?,?,?,?);";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ps.setString(1, prov.getRazon_social());
            ps.setString(2, prov.getCiudad());
            ps.setLong(3, prov.getTelefono());
            ps.setString(4, prov.getEmail());
            ps.executeUpdate();
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }
    
    /* Metodo para buscar a un proveedor segun su id */
    public Proveedor buscarProv (int id) {
        Proveedor proveedor = new Proveedor();
        
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.proveedor where id_proveedor = " + id;
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                proveedor.setId_proveedor(rs.getInt(1));
                proveedor.setRazon_social(rs.getString(2));
                proveedor.setCiudad(rs.getString(3));
                proveedor.setTelefono(rs.getLong(4));
                proveedor.setEmail(rs.getString(5));
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return proveedor;
    }
    

    /* Metodo para editar un proveedor */
    public int editar(Proveedor prov) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "update libreria.proveedor set razon_social = ?, ciudad = ?, "
                + "telefono =?, email= ? where id_proveedor = ?;";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ps.setString(1, prov.getRazon_social());
            ps.setString(2, prov.getCiudad());
            ps.setLong(3, prov.getTelefono());
            ps.setString(4, prov.getEmail());
            ps.setInt(5, prov.getId_proveedor());
            ps.executeUpdate();

            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }

    /* Metodo para eliminar un proveedor */
    public void eliminar(int idP) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "delete from libreria.proveedor where id_proveedor = " + idP;

        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ps.executeUpdate();
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}