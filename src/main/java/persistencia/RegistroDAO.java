package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Usuario;


/**
 * Contiene todas las operaciones CRUD requeridas para los datos de los juguetes
 * @author Cielo Juliana
 */
public class RegistroDAO {

    /**
     * Envía la sentencia SQL para obtener la lista de todos los juguetes y estructura
     * la respuesta en una estructura de datos
     * @return una estructura de datos con los objetos de tipo juguete

    public ArrayList<Usuario> consultarJuguetes() {
        ArrayList<Juguete> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre, tipo, fechacompra, estado, disponibilidad FROM juguetes ");
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String tipo = rs.getString("tipo");
                String fechaCompra = rs.getString("fechacompra");
                String estado = rs.getString("estado");
                String disponibilidad = rs.getString("disponibilidad");
                Juguete j = new Juguete(id, nombre, tipo, fechaCompra, estado, disponibilidad);
                lista.add(j);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
         */
    /**
     * Envía la sentencia SQL para almacenar el dato de un juguete
     * @param j un objeto de tipo Usuario
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoUsuario(Usuario j) {
        ConexionBD con = new ConexionBD();
        String nombre = j.getNombre();
        String apellido = j.getApellido();
      
        String documento  = j.getDocumento();
        int genero = j.getGenero();
        date fechaNacimiento = j.getFechaNacimiento();
        String email  = j.getEmail();
        String nombreUsuario = j.getDocumento();
        String claveAcceso  = j.getClaveAcceso();
        
        
        String sql = "INSERT INTO usuario (nombre, apellido, documento, genero, fechaNacimiento, email, nombreUsuario, claveAcceso) VALUES ('"+nombre+"', '"+apellido+"', '"+documento+"', '"+genero+"', '"+email+"','"+nombreUsuario+"','"+claveAcceso+"') ";
        System.out.println(sql);
        ResultSet rs = con.ejecutarInsert(sql);
        int id = 0;
        try {
            if (rs.next()){
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            con.desconectar();
            return 0; 
        }
        con.desconectar();
        return id;
    }
}
