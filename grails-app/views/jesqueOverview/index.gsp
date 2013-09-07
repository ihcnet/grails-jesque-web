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

<hr/>

<g:render template="/jesqueWorking/working"/>

<script id="queues-body" type="text/x-handlebars-template">
    {{#each queues}}
    <tr class="clickable" data-target="${g.createLink(controller: 'jesqueQueues', action: 'detail')}/{{name}}">
        <td>{{name}}</td>
        <td>{{size}}</td>
    </tr>
    {{/each}}
</script>
<script id="failed-body" type="text/x-handlebars-template">
    <tr class="clickable {{#if author}}success{{else}}danger{{/if}}" data-target='${g.createLink(controller: 'jesqueFailed', action: 'index')}'>
    <td><strong><g:message code="jesque.web.queues.label.failed"/></strong></td>
    <td>{{failed}}</td>
</tr>
</script>
<g:javascript>
    var failedTemplate
    var queuesTemplate
    function update() {
        $.ajax({
            url: "${g.createLink(controller: 'jesqueQueues', action: 'list')}",
            success: function(results){
                $('tbody.queues').html(queuesTemplate(results));
            },
            beforeSend: function(){
            }
        }).always(function(){
            setTimeout(update, intervall)
        });
        $.ajax({
            url: "${g.createLink(controller: 'jesqueFailed', action: 'count')}",
            success: function(result) {
                $('tfoot.failed').html(failedTemplate(result));
            }
        });
    }
    $(document).ready(function () {
        failedTemplate = Handlebars.compile($("#failed-body").html());
        queuesTemplate = Handlebars.compile($("#queues-body").html());
        $('#intervall').val(intervall)
        update();
    });
</g:javascript>
</body>
</html>