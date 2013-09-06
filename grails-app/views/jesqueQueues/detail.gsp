<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.queues.detail.head" args="[queueName]"/> <small><g:message code="jesque.web.queues.detail.intro" args="[total, queue]"/></small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <g:link class="btn btn-danger" action="remove" id="${queue.name}" onclick="return confirm('${g.message(code: 'jesque.web.queues.remove.confirm')}');">
            <g:message code="jesque.web.queues.remove"/>
        </g:link>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="jesque.web.queues.column.class"/></th>
                <th><g:message code="jesque.web.queues.column.args"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${queue.jobs}" var="job">
                <tr>
                    <td class="class">${job.className}</td>
                    <td class="args"><jesque:toJson value="${job.args}"/></td>
                </tr>
                <g:if test="${!queue.jobs}">
                    <tr>
                        <td class="no-data" colspan="2">There are no pending jobs in this queue</td>
                    </tr>
                </g:if>
            </g:each>

            </tbody>
        </table>
        <g:paginate total="${total}" offset="${offset}" max="${max}" id="${queue}"/>
    </div>
</div>
</body>
</html>