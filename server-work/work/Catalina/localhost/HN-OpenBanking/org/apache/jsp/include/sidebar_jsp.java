/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-07-22 20:31:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sidebar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("				<!-- Sidebar -->\r\n");
      out.write("					<div id=\"sidebar\">\r\n");
      out.write("						<div class=\"inner\">\r\n");
      out.write("\r\n");
      out.write("							<!-- Search -->\r\n");
      out.write("								<section id=\"search\" class=\"alt\">\r\n");
      out.write("									<form method=\"post\" action=\"#\">\r\n");
      out.write("										<input type=\"text\" name=\"query\" id=\"query\" placeholder=\"Search\" />\r\n");
      out.write("									</form>\r\n");
      out.write("								</section>\r\n");
      out.write("\r\n");
      out.write("							<!-- Menu -->\r\n");
      out.write("								<nav id=\"menu\">\r\n");
      out.write("									<header class=\"major\">\r\n");
      out.write("										<h2>메뉴</h2>\r\n");
      out.write("									</header>\r\n");
      out.write("									<ul>\r\n");
      out.write("										<li>\r\n");
      out.write("											<span class=\"opener\">조회</span>\r\n");
      out.write("											<ul>\r\n");
      out.write("												<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/account/find.do\">전체 계좌 조회</a></li>\r\n");
      out.write("												<li><a href=\"#\">계좌 조회</a></li>\r\n");
      out.write("												<li><a href=\"#\">거래 내역 조회</a></li>\r\n");
      out.write("											</ul>\r\n");
      out.write("										</li>\r\n");
      out.write("										<li>\r\n");
      out.write("											<span class=\"opener\">이체</span>\r\n");
      out.write("											<ul>\r\n");
      out.write("												<li><a href=\"#\">계좌이체</a></li>\r\n");
      out.write("												<li><a href=\"#\">이체 결과 조회</a></li>\r\n");
      out.write("											</ul>\r\n");
      out.write("										</li>\r\n");
      out.write("										<li>\r\n");
      out.write("											<span class=\"opener\">비대면계좌개설</span>\r\n");
      out.write("											<ul>\r\n");
      out.write("												<li><a href=\"");
      out.print( request.getContextPath());
      out.write("/account/open/open1.do\">신청하기</a></li>\r\n");
      out.write("											</ul>\r\n");
      out.write("										</li>\r\n");
      out.write("										<li>\r\n");
      out.write("											<span class=\"opener\">오픈뱅킹</span>\r\n");
      out.write("											<ul>\r\n");
      out.write("												<li><a href=\"#\">오픈뱅킹 조회</a></li>\r\n");
      out.write("												<li><a href=\"#\">오픈뱅킹 이체</a></li>\r\n");
      out.write("												<li><a href=\"#\">오픈뱅킹 이체내역조회</a></li>\r\n");
      out.write("												<li><a href=\"#\">자금 하나로 모으기</a></li>\r\n");
      out.write("												<li><a href=\"#\">계좌관리</a></li>\r\n");
      out.write("												<li><a href=\"#\">오픈뱅킹 재동의</a></li>\r\n");
      out.write("												<li><a href=\"#\">오픈뱅킹 전용비밀번호 재등록</a></li>\r\n");
      out.write("												<li><a href=\"#\">서비스 해지</a></li>\r\n");
      out.write("											</ul>\r\n");
      out.write("										</li>\r\n");
      out.write("										<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/qna/list.do\">Q & A</a></li>\r\n");
      out.write("										<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/generic.html\">회사 소개</a></li>\r\n");
      out.write("										<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/elements.html\">상품 소개</a></li>\r\n");
      out.write("										<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/index.html\">홈페이지</a></li>\r\n");
      out.write("										<li><a href=\"#\">디자인 예시</a></li>\r\n");
      out.write("										<li><a href=\"#\">나만의 색상 분석</a></li>\r\n");
      out.write("									</ul>\r\n");
      out.write("								</nav>\r\n");
      out.write("\r\n");
      out.write("							<!-- Section -->\r\n");
      out.write("								<section>\r\n");
      out.write("									<header class=\"major\">\r\n");
      out.write("										<h2>색상 소개</h2>\r\n");
      out.write("									</header>\r\n");
      out.write("									<div class=\"mini-posts\">\r\n");
      out.write("										<article>\r\n");
      out.write("											<a href=\"#\" class=\"image\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/pic07.jpg\" alt=\"\" /></a>\r\n");
      out.write("											<p>오늘의 쿨톤 의상 컨셉에 대해서 소개합니다.</p>\r\n");
      out.write("										</article>\r\n");
      out.write("										<article>\r\n");
      out.write("											<a href=\"#\" class=\"image\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/pic08.jpg\" alt=\"\" /></a>\r\n");
      out.write("											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>\r\n");
      out.write("										</article>\r\n");
      out.write("										<article>\r\n");
      out.write("											<a href=\"#\" class=\"image\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/pic09.jpg\" alt=\"\" /></a>\r\n");
      out.write("											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>\r\n");
      out.write("										</article>\r\n");
      out.write("									</div>\r\n");
      out.write("									<ul class=\"actions\">\r\n");
      out.write("										<li><a href=\"#\" class=\"button\">More</a></li>\r\n");
      out.write("									</ul>\r\n");
      out.write("								</section>\r\n");
      out.write("\r\n");
      out.write("							<!-- Section -->\r\n");
      out.write("								<section>\r\n");
      out.write("									<header class=\"major\">\r\n");
      out.write("										<h2>Get in touch</h2>\r\n");
      out.write("									</header>\r\n");
      out.write("									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>\r\n");
      out.write("									<ul class=\"contact\">\r\n");
      out.write("										<li class=\"icon solid fa-envelope\"><a href=\"#\">information@untitled.tld</a></li>\r\n");
      out.write("										<li class=\"icon solid fa-phone\">(000) 000-0000</li>\r\n");
      out.write("										<li class=\"icon solid fa-home\">1234 Somewhere Road #8254<br />\r\n");
      out.write("										Nashville, TN 00000-0000</li>\r\n");
      out.write("									</ul>\r\n");
      out.write("								</section>\r\n");
      out.write("\r\n");
      out.write("							<!-- Footer -->\r\n");
      out.write("								<footer id=\"footer\">\r\n");
      out.write("									<p class=\"copyright\">&copy; Untitled. All rights reserved. Demo Images: <a href=\"https://unsplash.com\">Unsplash</a>. Design: <a href=\"https://html5up.net\">HTML5 UP</a>.</p>\r\n");
      out.write("								</footer>\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
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
