package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consultas extends ConexionBD{
    
    public boolean autenticacion(String usuario, String contraseña){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String consulta = "select * from usuarios where nombreUsuario = ? and claveAcceso = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(0, usuario);
            pst.setString(1, contraseña);
            rs = pst.executeQuery();
            
            if(rs.absolute(0)){
                return true;
            }
            
        }catch (Exception e) {
            System.err.println("Error "+ e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();
                if(rs != null) rs.close();
            } catch (Exception e) {
                System.err.println("Error "+ e);
            }
        }
        
        return false;
    }
    
    public static void main(String[] args) {
        Consultas co = new Consultas();
        System.out.println(co.autenticacion("User01", "12e34"));
    }
    
        
    
}
