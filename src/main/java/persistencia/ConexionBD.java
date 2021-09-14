package persistencia;
/**
 *
 * @author Carolina
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class ConexionBD {
    //Atributos
    private String conectorInstalado = "jdbc:mysql:"; //Conector o driver que se instalo para la conexion
    private String host = "localhost:8889"; //Puerto de conexion
    private String baseDatos = "cuentomislukas"; //Variable que almacena el nombre de la Base de datos para este caso se nombro "cuentomislukas"
    private String username = "root"; //Variable que almacena el nombre de usuario de acceso a la base de datos
    private String password = ""; // Variable que almacena la clave de acceso en este caso se dejo vacio 
    private Connection conexion;//Variable de tipo Connection
    private Statement ejecutor; // Ejecutor de las sentencias SQL
    
    
     public ConexionBD() {
        conectar();
    }
    
    public boolean isConectado() {
        return (this.conexion != null);
    }
      
    //Metodo para Conectar con la BD
    public void conectar()
    {
        //Implementar una estrutura TRY CATCH para controlar las excepciones
        try
        {
            String cadenaConexion = conectorInstalado + "//" + host + "/" + baseDatos; //Cadena de conexion
            Class.forName("com.mysql.cj.jdbc.Driver"); //Driver con el cual va a trabajar
            conexion = DriverManager.getConnection(cadenaConexion, username, password); //Crear conexion con: Cadena de conexion, usuario y contraseña de acceso a la BD
            ejecutor = conexion.createStatement();
            ejecutor.setQueryTimeout(30);  // set timeout to 30 sec.
            //System.out.println("conexión creada: "+conexion);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    //Metodo para consultar datos
    public ResultSet ejecutarQuery(String sql)
    {
        ResultSet rs = null;
        try
        {
            rs = ejecutor.executeQuery(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rs;
    }
    
    //Metodo para actualizar datos
    public ResultSet ejecutarUpdate(String sql)
    {
        ResultSet rs = null;
        try
        {
            int cant = ejecutor.executeUpdate(sql);
            if (cant > 0) {
                rs = ejecutor.getGeneratedKeys();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rs;
    }
    
    //Metodo para cerrar la conexion
    public void desconectar()
    {
        try {
            conexion.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
}
   