package web;
 
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;
 
import model.Line;
import service.LineManager;
 
public class LineNewController extends SimpleFormController {
 
    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
    	Line defaultLine= new Line();
    	defaultLine.setLine_name("Internet something");
    	return defaultLine;
    }
 
    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
    	Map<Object, Object> dataMap = new HashMap<Object, Object>();
    	//BrandManager brandManager = new BrandManager();
    	//dataMap.put("brandList", brandManager.getBrandList());
    	return dataMap;
    }
 
    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	//binder.setDisallowedFields(new String[] {"brand"});
 
    	Line line = (Line)binder.getTarget();
 
    	// set car's brand from request parameter brand id
    	//BrandManager brandManager = new BrandManager();    	
    }
 
    @Override
    public ModelAndView onSubmit(Object command) throws ServletException {
    	LineManager lineManager = new LineManager();
    	lineManager.createLine((Line)command);
 
    	return new ModelAndView(new RedirectView(getSuccessView()));
    }
 
}