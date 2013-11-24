package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class Encoding
 */
public class Encoding implements Filter {

	 protected FilterConfig filterconfig;
	    private String targetEncoding = "UTF-8";

	    public void init(FilterConfig config) throws ServletException {
	        this.filterconfig = config;
	        String target= config.getInitParameter("encoding");
	        if(target!=null){
	        targetEncoding = target;
	        }
	    }

	    public void doFilter(ServletRequest srequest, ServletResponse sresponse,
	            FilterChain chain) throws IOException, ServletException {
	        HttpServletRequest request = (HttpServletRequest)srequest;
	        HttpServletResponse response=(HttpServletResponse) sresponse;
	        request.setCharacterEncoding(targetEncoding);
	        response.setCharacterEncoding(targetEncoding);
	        chain.doFilter(srequest,sresponse);
	        
	    }

	    public void destroy() {
	        this.filterconfig = null;
	    }

}
