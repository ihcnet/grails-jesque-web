<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <div class="container">
                <h1><g:message code="jesque.web.nav.queues"/> <small><g:message code="jesque.web.queues.intro"/></small></h1>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="jesque.web.queues.column.name"/></th>
                <th><g:message code="jesque.web.queues.column.jobs"/></th>
            </tr>
            </thead>
            <g:each in="${queueList}" var="queue">
                <tr class="clickable" data-target="${g.createLink(controller: 'jesqueQueues', action: 'detail', id: queue)}">
                    <td>${queue}</td>
                    <td>${queue.size}</td>
                </tr>
            </g:each>
            <tr class="clickable ${totalFailureCount == 0 ? 'success' : 'danger'}" data-target="${g.createLink(controller: 'jesqueFailed')}">
                <td><strong><g:message code="jesque.web.queues.label.failed"/></strong></td>
                <td>${totalFailureCount}</td>
            </tr>
        </table>
    </div>
</div>