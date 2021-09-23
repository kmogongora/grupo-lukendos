
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
}
