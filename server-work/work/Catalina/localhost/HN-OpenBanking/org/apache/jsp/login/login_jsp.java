/*
 * Generated by the Jasper component of Apache Tomcat
<<<<<<< Updated upstream
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-07-24 22:35:13 UTC
=======
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2021-07-23 20:10:44 UTC
>>>>>>> Stashed changes
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1627001659703L));
    _jspx_dependants.put("jar:file:/C:/kopo-05-web/server-work/wtpwebapps/HN-OpenBanking/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<!--\r\n");
      out.write("	Editorial by HTML5 UP\r\n");
      out.write("	html5up.net | @ajlkn\r\n");
      out.write("	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/head.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("	$(document).ready(function() {\r\n");
      out.write("		if ('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${msg}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("') {\r\n");
      out.write("			$('#myModal').modal(\"show\")\r\n");
      out.write("		}\r\n");
      out.write("	});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<body class=\"is-preload\">\r\n");
      out.write("\r\n");
      out.write("	<!-- Modal -->\r\n");
      out.write("	<div id=\"myModal\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("		<div class=\"modal-dialog\">\r\n");
      out.write("\r\n");
      out.write("			<!-- Modal content-->\r\n");
      out.write("			<div class=\"modal-content\">\r\n");
      out.write("				<div class=\"modal-header\">\r\n");
      out.write("					<button type=\"button\" class=\"close button modalClose\"\r\n");
      out.write("						data-dismiss=\"modal\" style=\"box-shadow: none;\">&times;</button>\r\n");
      out.write("					<h4 class=\"modal-title\">로그인 결과</h4>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"modal-body\">\r\n");
      out.write("					<p>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${msg }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"modal-footer\">\r\n");
      out.write("					<button type=\"button\" class=\"btn button primary\"\r\n");
      out.write("						data-dismiss=\"modal\">닫기</button>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<!-- Wrapper -->\r\n");
      out.write("	<div id=\"wrapper\">\r\n");
      out.write("\r\n");
      out.write("		<!-- Main -->\r\n");
      out.write("		<div id=\"main\">\r\n");
      out.write("			<div class=\"inner\">\r\n");
      out.write("\r\n");
      out.write("				<!-- Header -->\r\n");
      out.write("				");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- Login -->\r\n");
      out.write("\r\n");
      out.write("				<section>\r\n");
      out.write("					<header class=\"major\">\r\n");
      out.write("						<h2>로그인</h2>\r\n");
      out.write("					</header>\r\n");
      out.write("\r\n");
      out.write("					<!-- Lists -->\r\n");
      out.write("					<div class=\"row\">\r\n");
      out.write("						<div class=\"col-6 col-12-small\">\r\n");
      out.write("\r\n");
      out.write("							<h3>다른 서비스로 로그인</h3>\r\n");
      out.write("							<a href=\"http://localhost:9999/HN-OpenBanking/auth/naver.do\"\r\n");
      out.write("								onclick=\"window.open(this.href, '_blank', 'width=500px,height=800px,toolbars=no,scrollbars=no'); return false;\">\r\n");
      out.write("								<img src=\"images/naver_login.png\" style=\"width: 50%\">\r\n");
      out.write("							</a> <br> <a href=\"#\"><img src=\"images/naver_login.png\"\r\n");
      out.write("								style=\"width: 50%\"></a> <br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col-6 col-12-small\">\r\n");
      out.write("\r\n");
      out.write("							<h3>일반 로그인</h3>\r\n");
      out.write("							<form method=\"post\"\r\n");
      out.write("								action=\"");
      out.print(request.getContextPath());
      out.write("/loginProcess.do\">\r\n");
      out.write("								<div class=\"row gtr-uniform\">\r\n");
      out.write("\r\n");
      out.write("									<div class=\"col-6 col-12-small\">\r\n");
      out.write("										<input type=\"radio\" id=\"user-type-u\" name=\"user-type\"\r\n");
      out.write("											value=\"U\" checked> <label for=\"user-type-u\">일반회원</label>\r\n");
      out.write("									</div>\r\n");
      out.write("									<div class=\"col-6 col-12-small\">\r\n");
      out.write("										<input type=\"radio\" id=\"user-type-s\" name=\"user-type\"\r\n");
      out.write("											value=\"S\"> <label for=\"user-type-s\">관리자</label>\r\n");
      out.write("									</div>\r\n");
      out.write("\r\n");
      out.write("									<!-- Break -->\r\n");
      out.write("									<div class=\"col-12\">\r\n");
      out.write("										<ul class=\"actions stacked\">\r\n");
      out.write("											<li><input type=\"text\" name=\"id\" id=\"id\" value=\"\"\r\n");
      out.write("												placeholder=\"Id\" /></li>\r\n");
      out.write("											<li><input type=\"password\" name=\"pw\" id=\"pw\" value=\"\"\r\n");
      out.write("												placeholder=\"Password\" /></li>\r\n");
      out.write("										</ul>\r\n");
      out.write("									</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("									<!-- Break -->\r\n");
      out.write("									<div class=\"col-12\">\r\n");
      out.write("										<ul class=\"actions stacked\">\r\n");
      out.write("											<li><input type=\"submit\" value=\"Login\"\r\n");
      out.write("												class=\"button primary fit\" /></li>\r\n");
      out.write("										</ul>\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("		<!-- Sidebar -->\r\n");
      out.write("		");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/sidebar.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<!-- Scripts -->\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/script.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
