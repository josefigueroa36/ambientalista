package DTO;

public class CredencialesDTO {
    int id_credencial;
    int id_persona;
    int id__rol;
    String username;
    String pass;
    
    public CredencialesDTO(){
        
    }
    
    public CredencialesDTO(int id_credencial, int id_persona, int id__rol, String nickname, String pass) {
        this.id_credencial = id_credencial;
        this.id_persona = id_persona;
        this.id__rol = id__rol;
        this.username = username;
        this.pass = pass;
    }

    public int getId_credencial() {
        return id_credencial;
    }

    public void setId_credencial(int id_credencial) {
        this.id_credencial = id_credencial;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId__rol() {
        return id__rol;
    }

    public void setId__rol(int id__rol) {
        this.id__rol = id__rol;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String nickname) {
        this.username = nickname;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
