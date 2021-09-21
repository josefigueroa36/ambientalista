package org.apache.jsp.views.dashboard;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DTO.PersonaDTO;
import DAOS.PersonaDAOS;
import DTO.RolDTO;
import DAOS.RolDAOS;
import DTO.PublicacionDTO;
import java.util.ArrayList;
import DAOS.PublicacionDAOS;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    HttpSession sesion=request.getSession();
    
    if(sesion.getAttribute("name")==null || sesion.getAttribute("rol")==null || sesion.getAttribute("persona")==null){
        System.out.print(""+sesion.getAttribute("name") + sesion.getAttribute("rol") + sesion.getAttribute("persona"));
        response.sendRedirect("../login.jsp");
        return;
    }
    
    PublicacionDAOS publicacion = new PublicacionDAOS();
    ArrayList <PublicacionDTO> list=new ArrayList();
    
    RolDAOS rol=new RolDAOS();
    ArrayList <RolDTO> listRol=new ArrayList();
    
    PersonaDAOS persona = new PersonaDAOS();
    ArrayList <PersonaDTO> listPerson=new ArrayList();
    
    listPerson=persona.getOnePerson((Integer)sesion.getAttribute("persona"));
    
    list=publicacion.listPublicacion();
    String username=(String)sesion.getAttribute("name");
    
    String nombrePersona="";
    String secondname="";
    String lastname="";
    String secondLastname="";
    for(PersonaDTO person: listPerson){
        nombrePersona=person.getName();
        secondname=person.getMiddlename();
        lastname=person.getLastname();
        secondLastname=person.getSecondlasname();
    }
    sesion.setAttribute("nombre",nombrePersona);
    sesion.setAttribute("secondname",secondname);
    sesion.setAttribute("lastname",lastname);
    sesion.setAttribute("secondLastname",secondLastname);

      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/header.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("css", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("./css/index.css", request.getCharacterEncoding()), out, false);
      out.write('\r');
      out.write('\n');

    if(sesion.getAttribute("delete")!=null){

      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/alert.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("msj", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( sesion.getAttribute("msj") ), request.getCharacterEncoding()), out, false);
      out.write('\r');
      out.write('\n');

    
    sesion.removeAttribute("delete");
    sesion.removeAttribute("msj");
    }
else{
    if(sesion.getAttribute("msj")!=null){

      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/alert.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("msj", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( sesion.getAttribute("msj") ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("red", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("red", request.getCharacterEncoding()), out, false);
      out.write('\r');
      out.write('\n');

    sesion.removeAttribute("msj");
    }
}

      out.write("\r\n");
      out.write("<div class='header' id='header'>   \r\n");
      out.write("   ");
 
       String elRol="";
       
       System.out.print("id rolll is"+((Object)sesion.getAttribute("rol")).getClass().getSimpleName()+sesion.getAttribute("rol"));
       System.out.print(sesion.getAttribute("rol"));
       
       listRol=rol.getOne((Integer)sesion.getAttribute("rol"));
       for(RolDTO r:listRol){
           elRol=r.getRol();
           sesion.setAttribute("id_rol",r.getId_rol());
       }
       sesion.setAttribute("elRol",elRol);
  
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("nickname", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( username ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("name", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( sesion.getAttribute("nombre")+" "+sesion.getAttribute("secondname")+" "+sesion.getAttribute("lastname")+" "+sesion.getAttribute("secondLastname") ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("rol", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( sesion.getAttribute("elRol") ), request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/navdashboar.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class='card-list' id='cardList'>\r\n");
      out.write("    ");

        
        
        for(PublicacionDTO p:list){
        listRol=rol.getOne(p.getUsuario());
        
        
    
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/card.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("archivado", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getArchivado() ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getTitle() ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("body", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getBody()), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("image", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getImage()), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("fecha", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getFecha()), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("id_public", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getId_publicacion() ), request.getCharacterEncoding()) + "&" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("id_user", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode(String.valueOf( p.getUsuario() ), request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    ");
}
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src='./js/menu.js' type='text/javascript'></script>\r\n");
      out.write("<script src='./js/close.js' type='text/javascript'></script>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/footer.jsp", out, false);
      out.write('\r');
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
