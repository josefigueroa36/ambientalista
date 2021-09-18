/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author 57322
 */
public class comentarioDTO {
    int id_coment;
    int user;
    int idpost;
    String comentario;

    public comentarioDTO(){
        
    }

    public int getId_coment() {
        return id_coment;
    }

    public void setId_coment(int id_coment) {
        this.id_coment = id_coment;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getIdpost() {
        return idpost;
    }

    public void setIdpost(int idpost) {
        this.idpost = idpost;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    
}
