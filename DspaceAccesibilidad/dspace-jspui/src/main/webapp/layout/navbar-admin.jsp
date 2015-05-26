<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Navigation bar for admin pages
--%>

<%--    
Version: AHAR(Handicap Accessible Repository) 1.0
Fecha : 019-nov-2014, 22:39
Author  : http://www.dspace.org/license
Modificado por : Antonio Paternina - apaternina
Descripciòn : Se agregan atributos a etiquetas y se modifica el codigo html para que los plugines de accesibilidad
              puedan leerlo
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="org.dspace.sort.SortOption" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@page import="org.apache.commons.lang.StringUtils"%>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script  type="text/javascript">
    /* 
     apaternina - Se agregan las funciones  quitarNoScriptNavbar y quitarNoScript, para quitar las etiquetas noscript, que son
     leidas por lectores de pantalla, lo que no está bien.
     */
    quitarNoScriptNavbar();
    quitarNoScript();
</script>
<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf('?');
    if (c > -1) {
        currentPage = currentPage.substring(0, c);
    }

    // E-mail may have to be truncated
    String navbarEmail = null;
    if (user != null) {
        navbarEmail = user.getEmail();
    }

%>
<!--
       Fecha :  Noviembre de 2014
       Autor - desarrollador : Antonio José Paternina Cardenas
       Descripción : Se agregan los acceskey, clases css y key para cambiar la visualización del menú/navbar
-->
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="<%= request.getContextPath()%>/"><img height="25px" class="tamañoLogo" src="<%= request.getContextPath()%>/image/FUTCO/LOGOFITCO_trans.png" /></a>
</div>
<nav class="collapse navbar-collapse bs-navbar-collapse" role="menubar">
    <ul class="nav navbar-nav">
        <li><a href="<%= request.getContextPath()%>/"><span class="glyphicon glyphicon-home" accesskey="1"></span> <fmt:message key="jsp.layout.navbar-default.home"/></a></li>

        <li class="dropdown" role="menuitem"  >
            <a href="#" class="dropdown-toggle"  accesskey="2" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-admin.contents"/> <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="<%= request.getContextPath()%>/tools/edit-communities"><fmt:message key="jsp.layout.navbar-admin.communities-collections"/></a></li>
                <li class="divider"></li>
                <li><a href="<%= request.getContextPath()%>/tools/edit-item"><fmt:message key="jsp.layout.navbar-admin.items"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/workflow"><fmt:message key="jsp.layout.navbar-admin.workflow"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/supervise"><fmt:message key="jsp.layout.navbar-admin.supervisors"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/curate"><fmt:message key="jsp.layout.navbar-admin.curate"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/withdrawn"><fmt:message key="jsp.layout.navbar-admin.withdrawn"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/privateitems"><fmt:message key="jsp.layout.navbar-admin.privateitems"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/metadataimport"><fmt:message key="jsp.layout.navbar-admin.metadataimport"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/batchmetadataimport"><fmt:message key="jsp.layout.navbar-admin.batchmetadataimport"/></a></li>               
            </ul>
        </li>

        <li class="dropdown" role="menuitem">
            <a href="#" class="dropdown-toggle" accesskey="3" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-admin.accesscontrol"/> <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="<%= request.getContextPath()%>/dspace-admin/edit-epeople"><fmt:message key="jsp.layout.navbar-admin.epeople"/></a></li>
                <li><a href="<%= request.getContextPath()%>/tools/group-edit"><fmt:message key="jsp.layout.navbar-admin.groups"/></a></li>
                <li><a href="<%= request.getContextPath()%>/tools/authorize"><fmt:message key="jsp.layout.navbar-admin.authorization"/></a></li>
            </ul>
        </li>
        <li><a accesskey="4" href="<%= request.getContextPath()%>/statistics"><fmt:message key="jsp.layout.navbar-admin.statistics"/></a></li>
        <li class="dropdown" role="menuitem">
            <a href="#" accesskey="5" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="jsp.layout.navbar-admin.settings"/> <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="<%= request.getContextPath()%>/dspace-admin/metadata-schema-registry"><fmt:message key="jsp.layout.navbar-admin.metadataregistry"/></a></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/format-registry"><fmt:message key="jsp.layout.navbar-admin.formatregistry"/></a></li>
                <li class="divider"></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/news-edit"><fmt:message key="jsp.layout.navbar-admin.editnews"/></a></li>
                <li class="divider"></li>
                <li><a href="<%= request.getContextPath()%>/dspace-admin/license-edit"><fmt:message key="jsp.layout.navbar-admin.editlicense"/></a></li>
            </ul>
        </li>          
        <li accesskey="6" class="<%= (currentPage.endsWith("/help") ? "active" : "")%>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.site-admin\") %>"><fmt:message key="jsp.layout.navbar-admin.help"/></dspace:popup></li>
        </ul>
        <div class="nav navbar-nav navbar-right">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" role="menuitem">

                    <a href="#" accesskey="7" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.loggedin">
                        <fmt:param><%= StringUtils.abbreviate(navbarEmail, 20)%></fmt:param>
                    </fmt:message> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath()%>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
                    <li><a href="<%= request.getContextPath()%>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
                    <li><a href="<%= request.getContextPath()%>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>

                    <li><a href="<%= request.getContextPath()%>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a></li>

                </ul>
            </li>
        </ul>

    </div>
</nav>
