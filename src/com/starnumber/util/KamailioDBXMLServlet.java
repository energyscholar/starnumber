package com.starnumber.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentFragment;
import org.w3c.dom.Element;
import org.w3c.dom.Text;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class KamailioDBXMLServlet extends HttpServlet {
	  private String messageToCentralDBServlet = "";
	  private String responseFromCentralDBServlet ="";
	  private HttpServletRequest dbreq = null;
	 // private Document doc;
	  private String calledURI; // will be extracted from request
	  
	
	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  PrintWriter out = res.getWriter();
		  out.println("Hello! This is KamailioDBXMLServlet doGet()");
		  out.close();
	  }
	
	  public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	  {
		  PrintWriter out = res.getWriter();
		  boolean requestForProfileSucceeded = false;
		  boolean requestForProfileFailedDueToNotFound = false;
		  String centralServletResponse = "";
		  // was a user profile found, such that KamailioServlet should pass it on  

		  try {
				// get the XML request
				String reqMessage = req.getParameter("message");
				// print out XML request for debug purposes
				//out.println("message=|"+reqMessage+"|\n");
				  // put req XML into a Doc to parse
				
				///////////////////////////////
				// Start parsing XML request with SAX parser
				SAXParserFactory factory = SAXParserFactory.newInstance();
				SAXParser saxParser = factory.newSAXParser();				
				// input stream for SAXParser
				byte[] reqMessageBA = reqMessage.getBytes();
				ByteArrayInputStream  reqMessagebyteArrayInputStream = new ByteArrayInputStream(reqMessageBA);

				
		
				
				
				DefaultHandler handler = new DefaultHandler() {
					 
					boolean kamailiorequest = false;
					boolean isCalledURI = false;

				 
					public void startElement(String uri, String localName,String qName, 
				                Attributes attributes) throws SAXException {
				 
						System.out.println("Start Element :" + qName);
				 
						if (qName.equalsIgnoreCase("KamailioRequest")) {
							kamailiorequest = true;
						}
				 
						if (qName.equalsIgnoreCase("calledURI")) {
							isCalledURI = true;
						}
				 
				 
					}
				 
					public void endElement(String uri, String localName,
						String qName) throws SAXException {
				 
						System.out.println("End Element :" + qName);
				 
					}
				 
					public void characters(char ch[], int start, int length) throws SAXException {
				 
						if (isCalledURI) {
							System.out.println("Called URI: " + new String(ch, start, length));
							calledURI = new String(ch, start, length);
							isCalledURI = false;
						}
				 
					}
				 
				     };				
				
				// do the actual SAXparse
				saxParser.parse(reqMessagebyteArrayInputStream, handler); 
				
				// check to see if calledURI extracted from XML is non-zero length 
				if (calledURI!=null && calledURI.length() >0 ) {
					// contact CentralDBServlet and pass along a request
					centralServletResponse = postToURL("message from KamailioServlet");
					// check that centralServletResponse XML is non-null
					if (centralServletResponse != null && centralServletResponse.length() > 0)
					{
						// parse centralServletResponse, look for success or failure
						
						//  detect for 200 OK and pass on user profile
						// pretend it succeeded
						requestForProfileSucceeded = true;

						
						
						// detect 404 and pass on 404
						
						// detect error pass on error
						
						
						
					}
					
				}
				
				
				
				
				
				
				/////////////////////////////
				//Creating an empty XML Document
				
				//We need a Document
				DocumentBuilderFactory dbfac = DocumentBuilderFactory.newInstance();
				DocumentBuilder docBuilder = dbfac.newDocumentBuilder();
				Document doc = docBuilder.newDocument();
	            ////////////////////////
	            //Creating the XML tree

	            //create the root element and add it to the document
	            Element root = doc.createElement("xml");
	            root.setAttribute("schema", "com.StarnumberV1.0");
	            doc.appendChild(root);
	            //create a comment and put it in the root element
	            //Comment comment = doc.createComment("Just a thought");
	            //root.appendChild(comment);

	            //create child element, add an attribute, and add to root
	            Element child = doc.createElement("KamServletResponse");
	            root.appendChild(child);

	            //create grandchild element, add to child
	            Element grandchild1 = doc.createElement("CalledURI");
	            child.appendChild(grandchild1);

	            //add a text element to the child
	            Text text1 = doc.createTextNode(calledURI);
	            grandchild1.appendChild(text1);	            

				// if requestForProfileSucceeded we got a valid user profile back
				if (requestForProfileSucceeded) {
		            //create grandchild element, add to child
		            Element grandchild2 = doc.createElement("Result");
		            child.appendChild(grandchild2);

		            //add a text element to the child
		            Text text2 = doc.createTextNode("200 OK");
		            grandchild2.appendChild(text2);	            

		            Element grandchild3 = doc.createElement("UserProfile");
		            child.appendChild(grandchild3);

		            DocumentFragment userProfileXML = doc.createDocumentFragment();
//		            child.appendChild(grandchild3);

		            //add a text element to the child
		            
//		            Text text3 = doc.createTextNode(centralServletResponse);
//		            grandchild3.appendChild(text3);	 
					
				}
				// if everything works but Central DB replies with a 404 NOT FOUND
				if (requestForProfileFailedDueToNotFound) {
		            //create grandchild element, add to child
		            Element grandchild2 = doc.createElement("Result");
		            child.appendChild(grandchild2);

		            //add a text element to the child
		            Text text2 = doc.createTextNode("404 Not Found");
		            grandchild2.appendChild(text2);	            
					
				}
				// if something went wrong other than 404 NOT FOUND
				if (!requestForProfileSucceeded && !requestForProfileFailedDueToNotFound) {
		            //create grandchild element, add to child
		            Element grandchild2 = doc.createElement("Result");
		            child.appendChild(grandchild2);

		            //add a text element to the child
		            Text text2 = doc.createTextNode("403 General Error or Bad Request");
		            grandchild2.appendChild(text2);	            
					
				}
	            
	            
	            
	            /////////////////
	            //Output the XML

	            //set up a transformer
	            TransformerFactory transfac = TransformerFactory.newInstance();
	            Transformer trans = transfac.newTransformer();
	            trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
	            trans.setOutputProperty(OutputKeys.INDENT, "yes");

	            //create string from xml tree
	            StringWriter sw = new StringWriter();
	            StreamResult result = new StreamResult(sw);
	            DOMSource source = new DOMSource(doc);
	            trans.transform(source, result);
	            String xmlString = sw.toString();				
	            out.println(xmlString);
			} 
			catch (Exception e) {
				System.out.println("XML Doc creationg error: ");
				e.printStackTrace();
				
			}
		  
			
		  
		  //out.println( this.getHTMLContent() );
		  //String messageFromKam = parseRequest(req.toString());
		  // contact CentralDBServlet and show its response.
		  //out.println(this.postToURL("test message"));
		  out.close();
	  }
	
	private String XMLRequest = "<xml>content</xml>";

	private String postToURL(String message) {
		// initialize the response to blank
		responseFromCentralDBServlet = "";
		try {
		    // Construct data
		    String data = "message to DBServlet";

		    // Send data
		    URL url = new URL("http://localhost:8888/SNWebApp/CentralDBServlet");
		    URLConnection conn = url.openConnection();
		    conn.setDoOutput(true);
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		    wr.write(data);
		    wr.flush();

		    // Get the response
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    String line;
		    while ((line = rd.readLine()) != null) {
		        // Process line...
		    	responseFromCentralDBServlet += line;
		    }
		    wr.close();
		    rd.close();
		} catch (Exception e) {
		}
		return responseFromCentralDBServlet;
	}
	

private String parseRequest	(String theRequest) {
	
	return "" ;
}
	
	
	/*
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/xml");
		PrintWriter out = response.getWriter();

		Enumeration<String> keys;
		String key;
		String requestedSubtree = "";

		keys = request.getParameterNames();
		while (keys.hasMoreElements()) {
			key = (String) keys.nextElement();
			if (key.equalsIgnoreCase("subtree")) {
				requestedSubtree = request.getParameter(key);
			}
		}
	}
	
		*/

	
	public String getXMLRequest() {
		return XMLRequest;
	}

	public void setXMLRequest(String xMLRequest) {
		XMLRequest = xMLRequest;
	}
	  
	String HTMLContent = "<xml schema='com.StarnumberV1.0'><KamServletResponse><UserProfileReturn><CalledURI>someuser@starnumber.com</CalledURI><CentralDBResponse>200 OK</CentralDBResponse></UserProfileReturn></KamServletResponse></xml>";

	public String getHTMLContent() {
		return HTMLContent;
	}

	public void setHTMLContent(String hTMLContent) {
		HTMLContent = hTMLContent;
	}

	private String calledURIRequiringProfile="defaults to 3";

	public String getCalledURIRequiringProfile() {
		return calledURIRequiringProfile;
	}

	public void setCalledURIRequiringProfile(String calledURIRequiringProfile) {
		this.calledURIRequiringProfile = calledURIRequiringProfile;
	}
	
	
	  
}
