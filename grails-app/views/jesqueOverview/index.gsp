<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="jesque.web.nav.queues"/></title>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>

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
            <tbody class="queues">

            </tbody>
            <tfoot class="failed">

            </tfoot>
        </table>
    </div>
</div>

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
            <tbody id="workers">

            </tbody>
        </table>
    </div>
</div>

<script id="queues-body" type="text/x-handlebars-template">
    {{#each queues}}
    <tr class="clickable" data-target="${g.createLink(controller: 'jesqueQueues', action: 'detail')}/{{name}}">
        <td>{{name}}</td>
        <td>{{size}}</td>
    </tr>
    {{/each}}
</script>
<script id="failed-body" type="text/x-handlebars-template">
    <tr class="clickable {{#if failed}}danger{{else}}success{{/if}}" data-target='${g.createLink(controller: 'jesqueFailed', action: 'index')}'>
        <td><strong><g:message code="jesque.web.queues.label.failed"/></strong></td>
        <td>{{failed}}</td>
    </tr>
</script>
<script id="workingTemplate" type="text/x-handlebars-template">

    {{#if workers}}
    {{#each workers}}
    <tr>
        <td>
            {{#ifCond state.name '==' 'IDLE'}}
            <img src="${resource(dir: 'images', file: 'idle.png')}"
            {{/ifCond}}

            {{#ifCond state.name '==' 'POLL'}}
            <img src="${resource(dir: 'images', file: 'poll.png')}"
            {{/ifCond}}

            {{#ifCond state.name '==' 'WORKING'}}
            <img src="${resource(dir: 'images', file: 'working.png')}"
            {{/ifCond}}
            %{--<jesque:stateImg state="${worker.state.name().toLowerCase()}"/>--}%
        </td>
        <td>
            <a href="${g.createLink(controller: 'jesqueWorkers', action: 'detail')}/{{name}}">{{host}}:{{pid}}</a>
        </td>
        <td>
            {{#if status.queue}}
            <a href="${g.createLink(controller: 'jesqueQueues', action: 'detail')}/{{status.queue}}">{{status.queue}}</a>
            {{/if}}
        </td>
        <td>
            {{#if status.queue}}
            <code>{{status.payload.className}}</code>
            <small><a href="${createLink(controller: 'jesqueWorking', action: 'detail')}/{{name}}">{{status.runAt}}</a></small>
            {{else}}
            <span><g:message code="jesque.web.working.waiting"/></span>
            {{/if}}
        </td>
    </tr>
    {{/each}}
    {{else}}
    <tr class="alert">
        <td colspan="4"><g:message code="jesque.web.working.nothing"/></td>
    </tr>
    {{/if}}
    <g:if test="${!working}">

    </g:if>
    <g:else>
        <g:each in="${working}" var="worker">

        </g:each>
    </g:else>


    {{#each queues}}
    <tr class="clickable" data-target="${g.createLink(controller: 'jesqueQueues', action: 'detail')}/{{name}}">
        <td>{{name}}</td>
        <td>{{size}}</td>
    </tr>
    {{/each}}
</script>
<script type="text/javascript">
    var failedTemplate = null;
    var queuesTemplate = null;
    var workingTemplate = null;

    function update() {
        $.ajax({
            url: "${g.createLink(controller: 'jesqueQueues', action: 'list')}",
            success: function (results) {
                $('tbody.queues').html(queuesTemplate(results));
            },
            beforeSend: function () {
            }
        }).always(function () {
                    setTimeout(update, intervall)
                });
        $.ajax({
            url: "${g.createLink(controller: 'jesqueFailed', action: 'count')}",
            success: function (result) {
                $('tfoot.failed').html(failedTemplate(result));
            }
        });
        $.ajax({
            url: "${g.createLink(controller: 'jesqueWorking', action: 'list')}",
            success: function (results) {
                console.log(results)
                $('tbody#workers').html(workingTemplate(results));
            },
            beforeSend: function () {
            }
        });
    }
    $(document).ready(function () {
        failedTemplate = Handlebars.compile($("#failed-body").html());
        queuesTemplate = Handlebars.compile($("#queues-body").html());
        workingTemplate = Handlebars.compile($("#workingTemplate").html());
        $('#intervall').val(intervall)
        update();
    });
</script>
</body>
</html>