package com.starnumber.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class KamailioDBXMLServlet extends HttpServlet {
	  public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  PrintWriter out = res.getWriter();

		  out.println("Hello, world!doGet()@!qqqWWW");
		  out.close();
	  }
	
	  public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  PrintWriter out = res.getWriter();

		  out.println("Hello, world! doPost()");
		  out.close();
	  }
	
	private String XMLRequest = "<xml>content</xml>";

	public String getXMLRequest() {
		return XMLRequest;
	}

	public void setXMLRequest(String xMLRequest) {
		XMLRequest = xMLRequest;
	}
	  
	
	  
}
