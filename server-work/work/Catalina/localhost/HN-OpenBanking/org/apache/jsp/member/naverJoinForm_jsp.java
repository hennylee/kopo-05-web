/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-07-16 01:23:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class naverJoinForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
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
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/head.jsp", out, false);
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	<body class=\"is-preload\">\r\n");
      out.write("\r\n");
      out.write("		<!-- Wrapper -->\r\n");
      out.write("			<div id=\"wrapper\">\r\n");
      out.write("\r\n");
      out.write("				<!-- Main -->\r\n");
      out.write("					<div id=\"main\">\r\n");
      out.write("						<div class=\"inner\">\r\n");
      out.write("\r\n");
      out.write("							<!-- Header -->\r\n");
      out.write("								");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("				\r\n");
      out.write("				\r\n");
      out.write("				<section>\r\n");
      out.write("					<header class=\"major\">\r\n");
      out.write("						<h2>네이버 회원가입</h2>\r\n");
      out.write("					</header>\r\n");
      out.write("\r\n");
      out.write("					<form method=\"post\" action=\"#\">\r\n");
      out.write("						<div class=\"row gtr-uniform\">\r\n");
      out.write("						\r\n");
      out.write("						\r\n");
      out.write("							<div class=\"col-6 col-12-small\">\r\n");
      out.write("								id : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.member.name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-6 col-12-small\">\r\n");
      out.write("								<input type=\"email\" name=\"demo-email\" id=\"demo-email\" value=\"\"\r\n");
      out.write("									placeholder=\"Email\" />\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							<!-- Break -->\r\n");
      out.write("							<div class=\"col-12\">\r\n");
      out.write("								<select name=\"demo-category\" id=\"demo-category\">\r\n");
      out.write("									<option value=\"\">- Category -</option>\r\n");
      out.write("									<option value=\"1\">Manufacturing</option>\r\n");
      out.write("									<option value=\"1\">Shipping</option>\r\n");
      out.write("									<option value=\"1\">Administration</option>\r\n");
      out.write("									<option value=\"1\">Human Resources</option>\r\n");
      out.write("								</select>\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							<!-- Break -->\r\n");
      out.write("							<div class=\"col-4 col-12-small\">\r\n");
      out.write("								<input type=\"radio\" id=\"demo-priority-low\" name=\"demo-priority\"\r\n");
      out.write("									checked> <label for=\"demo-priority-low\">Low</label>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-4 col-12-small\">\r\n");
      out.write("								<input type=\"radio\" id=\"demo-priority-normal\"\r\n");
      out.write("									name=\"demo-priority\"> <label for=\"demo-priority-normal\">Normal</label>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-4 col-12-small\">\r\n");
      out.write("								<input type=\"radio\" id=\"demo-priority-high\" name=\"demo-priority\">\r\n");
      out.write("								<label for=\"demo-priority-high\">High</label>\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							<!-- Break -->\r\n");
      out.write("							<div class=\"col-6 col-12-small\">\r\n");
      out.write("								<input type=\"checkbox\" id=\"demo-copy\" name=\"demo-copy\">\r\n");
      out.write("								<label for=\"demo-copy\">Email me a copy</label>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-6 col-12-small\">\r\n");
      out.write("								<input type=\"checkbox\" id=\"demo-human\" name=\"demo-human\" checked>\r\n");
      out.write("								<label for=\"demo-human\">I am a human</label>\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							<!-- Break -->\r\n");
      out.write("							<div class=\"col-12\">\r\n");
      out.write("								<textarea name=\"demo-message\" id=\"demo-message\"\r\n");
      out.write("									placeholder=\"Enter your message\" rows=\"6\"></textarea>\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							<!-- Break -->\r\n");
      out.write("							<div class=\"col-12\">\r\n");
      out.write("								<ul class=\"actions\">\r\n");
      out.write("									<li><input type=\"submit\" value=\"Send Message\"\r\n");
      out.write("										class=\"primary\" /></li>\r\n");
      out.write("									<li><input type=\"reset\" value=\"Reset\" /></li>\r\n");
      out.write("								</ul>\r\n");
      out.write("							</div>\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("							\r\n");
      out.write("						</div>\r\n");
      out.write("					</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("				</section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			\r\n");
      out.write("				\r\n");
      out.write("				\r\n");
      out.write("				\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("				<!-- Sidebar -->\r\n");
      out.write("					");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/sidebar.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("		<!-- Scripts -->\r\n");
      out.write("			");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/include/script.jsp", out, false);
      out.write("\r\n");
      out.write("	</body>\r\n");
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
