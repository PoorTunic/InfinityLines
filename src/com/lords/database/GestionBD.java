package com.lords.database;

import com.lords.database.ConexionBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class GestionBD {
    private Connection cadenaConexion;
    private Statement sentencia;
    private ResultSet cdr;
    
    public GestionBD(){
        ConexionBD objCBD = new ConexionBD();
        cadenaConexion = objCBD.conectarBase();
    }
    
    public void altasBajasCambios(String instruccionBD){
        try {
            sentencia = cadenaConexion.createStatement();
            sentencia.executeUpdate(instruccionBD);
        } catch (SQLException ex) {
            Logger.getLogger(GestionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet consultas(String instruccionBD){
        try {
            sentencia = cadenaConexion.createStatement();
            cdr = sentencia.executeQuery(instruccionBD);
            //JOptionPane.showMessageDialog(null, "Consulta Realizada " + cdr, "Query OK", JOptionPane.WARNING_MESSAGE);
        } catch (SQLException ex) {
            Logger.getLogger(GestionBD.class.getName()).log(Level.SEVERE, null, ex);
            // JOptionPane.showMessageDialog(null, "No se puede realizar consulta:\n"+ex, "Error Query", JOptionPane.WARNING_MESSAGE);
        }
        return cdr;
    }
    
}
