/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeMap;
import logica.Egreso;

/**
 *
 * @author Andres
 */
public class EgresoDAO {
        
    
        /**
     * Envía la sentencia SQL para almacenar el dato de un egreso
     * @param spend un objeto de tipo Egreso
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoEgreso(Egreso spend) {
        ConexionBD con = new ConexionBD();
              
        String tipoEgreso = spend.getTipoEgreso();
        int idCategoriaEgreso = spend.getIdCategoriaEgreso();
        String fechaEgreso = spend.getFechaEgreso();
        double valorEgreso = spend.getValorEgreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "INSERT INTO egreso(tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario) VALUES ('"+tipoEgreso+"', "+idCategoriaEgreso+", '"+fechaEgreso+"', "+valorEgreso+", '"+descripcion+"', "+idUsuario+")";
        con.conectar();
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

        //Metodo para cargar los diferentes tipos de Género que existen en la BD
    public TreeMap<Integer, String> cargarCategoriaEgresos(){
        TreeMap<Integer, String> listaCategoriaEgresos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM categoria_egresos");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaCategoriaEgresos.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaCategoriaEgresos;
    }

}
