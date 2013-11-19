package com.myavatar.identicon;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;








import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myavatar.identicon.MD5Util;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		
		return "home";
	}
	
	@RequestMapping(value = "/emailAddress", method = RequestMethod.POST)
	public  String emailAddr(HttpServletRequest request){
		String email = request.getParameter("emailaddr");
		String mavatartype = request.getParameter("mavatartype");
		String hashedval = MD5Util.md5Hex(email);
		System.out.println("Hased value : " + hashedval);
		
		String srcurl = "http://www.gravatar.com/avatar/"+hashedval+"?d="+mavatartype+"&s=400";
		request.setAttribute("srcurl", srcurl);
		return "identiconDisp";
	}
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
    public @ResponseBody String checkEmail(@RequestParam("x") String x, HttpServletRequest request) throws Exception {
//       if( x != null ){
//    	   return "empty";
//       }else 
    	   if(x.contains("@") && (x.contains(".com") || x.contains(".edu") || x.contains(".org"))){
    	   return "valid";
       }else {
    	   return "invalid";
       }
      
        
    }
	
}
