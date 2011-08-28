

package model;



public class Destination {

	private int location_id;
	private String location_name;
	private String destination_uri;
	private int sn_id;
	private int redirect_type_id;
	private int destination_type_id;
	private boolean is_active;
	private boolean accepts_sms;
	private boolean forward_calls;
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getDestination_uri() {
		return destination_uri;
	}
	public void setDestination_uri(String destination_uri) {
		this.destination_uri = destination_uri;
	}
	public int getSn_id() {
		return sn_id;
	}
	public void setSn_id(int sn_id) {
		this.sn_id = sn_id;
	}
	public int getRedirect_type_id() {
		return redirect_type_id;
	}
	public void setRedirect_type_id(int redirect_type_id) {
		this.redirect_type_id = redirect_type_id;
	}
	public int getDestination_type_id() {
		return destination_type_id;
	}
	public void setDestination_type_id(int destination_type_id) {
		this.destination_type_id = destination_type_id;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public boolean isAccepts_sms() {
		return accepts_sms;
	}
	public void setAccepts_sms(boolean accepts_sms) {
		this.accepts_sms = accepts_sms;
	}
	public boolean isForward_calls() {
		return forward_calls;
	}
	public void setForward_calls(boolean forward_calls) {
		this.forward_calls = forward_calls;
	}
	
	// test method
	public String toStringXML() {
		
		
		return "";
	}
	
	
}
