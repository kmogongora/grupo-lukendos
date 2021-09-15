
package logica;

import java.sql.*;

/**
 *
 * @author Carolina
 */
public class Usuario {
    //Atributos
    private int idUsuario;
    private String documento;
    private String nombre;
    private String apellido;
    private String genero;
    private Date fechaNacimiento;
    private String email;
    private String nombreUsuario;
    private String claveAcceso;
    private String estadoUsuario;
    private int rolUsuario;
    
    //Constructor sin parametros
    public Usuario() {
    }
    
    //Constructor con parametros pero sin ID
    public Usuario(String documento, String nombre, String apellido, String genero, Date fechaNacimiento, String email, String nombreUsuario, String claveAcceso, String estadoUsuario, int rolUsuario) {
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.fechaNacimiento = fechaNacimiento;
        this.email = email;
        this.nombreUsuario = nombreUsuario;
        this.claveAcceso = claveAcceso;
        this.estadoUsuario = estadoUsuario;
        this.rolUsuario = rolUsuario;
    }
    
    
    //Constructor con parametros
    public Usuario(int idUsuario, String documento, String nombre, String apellido, String genero, Date fechaNacimiento, String email, String nombreUsuario, String claveAcceso, String estadoUsuario, int rolUsuario) {
        this.idUsuario = idUsuario;
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.fechaNacimiento = fechaNacimiento;
        this.email = email;
        this.nombreUsuario = nombreUsuario;
        this.claveAcceso = claveAcceso;
        this.estadoUsuario = estadoUsuario;
        this.rolUsuario = rolUsuario;
    }
    
    //Metodos para encapsular atributos (Setters y Getters)
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getClaveAcceso() {
        return claveAcceso;
    }

    public void setClaveAcceso(String claveAcceso) {
        this.claveAcceso = claveAcceso;
    }

    public String getEstadoUsuario() {
        return estadoUsuario;
    }

    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    public int getRolUsuario() {
        return rolUsuario;
    }

    public void setRolUsuario(int rolUsuario) {
        this.rolUsuario = rolUsuario;
    }

}
