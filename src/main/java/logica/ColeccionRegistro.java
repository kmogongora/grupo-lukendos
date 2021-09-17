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