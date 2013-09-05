<%@ page contentType="text/html;charset=UTF-8" %>

<h1 class="wi"></h1>

<p class="intro"></p>
<table class="workers">
    <tr>

    </tr>

    <g:each in="${working}" var="worker">
        <tr>
            <td class="icon"><img src="<g:resource dir="images" file="${worker.state.name().toLowerCase()}.png"/>"
                                  alt="${worker.state.name().toLowerCase()}" title="${worker.state.name().toLowerCase()}"/></td>
            <td class="where"><g:link controller="jesqueWorkers" action="detail"
                                      id="${worker}">${worker.host}:${worker.pid}</g:link></td>
            <td class="queues queue">
                <g:link class="queue-tag" controller="jesqueQueues" action="detail"
                        id="${worker.status?.queue}">${worker.status?.queue}</g:link>
            </td>
            <td class="process">
                <g:if test="${worker.status?.queue}">
                    <code>${worker.status.payload.className}</code>
                    <small><g:link class="queue time" controller="jesqueWorking" action="detail"
                                   id="${worker}">${worker.status.runAt}</g:link></small>
                </g:if>
                <g:else>
                    <span class="waiting">Waiting for a job...</span>
                </g:else>
            </td>
        </tr>
    </g:each>
</table>

<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.working.head" args="[working.size(), totalWorkerCount]"/> <small><g:message code="jesque.web.working.intro"/></small></h1>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>&nbsp;</th>
                <th><g:message code="jesque.web.working.column.where"/></th>
                <th><g:message code="jesque.web.working.column.queue"/></th>
                <th><g:message code="jesque.web.working.column.processing"/></th>
            </tr>
            </thead>
            <g:if test="${!working}">
                <tr class="alert">
                    <td colspan="4"><g:message code="jesque.web.working.nothing"/></td>
                </tr>
            </g:if>
            <g:else>
                <g:each in="${working}" var="worker">
                    <tr>
                        <td>
                            <img src="<g:img dir="images" file="${worker.state.name().toLowerCase()}.png"/>" alt="${worker.state.name().toLowerCase()}"
                                 title="${worker.state.name().toLowerCase()}"/>
                        </td>
                        <td><g:link controller="jesqueWorkers" action="detail"
                                                  id="${worker}">${worker.host}:${worker.pid}</g:link></td>
                        <td>
                            <g:link class="queue-tag" controller="jesqueQueues" action="detail"
                                    id="${worker.status?.queue}">${worker.status?.queue}</g:link>
                        </td>
                        <td>
                            <g:if test="${worker.status?.queue}">
                                <code>${worker.status.payload.className}</code>
                                <small><g:link class="queue time" controller="jesqueWorking" action="detail"
                                               id="${worker}">${worker.status.runAt}</g:link></small>
                            </g:if>
                            <g:else>
                                <span class="waiting"><g:message code="jesque.web.working.waiting" /> </span>
                            </g:else>
                        </td>
                    </tr>
                </g:each>
            </g:else>
        </table>
    </div>
</div>