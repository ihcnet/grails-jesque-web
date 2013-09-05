<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.workers.detail.head" args="[worker]"/> <small><g:message code="jesque.web.workers.detail.intro"/></small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th></th>
                <th><g:message code="jesque.web.workers.column.host"/></th>
                <th><g:message code="jesque.web.workers.column.pid"/></th>
                <th><g:message code="jesque.web.workers.column.processing"/></th>
                <th><g:message code="jesque.web.workers.column.failed"/></th>
                <th><g:message code="jesque.web.workers.column.queues"/></th>
                <th><g:message code="jesque.web.workers.column.started"/></th>
                <th><g:message code="jesque.web.workers.column.processed"/></th>
            </tr>
            </thead>
            <tr>
                <td>
                    <jesque:stateImg state="${worker.state.toString().toLowerCase()}"/>
                </td>
                <td>${worker.host}</td>
                <td>${worker.pid}</td>
                <td><span class="time"><jesque:formatDate date="${worker.started}"/></span></td>
                <td class="queues"><g:each in="${worker.queues}" var="queue"><g:link controller="jesqueQueues" action="detail" id="${queue}"
                                                                                     class="queue-tag">${queue}</g:link></g:each></td>
                <td>${worker.processed}</td>
                <td>${worker.failed}</td>
                <td class="process">
                    <g:if test="${worker.status}">
                        <code>${worker.status.payload.className}</code>
                        <small><g:link controller="jesqueWorking" action="detail" id="${worker}" class="queue time"><jesque:formatDate
                                date="${worker.status.runAt}"/></g:link></small>
                    </g:if>
                    <g:else>
                        <span class="waiting">Waiting for a job...</span>
                    </g:else>
                </td>
            </tr>
        </table>

    </div>
</div>
</body>
</html>