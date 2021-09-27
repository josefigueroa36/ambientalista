
package DTO;

/**
 *
 * @author Luis Jose
 */
public class LikeDTO {
    int id_likes;
    int id_user;
    int id_post;
    
    public LikeDTO() {
    }

    public int getId_likes() {
        return id_likes;
    }

    public void setId_likes(int id_likes) {
        this.id_likes = id_likes;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_post() {
        return id_post;
    }

    public void setId_post(int id_post) {
        this.id_post = id_post;
    }

    
}