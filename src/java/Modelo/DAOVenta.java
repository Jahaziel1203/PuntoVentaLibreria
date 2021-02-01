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
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        
        
        return numeroSerie;
    }
}
