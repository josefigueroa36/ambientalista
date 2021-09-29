package org.apache.jsp.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DAOS.PublicacionDAOS;
import DTO.PublicacionDTO;
import java.util.ArrayList;
import org.apache.commons.fileupload.FileItem;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.io.File;

public final class addpublic_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

    HttpSession sesion=request.getSession();
    File file;
    //String ruta="C:/xampp/htdocs/img";
    //cambiar la ruta
;
    String image="";
    String contenType=request.getContentType();
    ArrayList<String> lista=new ArrayList();
    PublicacionDTO publi=new PublicacionDTO();
    if(contenType.indexOf("multipart/form-data")>=0){
        
        DiskFileItemFactory factory= new DiskFileItemFactory();
        //factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload=new ServletFileUpload(factory);
        try{
            List fileItem=upload.parseRequest(request);
            Iterator i=fileItem.iterator();
            while(i.hasNext()){
                FileItem fi=(FileItem) i.next();
                if(!fi.isFormField()){
                    String fieldName=fi.getFieldName();
                    String fileName=fi.getName();

                    boolean isInMemory=fi.isInMemory();
                    long sizeInByte=fi.getSize();
                    file =new File("C:/xampp/htdocs/img/" + fileName);
                    fi.write(file);

                    image= "http://localhost/img/" + fileName; 
                 
                }
                else{
                    lista.add(fi.getString());
                   }
            }
            
            publi.setImage(image);
            publi.setTitle(lista.get(0));
            publi.setBody(lista.get(1));
            publi.setUsuario(1);
            PublicacionDAOS publiDAO= new PublicacionDAOS();
            boolean check=publiDAO.newPublicacion(publi);
            System.out.print("subida "+check);
            response.sendRedirect("/eaci/views/dashboard");
            
        }
        catch(Exception e){
            System.out.println(e);
            response.sendRedirect("/eaci/views/dashboard/addpublic.jsp?error=true");
        }
    }
    else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
    }

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
