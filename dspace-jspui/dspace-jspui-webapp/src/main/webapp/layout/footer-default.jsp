<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
    int overallColSpan = 3;
    if (sidebar == null)
    {
        overallColSpan = 2;
    }
%>
                    <%-- End of page content --%>
                    <p>&nbsp;</p>
                </td>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
                <td class="sidebar">
                    <%= sidebar %>
                </td>
<%
    }
%>
            </tr>

            <%-- Page footer --%>
             <tr class="pageFooterBar">
                <td colspan="<%= overallColSpan %>" class="pageFootnote">
                    <table class="pageFooterBar" width="100%">
                        <tr>
                            <%-- <td>
                                <a href="http://validator.w3.org/check?uri=referer"><img
                                    src="<%= request.getContextPath() %>/image/valid-xhtml10.png"
                                    alt="Valid XHTML 1.0!" height="31" width="88" /></a>
                            </td> -->
                            <td class="pageFootnote">
                                <fmt:message key="jsp.layout.footer-default.text"/>&nbsp;-
								<%
                                    String fromPage = UIUtil.getOriginalURL(request);
                                    fromPage = URLEncoder.encode(fromPage);
                                %>
                                <a target="_blank" href="<%= request.getContextPath() %>/feedback?fromPage=<%= fromPage %>"><fmt:message key="jsp.layout.footer-default.feedback"/></a>
                                <a href="<%= request.getContextPath() %>/htmlmap"></a>
                            </td>
                            <td nowrap="nowrap" valign="middle"> <%-- nowrap, valign for broken NS 4.x --%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
<%-- Start Google Analytics Code --%>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("<%= ConfigurationManager.getProperty("xmlui.google.analytics.key") %>");
pageTracker._trackPageview();
} catch(err) {}</script>

<%-- End Google Analytics Code --%>
    </body>
</html>