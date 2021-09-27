
package interfaces;

import DTO.LikeDTO;
import java.util.ArrayList;

/**
 *
 * @author Luis Jose
 */
public interface Interfaz_Like {
    public ArrayList <LikeDTO> ListLike();
    public boolean NewLike(LikeDTO like);
    public boolean DeleteLike(LikeDTO like);
}
