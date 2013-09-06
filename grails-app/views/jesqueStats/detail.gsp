<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.stats.detail.head"/> <small>${title}</small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <g:each in="${stats}" var="entry">
                <g:if test="${entry.key}">
                    <tr>
                        <th>${entry.key}</th>
                        <td>${entry.value}</td>
                    </tr>
                </g:if>
            </g:each>
            <g:if test="${keys}">
                <tr>
                    <th class="statHeader">Key</th>
                    <th class="statHeader">Type</th>
                    <th class="statHeader">Size</th>
                </tr>
                <g:each in="${keys}" var="key">
                    <tr>
                        <th><g:link controller="jesqueStats" action="keys" id="${key}">${key}</g:link></th>
                        <td>${key.type}</td>
                        <td>${key.size}</td>
                    </tr>
                </g:each>
            </g:if>
        </table>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
    </div>
</div>
</body>
</html>