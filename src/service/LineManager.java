package service;

import java.util.LinkedList;
import java.util.List;

import model.Line;
public class LineManager {

	private static List<Line> lineList;

	static {
		Line line1 = new Line();
		Line line2 = new Line();

		// lineID will come from DB, careful here
		line1.setLine_name("Internet In");
		line1.setLine_type_number(2);
		line1.setUser_id(2);		

		line2.setLine_name("Internet out");
		line2.setLine_type_number(2);
		line2.setUser_id(2);		
		
		lineList = new LinkedList<Line>();
		lineList.add(line1);
	}

	public static List<Line> getLineList() {
		return lineList;
	}

	public static void setLineList(List<Line> lineList) {
		LineManager.lineList = lineList;
	}

	// This next bit does nothing yet	
	public Line createLine(Line l) {
			Line line = new Line();
			line.setLine_id((int) lineList.size() + 1 );
			line.setLine_name("get line name from somewhere");
			lineList.add(line);
			
			return line;
	}
	
}
