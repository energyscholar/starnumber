package web;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
 
import service.LineManager;
 
public class LineListController implements Controller {
 
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
 
		LineManager lineManager = new LineManager();
 
		ModelAndView modelAndView = new ModelAndView("lineList");
		modelAndView.addObject("lineList", lineManager.getLineList());
 
		return modelAndView;
	}
}
