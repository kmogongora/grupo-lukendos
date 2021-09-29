
package tests;

import logica.Egreso;
import logica.Usuario;
import org.testng.Assert;
import org.testng.annotations.Test;
import persistencia.ConexionBD;
import persistencia.RegistroDAO;
import persistencia.EgresoDAO;

/**
 *
 * @author Carolina Bernal
 */
public class TestGeneral {
    
    /** El siguiente test permite verificar que la Conexión a la BD 
     *  se realiza de forma exitosa permitiendo la ejecución de los 
     *  demás requerimientos y consultas sql con las que contará el sistema
     */
    @Test
    public void verificarConexionBD(){
        ConexionBD con = new ConexionBD();
        Assert.assertTrue(con.isConectado(), "No existe ninguna conxion. ");
        con.desconectar();
        Assert.assertFalse(con.isConectado(), "No se cerro la conexion. ");
    }
    
    /** Los test que se presentan a continuación son los encargados
     * de verificar cada uno de los métodos creados en la clase
     * RegistroDAO la cual permite el registro de un usuario en el sistema
     */
    @Test
    public void verificarRegistroUsuario(){
        RegistroDAO registro =  new RegistroDAO();
        Usuario user = new Usuario("123456", "Usuario1", "Prueba", "1991-05-23", 1, "user1@gmail.com", "User01", "123Ad43", "Activo", 3);
        int id = registro.guardarNuevoUsuario(user);
        Assert.assertTrue(id > 0, "No se guardó dato de un usuraio. ");
        String sql = "DELETE FROM usuarios WHERE id = " + id;
        ConexionBD con = new ConexionBD();
        int cant = con.ejecutarUpdate(sql);
        Assert.assertTrue(cant == 1, "No se logró hacer limpieza del dato de prueba de un usuario registrado. ");
        con.desconectar();
    }
    
    @Test
    public void verificarCargaUsuarios() {
        RegistroDAO dao = new RegistroDAO();
        Assert.assertTrue(dao.consultarUsuario().size() > 0, "No se cargaron los datos de los usuarios registrados. ");
    }
    
    @Test
    public void verificarCargaTiposJuguetes() {
        RegistroDAO dao = new RegistroDAO();
        Assert.assertTrue(dao.cargarTiposUsuarios().size() > 0, "No se cargaron los datos de los tipos-Roles de Usuarios. ");
    }
    
    @Test
    public void verificarCargaGeneroUsuarios() {
        RegistroDAO dao = new RegistroDAO();
        Assert.assertTrue(dao.cargarGeneroUsuarios().size() > 0, "No se cargaron los datos de los generos de Usuarios. ");
    }
    
    /** Los test que se presentan a continuación son los encargados
     * de verificar cada uno de los métodos creados en la clase
     * EgresoDAO la cual permite el registro, actualización, y cargue de los
     * registros existentes en la BD.
     */
    @Test
    public void verificarCargaEgresos() {
        EgresoDAO egresoDao = new EgresoDAO();
        Assert.assertTrue(egresoDao.consultarEgresos().size() > 0, "No se cargaron los datos de los egresos registrados. ");
    }
    
    @Test
    public void verificarInsercionEgreso(){
        EgresoDAO egresoDao = new EgresoDAO();
        Egreso spend = new Egreso("Fijo", 1, "2021-09-15", 659000, "Arriendo Negocio", 1);
        int id = egresoDao.guardarNuevoEgreso(spend);
        Assert.assertTrue(id > 0, "No se guardaron los datos del egreso. ");
        String sql = "DELETE FROM egreso WHERE id = " + id;
        ConexionBD con = new ConexionBD();
        int cant = con.ejecutarUpdate(sql);
        Assert.assertTrue(cant == 1, "No se logró hacer limpieza del dato de prueba del egreso registrado. ");
        con.desconectar();
    }
    
    @Test
    public void verificarActualizacionEgreso(){
        EgresoDAO egresoDao = new EgresoDAO();
        Egreso spend = new Egreso(5, "Variable", 3, "2021-09-22", 98000, "Servicio de agua", 1);
        int id = egresoDao.guardarEgresoExistente(spend);
        Assert.assertTrue(id > 0, "No se actualizaron los datos del egreso. ");
    }
    
    @Test
    public void verificarCargaCategoriaEgresos(){
        EgresoDAO egresoDao = new EgresoDAO();
        Assert.assertTrue(egresoDao.cargarCategoriaEgresos().size() > 0, "No se cargaron los datos de las categorias de los Egreso. ");
    }
   
}
