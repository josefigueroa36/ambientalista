package org.apache.jsp.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DAOS.CredencialesDAOS;
import DTO.CredencialesDTO;
import DTO.PersonaDTO;
import DAOS.PersonaDAOS;

public final class addUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <title>Agregando usuario</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<a href=\"../views/dashboard/usuarios.jsp\"></a>\n");
      out.write("\n");

    
    String cedula = request.getParameter("cedula");
    String nombre = request.getParameter("nombre");
    String nombre2 = request.getParameter("segundo_nombre");
    String apellido = request.getParameter("apellido");
    String apellido2 = request.getParameter("segundo_apellido");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("email");
    
    if(cedula.length()==0 || nombre.length()==0 || nombre2.length()==0 || apellido.length()==0 || apellido2.length()==0
            || telefono.length()==0 || correo.length()==0){
        
        
        response.sendRedirect("../views/dashboard/includes/addUserview.jsp");
    }
    
    else{
        
        PersonaDTO pdto = new PersonaDTO();
        PersonaDAOS persona = new PersonaDAOS();
        pdto.getId_persona();
        pdto.setCedula(cedula);
        pdto.setName(nombre);
        pdto.setMiddlename(nombre2);
        pdto.setLastname(apellido);
        pdto.setSecondlasname(apellido2);
        pdto.setTelefono(telefono);
        pdto.setEmail(correo);
        boolean agregando = persona.newPresona(pdto);
        if(agregando){ 
            CredencialesDTO credendto = new CredencialesDTO();
            CredencialesDAOS credendao = new CredencialesDAOS();
            credendto.setUsername(nombre);
            credendto.setPass(cedula);
            credendto.setId_persona(pdto.getId_persona());
            boolean agregando2 = credendao.oneCredencial(credendto);
            if(agregando2){
                out.print("<h1>fino</h1>");
                //response.sendRedirect("../views/dashboard/usuarios.jsp");
            }
            else{
                 out.print("<h1>nooo :C </h1>");
            }
                
        }
        else{
          
            response.sendRedirect("../views/dashboard/includes/addUserview.jsp");
        }
            
        
        
    }

    
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
