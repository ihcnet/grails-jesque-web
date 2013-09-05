<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="no-js" lang="en"><!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <title><g:message code="jesque.web.title" args="${g.layoutTitle()}"/></title>
    <link rel="shortcut icon" href="${img(dir: 'images', file: 'favicon.ico')}"/>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
</head>

<body>
<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand"><g:message code="jesque.web.brand"/></a>
        </div>
        <nav id="collapse" class="collapse navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li class="${actionName == 'overview' ? 'active' : ''}">
                    <g:link action="overview"><g:message code="jesque.web.nav.overview"/></g:link>
                </li>
                <li class="${actionName == 'working' ? 'active' : ''}">
                    <g:link action="working"><g:message code="jesque.web.nav.working"/></g:link>
                </li>
                <li class="${actionName == 'failed' ? 'active' : ''}">
                    <g:link action="failed"><g:message code="jesque.web.nav.failed"/></g:link>
                </li>
                <li class="${actionName == 'queues' ? 'active' : ''}">
                    <g:link action="queues"><g:message code="jesque.web.nav.queues"/></g:link>
                </li>
                <li class="${actionName == 'workers' ? 'active' : ''}">
                    <g:link action="workers"><g:message code="jesque.web.nav.workers"/></g:link>
                </li>
                <li class="${actionName == 'stats' ? 'active' : ''}">
                    <g:link action="stats"><g:message code="jesque.web.nav.stats"/></g:link>
                </li>
                <li class="${actionName == 'scheduled' ? 'active' : ''}">
                    <g:link action="scheduled"><g:message code="jesque.web.nav.scheduled"/></g:link>
                </li>
            </ul>
        </nav>
    </div>
</header>

<div class="container" style="margin-top: 55px;">
    <div class="col-md-12">
        <g:if test="${flash.message}">
            <div class="alert alert-dismissable ${flash.success == true ? 'alert-success' : flash.success == false ? 'alert-danger' : 'alert-info'}">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <g:message code="${flash.message}"/>
            </div>
        </g:if>
    </div>
</div>

<div class="container">
    <g:layoutBody/>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</div>
<g:javascript>
    $(document).ready(function () {
        $('.clickable').dblclick(function () {
            window.location = $(this).data('target')
        });
    });
</g:javascript>



%{--<div class="header">--}%
%{--<ul class="nav">--}%
%{--<g:each in="${tabs}" var="tab">--}%
%{--<li <g:if test="${tab == activeTab}">class="current"</g:if>>--}%
%{--<g:link controller="jesque${tab}">${tab}</g:link>--}%
%{--</li>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--<g:if test="${namespace != 'resque'}">--}%
%{--<abbr class="namespace" title="Resque's Redis Namespace">${namespace}</abbr>--}%
%{--</g:if>--}%
%{--</div>--}%
%{--<g:if test="${subTabs}">--}%
%{--<ul class="subnav">--}%
%{--<g:each in="${subTabs}" var="subTab">--}%
%{--<li<g:if test="${subTab == activeSubTab}">class="current"</g:if>><g:link action="detail" id="${subTab}"><span>${subTab}</span></g:link></li>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--</g:if>--}%
%{--<div id="main">--}%
%{--<g:layoutBody/>--}%
%{--</div>--}%

<div id="footer">
    <p>Powered by <a href="https://github.com/gresrun/jesque">Jesque</a> v${version} - Inspired by <a href="https://github.com/resque/resque">Resque</a></p>
    <%--todo: add common properties via some DRY approach --%>
    <p>Connected to Redis namespace ${namespace} on ${redisUri}</p>
</div>
</body>
</html>
