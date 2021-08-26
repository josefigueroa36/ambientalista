/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import DTO.ProfesorDTO;
import java.util.ArrayList;

/**
 *
 * @author compaq-cq45
 */
public interface Interfaz_profe {
    
    public ArrayList <ProfesorDTO> ListProfe();
    public boolean NewProfe(ProfesorDTO profe);
    public boolean DeleteProfe(ProfesorDTO profe);
    public boolean updateProfe(ProfesorDTO profe);
    
}
