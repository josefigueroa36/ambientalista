
package DTO;


public class PersonaDTO {
   int id_persona;
   String cedula;
   String name;
   String middlename;
   String lastname;
   String secondlasname;
   String telefono;
   String email;
   public PersonaDTO(){
       
   }
    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getSecondlasname() {
        return secondlasname;
    }

    public void setSecondlasname(String secondlasname) {
        this.secondlasname = secondlasname;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public PersonaDTO(int id_persona, String cedula, String name, String middlename, String lastname, String secondlasname, String telefono, String email) {
        this.id_persona = id_persona;
        this.cedula = cedula;
        this.name = name;
        this.middlename = middlename;
        this.lastname = lastname;
        this.secondlasname = secondlasname;
        this.telefono = telefono;
        this.email = email;
    }
    
   
}
