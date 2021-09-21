package org.apache.jsp.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import controllers.sessiones.Login;
import java.util.ArrayList;

public final class verify_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    HttpSession sesion=request.getSession(true);


    String nickname=request.getParameter("nickname").replace(" ","");
    String pass=request.getParameter("password").replace(" ","");
    System.out.print("hola "+nickname+" "+pass);
    
    if(nickname.length()==0 || pass.length()==0 || nickname.length()==0 || pass.length()==0){
        
        sesion.setAttribute("error","No puedes enviar los datos vacios");
        
        response.sendRedirect("../views/login.jsp");
    }
    else{
    
    Login control=new Login();
    ResultSet rs=control.getUserOne(nickname,pass);
    System.out.print("ok "+rs);
    
    if(rs==null){
        sesion.setAttribute("error","No existen esas credenciales en el sistema");
        response.sendRedirect("../views/login.jsp");
        return;
    }
    else{
        while(rs.next()){
            
                sesion.setAttribute("name",rs.getString("username"));
                //Integer id_rol=rs.getInt("id_rol");
                sesion.setAttribute("rol",rs.getInt("id_rol"));
                sesion.setAttribute("persona",rs.getInt("id_persona"));
                System.out.print("la seionn es"+rs.getInt("id_persona"));
                response.sendRedirect("../views/dashboard/index.jsp");
            }
        return;
        }
    }



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
