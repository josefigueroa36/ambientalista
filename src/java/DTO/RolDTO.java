package DTO;

public class RolDTO {
    int id_rol;
    String rol;

    public RolDTO(){
        
    }
    
    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public RolDTO(int id_rol, String rol) {
        this.id_rol = id_rol;
        this.rol = rol;
    }
    
}
