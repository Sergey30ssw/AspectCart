package filter;

import util.UserContext;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class UserContextFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            if (request instanceof HttpServletRequest) {
                UserContext.setCurrentUser((HttpServletRequest) request);
            }
            chain.doFilter(request, response);
        } finally {
            UserContext.clear();
        }
    }

    // Другие методы Filter
    @Override public void init(FilterConfig filterConfig) {}
    @Override public void destroy() {}
}