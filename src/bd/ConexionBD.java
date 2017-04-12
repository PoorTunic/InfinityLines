package bd;

//import com.mysql.jdbc.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/** <<Atributos necesarios para conexión>>
 * Nombre de base de datos
 * Ubicación
 * Usuario
 * Contraseña
 */
public class ConexionBD {

    private String nombreDB;
    private String url;
    private String user;
    private String pass;
    
    
public ConexionBD(){
    nombreDB = "verifact";
    user = "root";
    pass = null;
    url = "jdbc:mysql://localhost/"+nombreDB;
}

public Connection conectarBase(){
    Connection cadenaConexion = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cadenaConexion = DriverManager.getConnection(url, user, pass);
            //JOptionPane.showMessageDialog(null, "Conección existosa","Mensaje",JOptionPane.INFORMATION_MESSAGE);
        } catch (ClassNotFoundException ex) {
            // Logger.getLogger(ConexionBase.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "No se encuentra clase Driver","Error",JOptionPane.ERROR_MESSAGE);
            //Si es error en esta seccion, existe error en Class.forName() y que esté instalado JDBC
        } catch (InstantiationException ex) {
            //Logger.getLogger(ConexionBase.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "No se puede crear instancia","Error",JOptionPane.ERROR_MESSAGE);
            //Que se haya instalado el Driver (jdbc o odbc)
        } catch (IllegalAccessException ex) {
            //Logger.getLogger(ConexionBase.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Acceso no permitido","Error",JOptionPane.ERROR_MESSAGE);
            //Que el Driver sea correcto a jdbc u odbc (segun Gestor BD)
        } catch (SQLException ex) {
            //Logger.getLogger(ConexionBase.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "No se puede conectar a la Base de Datos","Error",JOptionPane.ERROR_MESSAGE);
            //En el Driver Manager en el orden correcto(url, user, password), en el constructor no esta inicializado (nombreBD, user, password, url)<Verificar en WAMP>
        }
    return cadenaConexion;
}

//public static void main(String []args){
//    ConexionBD objCB = new ConexionBD();
//    Connection cadenaConexion = objCB.conectarBase();
//}
}