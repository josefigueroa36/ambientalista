package interfaces;

import DTO.PersonaDTO;
import java.util.ArrayList;


public interface Interfaz_Persona {
  public ArrayList <PersonaDTO> showPerson();
  public boolean newPresona(PersonaDTO person);
  public boolean updatePerson(PersonaDTO person);
  public boolean deletePerson(PersonaDTO person);
}
