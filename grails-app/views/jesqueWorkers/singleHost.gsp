<html>
<head>
    <title><g:message code="jesque.web.nav.workers"/></title>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.workers.single.head" args="[workers ? workers.size() : 0]"/> <small><g:message code="jesque.web.workers.single.intro"/></small></h1>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th></th>
                <th><g:message code="jesque.web.working.column.where"/></th>
                <th><g:message code="jesque.web.working.column.queue"/></th>
                <th><g:message code="jesque.web.working.column.processing"/></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${workers}" var="worker">
                <tr class="clickable" data-target="${g.createLink(action: 'detail', id: worker)}">
                    <td>
                        <jesque:stateImg state="${worker.state.toString().toLowerCase()}"/>
                    </td>
                    <td>
                        ${worker.host}:${worker.pid}
                    </td>
                    <td>
                        <g:each in="${worker.queues}" var="queue">
                            <g:link class="queue-tag" controller="jesqueQueues" action="detail" id="${queue}">${queue}</g:link>
                        </g:each>
                    </td>
                    <td>
                        <g:if test="${worker.status}">
                            <code>${worker.status.payload.className}</code>
                            <small><g:link class="queue time" controller="jesqueWorking" action="detail" id="${worker}">
                                <jesque:formatDate date="${worker.status.runAt}"/></g:link>
                            </small>
                        </g:if>
                        <g:else>
                            <span><g:message code="jesque.web.workers.waiting"/></span>
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${!worker.status}">
                            <g:link class="btn btn-danger btn-xs" action="remove" id="${worker.name}"
                                    onclick="return confirm('${g.message(code: 'jesque.web.workers.confirm')}')"><g:message code="jesque.web.workers.remove"/></g:link>
                        </g:if>
                    </td>
                </tr>
            </g:each>
            <g:if test="${!workers}">
                <tr class="alert">
                    <td colspan="5"><g:message code="jesque.web.workers.none"/></td>
                </tr>
            </g:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>