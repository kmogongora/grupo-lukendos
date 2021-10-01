/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import logica.Ingreso;

/**
 *
 * @author Andres
 */
public class IngresoDAO {
    
    //Metodo que devolvera un ArrayList con los datos de los Egresos registrados
    public ArrayList<Ingreso> consultarIngresos(){
        ArrayList<Ingreso> listaIngresos = new ArrayList<>(); 
        ConexionBD con = new ConexionBD(); 
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario FROM ingreso"); 
       
        try {
            while (rs.next()) { 
                int id = rs.getInt("id");
                String tipoIngreso = rs.getString("tipoIngreso");
                int idCategoriaIngreso = rs.getInt("idCategoriaIngreso");
                String fechaIngreso = rs.getString("fechaIngreso");
                double valorIngreso = rs.getDouble("valorIngreso");
                String descripcion = rs.getString("descripcion");
                int idUsuario = rs.getInt("idUsuario");
                
                Ingreso spend = new Ingreso(id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
                listaIngresos.add(spend);
            }
            
        } catch (SQLException ex){
            return null;            
        }
        return listaIngresos;  
    }    
    
    /**
     * Envía la sentencia SQL para almacenar el dato de un egreso
     * @param spend un objeto de tipo Egreso
     * @return in número indicando el id generado por la base de datos
     */
    public int guardarNuevoIngreso(Ingreso spend) {
        ConexionBD con = new ConexionBD();
              
        String tipoIngreso = spend.getTipoIngreso();
        int idCategoriaIngreso = spend.getIdCategoriaIngreso();
        String fechaIngreso = spend.getFechaIngreso();
        double valorIngreso = spend.getValorIngreso();
        String descripcion = spend.getDescripcion();
        int idUsuario = spend.getIdUsuario();
        
        String sql = "INSERT INTO Ingreso(tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario) VALUES ('"+tipoIngreso+"', "+idCategoriaIngreso+", '"+fechaIngreso+"', "+valorIngreso+", '"+descripcion+"', "+idUsuario+")";
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
    public TreeMap<Integer, String> cargarCategoriaIngresos(){
        TreeMap<Integer, String> listaCategoriaIngresos = new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        con.conectar();
        ResultSet rs = con.ejecutarQuery("SELECT id, nombre FROM categoria_ingresos");
        
        try{
            while (rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                listaCategoriaIngresos.put(id, nombre);
            }
            
        } catch (SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaCategoriaIngresos;
    }

    
     /**
     * Envía la sentencia SQL para obtener la información del gasto total del usuario específico y estructura
     * la respuesta en un double
     * @param idAConsultar el id del usuario para consultar
     * @return un double con el gasto total información cargada o null
     */
    public double sumaIngresoTotal(int idAConsultar) {
        idAConsultar = 1;
        ConexionBD con = new ConexionBD();
        String sql = "SELECT SUM(valorIngreso) IngresoTotal " +
                     "FROM cuentomislukas.ingreso "+
                     "WHERE idUsuario = "+ idAConsultar;
        ResultSet rs = con.ejecutarQuery(sql);
        try {
            if (rs.next()) {
                double IngresoTotal = rs.getDouble("IngresoTotal");
            }
        } catch (SQLException ex) {
            con.desconectar();
            return 0;
        }
        con.desconectar();
        return 0;
    }

}
