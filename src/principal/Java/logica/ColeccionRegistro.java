/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;


import java.util.ArrayList;
import persistencia.RegistroDAO;
/**
 *
 * @author Andres
 */
/**
 * Contiene la lógica requerida para gestionar la información de los usuarios
 */
public class ColeccionRegistro {
    
        /**
     * Guarda la información de un usuario capturada desde el formulario
     *
     * @param u un objeto con los datos de un juguete específico
     * @return true si guarda el juguete en la base de datos, o false si no lo
     * guarda
     */
    public boolean guardarUsuario(Usuario u) {
        RegistroDAO dao = new RegistroDAO();
        int id = dao.guardarNuevoUsuario(u);
        if (id > 0) {
            return true;
        } else {
            return false;
        }
    }
}

    /**
    private ArrayList<Usuario> lista;

    /**
     * Obtiene una lista de Usuario
     *
     * @return una estructura de datos con los datos de los usuarios requeridos
     */
    /**
    public ArrayList<Usuario> getLista() {
        return lista;
    }
*/
    /**
     * Carga la información de todos los usuarios de la base de datos
     *
     * @return true si carga los usuarios, o false si no se logró cargar
     
    public boolean cargarTodosLosUsuarios() {
        RegistroDAO dao = new RegistroDAO();
        lista = dao.consultarUsuario();
        if (lista.size() > 0) {
            return true;
        } else {
            return false;
        }
    }


}
