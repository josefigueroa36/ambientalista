/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;


import DTO.comentarioDTO;
import java.util.ArrayList;

/**
 *
 * @author 57322
 */
public interface Interfazcomentario {
    public ArrayList <comentarioDTO> getcommentpost(String cp);
    public boolean newcomment(comentarioDTO person);
}
