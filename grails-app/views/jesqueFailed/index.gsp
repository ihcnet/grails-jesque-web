<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
    <title><g:message code="jesque.web.nav.failed"/></title>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <div class="container">
                <h1><g:message code="jesque.web.failed.head"/> <small><g:message code="jesque.web.failed.intro" args="[total]"/> </small></h1>
            </div>
        </div>
    </div>
</div>
<g:if test="${failures}">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <g:link class="btn btn-primary" action="retryAll"><g:message code="jesque.web.failed.label.retryAll"/></g:link>
                <g:link class="btn btn-danger" action="clear"><g:message code="jesque.web.failed.label.clear"/></g:link>
            </div>
        </div>
    </div>
</g:if>
<div class="row">
    <div class="col-md-12">
        <g:paginate total="${total}" max="${max}"/>
        <ul class="list-group">
            <g:each in="${failures}" var="job" status="index">
                <li class="list-group-item">
                    <div class="row">
                        <div class="col-md-8">
                            <g:link controller="jesqueWorkers" action="detail" id="${job.worker}"><jesque:workerShortName workerName="${job.worker}"/></g:link> on <b
                                class="queue-tag">${job.queue}</b> at <b><span class="time"><jesque:formatDate date="${job.failedAt}"/></span></b>
                        </div>

                        <div class="col-md-4">
                            <g:if test="${job.retriedAt}">
                                Retried <b><span class="time"><jesque:formatDate date="${job.retriedAt}"/></span></b>
                                <g:link controller="jesqueFailed" action="remove" id="${offset + index}" class="btn btn-primary btn-xs" rel="remove">Remove</g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="jesqueFailed" action="requeue" id="${offset + index}" class="btn btn-primary btn-xs" rel="remove">Retry</g:link>
                                <g:link controller="jesqueFailed" action="remove" id="${offset + index}" class="btn btn-primary btn-xs" rel="remove">Remove</g:link>
                            </g:else>
                        </div>
                    </div>

                    <dl>
                        <dd>

                        </dd>
                        <dt>Class</dt>
                        <dd>
                            <code>${job?.payload?.className ?: 'null'}</code>
                        </dd>
                        <dt>Arguments</dt>
                        <dd>
                            <pre><jesque:showArgs args="${job?.payload?.args ?: 'null'}"/></pre>
                        </dd>
                        <dt>Exception</dt>
                        <dd>
                            <code>${job?.exceptionString ?: 'null'}</code>
                        </dd>
                        <dt>Error</dt>
                        <dd>
                            <a href="#" class="toggle" data-target="#exception-${index}">${job?.error ?: 'no message'}</a>
                            <pre id="exception-${index}" class="hidden">${job?.exception}<jesque:asBacktrace failure="${job}"/></pre>
                        </dd>
                    </dl>

                    <div class="r"></div>
                </li>
            </g:each>
            <div class="paginateButtons">
                <g:paginate total="${total}" offset="${offset}" max="${max}"/>
            </div>
        </ul>
    </div>
</div>

%{--<p class="sub">Showing ${total ? offset + 1 : 0} to ${Math.min(offset + max, total)} of <b>${total}</b> jobs</p>--}%

</body>
</html>