<%-- 
    Document   : addpublic
    Created on : 9/09/2021, 09:53:55 AM
    Author     : compaq-cq45
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    File file;
    String ruta="C:/Users/compaq-cq45/Documents/NetBeansProjects/ambientalista/web/images/uploads/";
    out.print("gett uuu");
    String image="";
    String contenType=request.getContentType();
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
                    file=new File(ruta+fileName);
                    fi.write(file);
                    out.println("uoload file :"+ ruta + fileName + "<br>");
                }
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
    }
%>