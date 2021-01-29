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
public class DAOEmpleado {
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
}