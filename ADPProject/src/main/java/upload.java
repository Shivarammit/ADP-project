

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@MultipartConfig

public class upload extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html/charset=UTF-8");
		try (PrintWriter out=response.getWriter()){
			Part part=request.getPart("file");
			String filename=part.getSubmittedFileName();
			String path=getServletContext().getRealPath(File.separator+filename);
			InputStream is=part.getInputStream();
			
			boolean succs=uploadFile(is,path);
			if(succs) {
				
			}
			else {
				
			}
			
		}
	}
	
	public boolean uploadFile(InputStream is,String path) {
		
		boolean test=false;
		try {
			byte[] byt=new byte[is.available()];
			is.read();
			FileOutputStream fops=new FileOutputStream(path);
			fops.write(byt);
			fops.flush();
			fops.close();
			test=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return test;
		
		
	}
}
