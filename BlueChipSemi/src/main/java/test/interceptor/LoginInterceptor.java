package test.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("aaaaaaaaaa");
		if((String)request.getSession().getAttribute("id")==null){			
			response.sendRedirect("/shop/gongji.do");
			return false;
		}
		
		return true;
	}

}
