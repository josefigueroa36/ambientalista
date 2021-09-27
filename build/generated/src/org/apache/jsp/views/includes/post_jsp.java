package org.apache.jsp.views.includes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DTO.LikeDTO;
import DAOS.LikeDAOS;
import java.util.ArrayList;
import DTO.PersonaDTO;
import DAOS.PersonaDAOS;

public final class post_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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

    System.out.print(request.getParameter("archivado"));
    if(Boolean.parseBoolean(request.getParameter("archivado"))){
        return;
    }
    else{

      out.write("\r\n");
      out.write("<div class='post-content'>\r\n");
      out.write("    <div class='fecha'>\r\n");
      out.write("        <p>");
      out.print( request.getParameter("fecha") );
      out.write("</p>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class='header'>\r\n");
      out.write("        ");

            PersonaDAOS person=new PersonaDAOS(); 
            ArrayList <PersonaDTO> ListPersonCredential=new ArrayList();
            int id_persona=0;
            String name="";
            ListPersonCredential=person.getPersonCredencial(Integer.parseInt(request.getParameter("id_public")));
            for(PersonaDTO p: ListPersonCredential){
                
               
               name=p.getName();
            }
        
      out.write("\r\n");
      out.write("           \r\n");
      out.write("        <h2>");
      out.print( name );
      out.write("</h2>\r\n");
      out.write("        <h3><a href=\"http://localhost:8080/eaci/views/options/public.jsp?id_public=");
      out.print( request.getParameter("id_public") );
      out.write('"');
      out.write('>');
      out.print( request.getParameter("title") );
      out.write("</a></h3>\r\n");
      out.write("        <p>");
      out.print( request.getParameter("body") );
      out.write("</p>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class='body'>\r\n");
      out.write("        <div class='img-content'>\r\n");
      out.write("            \r\n");
      out.write("          ");

          String value = request.getParameter("image");
          if(!value.equals("null")){
          
      out.write("<img src=\"");
      out.print( request.getParameter("image") );
      out.write("\" >  ");

          }else{
          
      out.write("<img src=\"https://i.ytimg.com/vi/AUTh--Afz0k/mqdefault.jpg\" >  ");

          }
          
      out.write("\r\n");
      out.write("          \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class='reaction-content'>\r\n");
      out.write("        <div class='left-reaction'>\r\n");
      out.write("            <span>\r\n");
      out.write("                \r\n");
      out.write("                ");
 
                    LikeDAOS likeando = new LikeDAOS();
                    ArrayList<LikeDTO> list = new ArrayList();
                    String postid = request.getParameter("id_public");
                    list = likeando.ListLike(postid);
                    for(LikeDTO p: list){
                        
                    }
                
      out.write("\r\n");
      out.write("                \r\n");
      out.write("            </span>\r\n");
      out.write("            <a href=\"http://localhost:8080/eaci/control/addLikes.jsp?id_public=");
      out.print( request.getParameter("id_public") );
      out.write("\" class=\"\r\n");
      out.write("               ");
      out.print( request.getParameter("sucesslike"));
      out.write("\r\n");
      out.write("               \"><i class='fas fa-heart like'></i></a>\r\n");
      out.write("        <a href=\"http://localhost:8080/eaci/views/options/public.jsp?id_public=");
      out.print( request.getParameter("id_public") );
      out.write("\"><i class='fas fa-comment-dots coments'></i></a>\r\n");
      out.write("        <a><i class='fas fa-share share'></i></a>\r\n");
      out.write("\r\n");
      out.write("        </div>    \r\n");
      out.write("        <a href=\"http://localhost:8080/eaci/control/addreport.jsp?id_pub=");
      out.print( request.getParameter("id_public") );
      out.write("\"><i class='fas fa-exclamation-circle report'></i></a>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");

 }

      out.write("    ");
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
