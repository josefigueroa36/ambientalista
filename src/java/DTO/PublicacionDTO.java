package DTO;


public class PublicacionDTO {
    int id_publicacion;
    String title;
    String body;
    String image;
    String fecha;
    int usuario;
    
    
    public PublicacionDTO(){
        
    }
    
    
    public int getId_publicacion() {
        return id_publicacion;
    }

    public void setId_publicacion(int id_publicacion) {
        this.id_publicacion = id_publicacion;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public PublicacionDTO(int id_publicacion, String title, String body, String image, String fecha, int usuario) {
        this.id_publicacion = id_publicacion;
        this.title = title;
        this.body = body;
        this.image = image;
        this.fecha = fecha;
        this.usuario = usuario;
    }
}
