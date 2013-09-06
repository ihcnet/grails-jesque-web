<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.scheduled.head"/> <small><g:message code="jesque.web.scheduled.intro"/></small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped stable-hover">
            <thead>
            <tr>
                <th><g:message code="jesque.web.scheduled.column.name" /></th>
                <th><g:message code="jesque.web.scheduled.column.expression" /></th>
                <th><g:message code="jesque.web.scheduled.column.next" /></th>
                <th><g:message code="jesque.web.scheduled.column.queue" /></th>
                <th><g:message code="jesque.web.scheduled.column.job" /></th>
                <th><g:message code="jesque.web.scheduled.column.args" /></th>
            </tr>
            </thead>
            <tbody>
            <g:if test="${!scheduledJobs}">
                <tr>
                    <td colspan="4" class="no-data">No scheduled jobs</td>
                </tr>
            </g:if>
            <g:each in="${scheduledJobs}" var="scheduledJob">
                <tr>
                    <td>
                        ${scheduledJob.name}
                    </td>
                    <td>
                        ${scheduledJob.cronExpression}
                    </td>
                    <td>
                        ${scheduledJob.trigger.nextFireTime}
                    </td>
                    <td>
                        ${scheduledJob.jesqueJobQueue}
                    </td>
                    <td>
                        ${scheduledJob.jesqueJobName}
                    </td>
                    <td>
                        ${scheduledJob.args}
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>