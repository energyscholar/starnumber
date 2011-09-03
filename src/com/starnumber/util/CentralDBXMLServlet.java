
package com.starnumber.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CentralDBXMLServlet extends HttpServlet {
	private String messageFromkamailioServlet = "";
	private String responseToKamailioServlet = "<CentralDMServlet><CentralDMServlet>";
	  public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  res.setContentType("text/xml");
		  PrintWriter out = res.getWriter();
		  messageFromkamailioServlet = req.getParameter("message");
		  out.println("<xml schema='com.StarnumberV1.0'><CentralDMServletResponse><Originalrequest><CalledURI>"+messageFromkamailioServlet+"</CalledURI></Originalrequest>"+defaultXMLresponse+"</CentralDMServletResponse></xml>");
		  out.close();
	  }
	
	  public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  PrintWriter out = res.getWriter();
		  out.println("this is CentralDBServlet doGet().");
		  out.close();
	  }
	
	private String XMLRequest = "<xml>content</xml>";

	public String getXMLRequest() {
		return XMLRequest;
	}

	public void setXMLRequest(String xMLRequest) {
		XMLRequest = xMLRequest;
	}

	private String defaultXMLresponse = "<UserProfile>user profile record here</UserProfile>";
	
	private String defaultXMLresponseBAK = "<user_profile id=\"3\" user_id=\"3\">\n"+	
"<name>testuser profile 3</name>\n"+
"  <user_name>testuser2</user_name>\n"+								
"    <lines>\n"+								
"      <line id=\"1\" is_active=\"true\" line_type_number=\"1\">\n"+
"        <description>Inbound SN</description>\n"+		
"        <name>My first starnumber</name>\n"+						
"        <uri>7827*7829@starnumber.net</uri>\n"+
"      	   <line_profiles>\n"+
"            <line_profile id=\"1\">\n"+								
"              <name>Default</name>\n"+								
"                <line_profile_settings>\n"+								
"                  <line_profile_setting id=\"1\" setting_number=\"1\" setting_value_type=\"Int\">\n"+								
"                    <name>Ring On Destination Line ID</name>\n"+
"                    <value>2</value>\n"+	
"                  </line_profile_setting>\n"+
"                  <line_profile_setting id=\"4\" setting_number=\"1\" setting_value_type=\"Int\">\n"+	
"                    <name>Ring On Destination Line ID</name>\n"+
"                    <value>3</value>\n"+	
"                  </line_profile_setting>\n"+
"                  <line_profile_setting id=\"5\" setting_number=\"1\" setting_value_type=\"Int\">\n"+
"                    <name>Ring On Destination Line ID</name>\n"+
"                    <value>4</value>\n"+
"                  </line_profile_setting>\n"+
"                </line_profile_settings>\n"+
"            </line_profile>\n"+
"          </line_profiles>\n"+
"      </line>\n"+
"          <line id=\"3\" is_active=\"true\" line_type_number=\"4\">\n"+								
"            <description>Registered Device</description>\n"+				
"              <name>Registered Device</name>\n"+			
"              <uri>Charlie@starnumber.net</uri>\n"+
"            <line_profiles>\n"+		
"              <line_profile id=\"3\">\n"+
"                <name>Default</name>\n"+
"                <line_profile_settings>\n"+
"                  <line_profile_setting id=\"3\" setting_number=\"2\" setting_value_type=\"Varchar\">\n"+	
"                    <name>redirect type. stateless, statefull, media</name>\n"+
"                    <value>media</value>\n"+
"                  </line_profile_setting>\n"+
"                </line_profile_settings>\n"+	
"              </line_profile>\n"+				
"            </line_profiles>\n"+
"          </line>\n"+				
"            <line id=\"2\" is_active=\"true\" line_type_number=\"6\">\n"+
"              <description>SIP URI Destination</description>\n"+	
"              <name>Pbxes uri mmzade-29</name>\n"+				
"              <uri>mmzade-29@pbxes.org</uri>\n"+						
"            <line_profiles>\n"+			
"          <line_profile id=\"2\">\n"+						
"<name>Default</name>\n"+							
"<line_profile_settings>	\n"+							
"<line_profile_setting id=\"2\" setting_number=\"2\" setting_value_type=\"Varchar\">	\n"+
"<name>redirect type. stateless, statefull, media</name>\n"+
"<value>stateless</value>\n"+
"</line_profile_setting>\n"+						
"</line_profile_settings>\n"+
"</line_profile>\n"+				
"</line_profiles>\n"+
"</line>\n"+
"<line id=\"4\" is_active=\"true\" line_type_number=\"6\">\n"+
"<description>SIP URI Destination</description>\n"+								
"<name>Bruce\'s sip2sip</name>\n"+			
"<uri>brucepjsip@sip2sip.info</uri>\n"+
"<line_profiles>\n"+		
"<line_profile id=\"4\">\n"+
"<name>Default</name>\n"+
"<line_profile_settings>\n"+
"<line_profile_setting id=\"6\" setting_number=\"2\" setting_value_type=\"Varchar\">\n"+
"<name>redirect type. stateless, statefull, media</name>\n"+
"<value>statefull</value>\n"+
"</line_profile_setting>\n"+						
"</line_profile_settings>\n"+								
"</line_profile>\n"+				
"</line_profiles>\n"+								
"</line>\n"+				
"</lines>\n"+								
"</user_profile>	";
	
	  
}
