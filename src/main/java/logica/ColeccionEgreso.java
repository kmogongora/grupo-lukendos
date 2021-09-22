/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;
import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.EgresoDAO;
/**
 *
 * @author Andres
 */
public class ColeccionEgreso {
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
