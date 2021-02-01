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
public class DAOLibro {
    private int r;
    
    /**
     * OPERACIONES CRUD
     */
    /* Metodo para agregar un nuevo producto*/
    public List listar() {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.prodlibroucto order by id_producto";

        List<Libro> listaLibro = new ArrayList<>();
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Libro libr = new Libro();
                libr.setId_libro(rs.getInt(1));
                libr.setIsbn(rs.getLong(2));
                libr.setTitulo(rs.getString(3));
                libr.setEditorial(rs.getString(4));
                libr.setPrecio_v(rs.getFloat(5));
                libr.setPrecio_c(rs.getFloat(6));
                libr.setExistencia(rs.getInt(7));
                
                DAOProveedor daoPro = new DAOProveedor();
                libr.setId_proveedor(daoPro.buscarProv(rs.getInt(8)));
                
                listaLibro.add(libr);
            }
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listaLibro;
    }

    /* Metodo para listar los productos */
    public int agregar(Libro prod) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "insert into libreria.libro (isbn, titulo, editorial, precio_v, "
                + "precio_c, id_proveedor) values (?, ?, ?, ?, ?, ?);";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ps.setLong(1, prod.getIsbn());
            ps.setString(2, prod.getTitulo());
            ps.setString(3, prod.getEditorial());
            ps.setFloat(4, prod.getPrecio_v());
            ps.setFloat(5, prod.getPrecio_c());
            ps.setInt(6, prod.getId_proveedor().getId_proveedor());
            ps.executeUpdate();
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }
    
    /* Metodo para buscar a un producto segun su id */
    public Libro buscarLibro (int id) {
        Libro producto = new Libro();
        
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.libro where id_libro = " + id;
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                producto.setId_libro(rs.getInt(1));
                producto.setIsbn(rs.getLong(2));
                producto.setTitulo(rs.getString(3));
                producto.setEditorial(rs.getString(4));
                producto.setPrecio_v(rs.getFloat(5));
                producto.setPrecio_c(rs.getFloat(6));
                producto.setExistencia(rs.getInt(7));
                
                DAOProveedor daoP = new DAOProveedor();
                producto.setId_proveedor(daoP.buscarProv(rs.getInt(8)));
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return producto;
    }
    

    /* Metodo para editar un producto */
    public int editar(Libro prod) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "update libreria.libro set isbn = ?, titulo = ?, editorial = ?, precio_v = ?, "
                + "precio_c = ?, existencia = ?, id_proveedor = ?  where id_libro = ?;";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            
            ps.setLong(1, prod.getIsbn());
            ps.setString(2, prod.getTitulo());
            ps.setString(3, prod.getEditorial());
            ps.setFloat(4, prod.getPrecio_v());
            ps.setFloat(5, prod.getPrecio_c());
            ps.setInt(6, prod.getExistencia());
            ps.setInt(7, prod.getId_proveedor().getId_proveedor());
            ps.setInt(8, prod.getId_libro());
            
            ps.executeUpdate();

            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }

    /* Metodo para eliminar un producto */
    public void eliminar(int idP) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "delete from libreria.libro where id_libro = " + idP;

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