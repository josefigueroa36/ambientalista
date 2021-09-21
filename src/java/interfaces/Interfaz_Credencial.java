package interfaces;

import DTO.CredencialesDTO;
import java.util.ArrayList;

public interface Interfaz_Credencial {

    public ArrayList<CredencialesDTO> showCredencial();

    public boolean newCredencial(CredencialesDTO creden);

    public boolean updateCredencial(CredencialesDTO creden);

    public boolean deleteCredencial(CredencialesDTO creden);
}
