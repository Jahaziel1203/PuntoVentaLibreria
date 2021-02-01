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
public class DAOEmpleado {
    private int r;
    
    public Empleado validar (String usuario, String pass) {
        Empleado empleado = new Empleado();
        ConexionDBMS cn = new ConexionDBMS();
        Connection c = cn.conectar();
        
        String sql = "select * from libreria.empleado where usuario = ? and pass = ?";
        
        PreparedStatement ps;
        try {
            ps = c.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                empleado.setId_empleado(rs.getInt("id_empleado"));
                empleado.setUsuario(rs.getString("usuario"));
                empleado.setPass(rs.getString("pass"));
                empleado.setNombre(rs.getString("nombre"));
                empleado.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (SQLException ex) {
            System.out.println (ex);
        }
        
        return empleado;
    }
    
    /**
     * OPERACIONES CRUD
     */
    /* Metodo para agregar un nuevo empleado */
    public List listar() {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.empleado order by id_empleado";

        List<Empleado> listaEmpl = new ArrayList<>();
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Empleado empl = new Empleado();
                empl.setId_empleado(rs.getInt(1));
                empl.setNombre(rs.getString(2));
                empl.setApellido_materno(rs.getString(3));
                empl.setApellido_paterno(rs.getString(4));
                empl.setFecha_ingreso(rs.getDate(5));
                empl.setFecha_nacimiento(rs.getDate(6));
                empl.setTurno(rs.getString(7));
                empl.setTipo_usuario(rs.getString(8));
                empl.setCelular(rs.getLong(9));
                empl.setPass(rs.getString(10));
                empl.setUsuario(rs.getString(11));
                listaEmpl.add(empl);
            }
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listaEmpl;
    }

    /* Metodo para listar los empleados */
    public int agregar(Empleado empl) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "insert into libreria.empleado (nombre, apellido_materno, apellido_paterno, "
                + "fecha_ingreso, fecha_nacimiento, turno, celular, tipo_usuario, usuario, pass) "
                + "values (?,?,?,?,?,?,?,?,?,?);";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            
            ps.setString(1, empl.getNombre());
            ps.setString(2, empl.getApellido_materno());
            ps.setString(3, empl.getApellido_paterno());
            ps.setDate(4, empl.getFecha_ingreso());
            ps.setDate(5, empl.getFecha_nacimiento());
            ps.setString(6, empl.getTurno());
            ps.setLong(7, empl.getCelular());
            ps.setString(8, empl.getTipo_usuario());
            ps.setString(9, empl.getUsuario());
            ps.setString(10, empl.getPass());
            
            ps.executeUpdate();
            
            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }
    
    /* Metodo para buscar a un empleado segun su id */
    public Empleado buscarEmpl (int id) {
        Empleado empleado = new Empleado();
        
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "select * from libreria.empleado where id_empleado = " + id;
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                empleado.setId_empleado(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setApellido_materno(rs.getString(3));
                empleado.setApellido_paterno(rs.getString(4));
                empleado.setFecha_ingreso(rs.getDate(5));
                empleado.setFecha_nacimiento(rs.getDate(6));
                empleado.setTurno(rs.getString(7));
                empleado.setTipo_usuario(rs.getString(8));
                empleado.setCelular(rs.getLong(9));
                empleado.setPass(rs.getString(10));
                empleado.setUsuario(rs.getString(11));
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return empleado;
    }
    

    /* Metodo para editar un empleado */
    public int editar(Empleado empl) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "update libreria.empleado set nombre = ?, apellido_materno = ?, apellido_paterno = ?, "
                + "fecha_ingreso = ?, fecha_nacimiento = ?, turno = ?, celular = ?, tipo_usuario = ?, "
                + "usuario = ?, pass = ? where id_empleado = ?;";
        
        try {
            c = cn.conectar();
            ps = c.prepareStatement(sql);
            
            ps.setString(1, empl.getNombre());
            ps.setString(2, empl.getApellido_materno());
            ps.setString(3, empl.getApellido_paterno());
            ps.setDate(4, empl.getFecha_ingreso());
            ps.setDate(5, empl.getFecha_nacimiento());
            ps.setString(6, empl.getTurno());
            ps.setLong(7, empl.getCelular());
            ps.setString(8, empl.getTipo_usuario());
            ps.setString(9, empl.getUsuario());
            ps.setString(10, empl.getPass());
            ps.setInt(11, empl.getId_empleado());
            
            ps.executeUpdate();

            cn.desconectar(c);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return r;
    }

    /* Metodo para eliminar un empleado */
    public void eliminar(int idE) {
        ConexionDBMS cn = new ConexionDBMS();
        Connection c;
        PreparedStatement ps;
        
        String sql = "delete from libreria.empleado where id_empleado = " + idE;

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