/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ErikHernandez
 */
public class ConexionDBMS {

    private final String host = "localhost";
    private final String puerto = "5432";
    private final String baseDatos = "dblibreria";
    public String servidor = "jdbc:postgresql://" + host + ":" + puerto + "/" + baseDatos;
    public String usuario = "postgres";
    public String clave = "admi";

    public Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(servidor, usuario, clave);
        } catch (ClassNotFoundException e) {
            System.err.println(e);
        } catch (SQLException e) {
            System.err.println(e);
        }

        return conexion;
    }
    
    public void desconectar(Connection conexion) throws SQLException{
        conexion.close();
    }
}