/**
 * 
 */
package config;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.ServerProperties;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;
import org.glassfish.jersey.servlet.ServletProperties;

/**
 * @author Sadini Kumarasiri
 *
 */
public class JerseyApplication extends ResourceConfig {
    public JerseyApplication() {
        packages("com");
        property(ServerProperties.BV_SEND_ERROR_IN_RESPONSE, true);
        property(JspMvcFeature.TEMPLATE_BASE_PATH, "/WEB-INF/views");
        property(ServletProperties.FILTER_STATIC_CONTENT_REGEX,
                // "/(images|css)/.*");
                "/css/*");
        register(JspMvcFeature.class);
    }
}