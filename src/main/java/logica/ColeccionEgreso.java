
package logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.EgresoDAO;
/**
 *
 * @author Andres
 */
public class ColeccionEgreso {
    //Atributos
    private ArrayList<Egreso> listadoEgresos;
    
    public ArrayList<Egreso> getLista(){
        return listadoEgresos;
    }
    
   //Método para sumar los valor de los egresos en la lista
   public double totalEgreso(){
        double totalEgreso = 0.0;
        for(int i=0; i < listadoEgresos.size(); i++){
            totalEgreso = totalEgreso + listadoEgresos.get(i).getValorEgreso();
        }
        return totalEgreso;
   }
    
    public String getCategoriaEgreso(int key){
        EgresoDAO dao = new EgresoDAO();
        TreeMap<Integer, String> listaCtegoriaEgresos = dao.cargarCategoriaEgresos();
        String value = listaCtegoriaEgresos.get(key);
        return value;
    }    
    
    public TreeMap<Integer, String> getCategoriaEgresos() {
        EgresoDAO dao = new EgresoDAO();
        TreeMap<Integer, String> listaCategoriaEgresos = dao.cargarCategoriaEgresos();
        return listaCategoriaEgresos;
    }
    
    
    public boolean cargarEgreso(){
        EgresoDAO dao = new EgresoDAO();
        listadoEgresos = dao.consultarEgresos();
        
        if (listadoEgresos.size() > 0) {
            return true;
        } 
        else {
           return false; 
        }
    }
        
    public boolean guardarNuevoEgreso  (Egreso spend) {
        EgresoDAO dao = new EgresoDAO();
        int id = dao.guardarNuevoEgreso(spend);
        if (id > 0) {
            return true;
        } else {
            return false;
        }
    }
    
        /**
     * Carga la información del gasto total de un usuario de la base de datos
     * @return true si carga gasto, o false si no se logró cargar
     */
    public double cargarSumaEgresos(int idUsuario) {
        EgresoDAO dao = new EgresoDAO();
        double d = dao.sumaGastoTotal(idUsuario);
        return d;
    }
}
