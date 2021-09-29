/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import DTO.reportDTO;
import java.util.ArrayList;

/**
 *
 * @author 57322
 */
public interface Interfaz_report {
    public ArrayList <reportDTO> ListReport();
    public boolean Newreport(reportDTO reporte);
    public boolean DeleteReport(reportDTO reporte);
    public int UserIsReport(reportDTO reporte);
    public boolean DeleteAllreport();
}
