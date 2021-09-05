/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import DTO.PublicacionDTO;
import java.util.ArrayList;

/**
 *
 * @author compaq-cq45
 */
public interface Interfaz_Publicacion {
    public ArrayList <PublicacionDTO> listPublicacion();
    public boolean newPublicacion(PublicacionDTO publication);
    public boolean editPublicacion(PublicacionDTO publication, Integer id_publicacion);
    public boolean deletePublicacion(Integer id_publicacion);

}
