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

            </tbody>
        </table>
        <ul id="pager" class="pagination">
        </ul>
        %{--<g:paginate total="${total}" offset="${offset}" max="${max}" id="${queue}"/>--}%
    </div>
</div>
<script id="jobs-body" type="text/x-handlebars-template">
    {{#if jobs}}
    {{#each jobs}}
    <tr>
        <td class="class">{{className}}</td>
        <td class="args">{{args}}</td>
    </tr>
    {{/each}}
    {{else}}
    <tr>
        <td class="no-data" colspan="2"><g:message code="jesque.web.queues.detail.jobs.none"/></td>
    </tr>
    {{/if}}
</script>
<script id="paginate-template" type="text/x-handlebars-template">
    {{#paginate pagination type="previous"}}
    <li class="{{#if disabled}}disabled{{/if}}"><a href="" onclick="previous(); return false;">Prev</a></li>
    {{/paginate}}
    {{#paginate pagination type="middle" limit="7"}}
    <li class="{{#if active}}active{{/if}}"><a href="" onclick="setPage({{n}}); return false;">{{n}}</a></li>
    {{/paginate}}
    {{#paginate pagination type="next"}}
    <li class="{{#if disabled}}disabled{{/if}}"><a href="" onclick="next();return false;">Next</a></li>
    {{/paginate}}
</div>
</script>
<g:javascript>
    var offset = 0;
    var listSize = 20;
    var pages = 0
    var currentPage = 1;
    var template
    var pagerTemplate

    function setPage(newPage) {
        currentPage = newPage
        update();
    }

    function previous(){
        if(currentPage > 1)
            setPage(currentPage-1)
    }

    function next(){
        if(currentPage < pages)
            setPage(currentPage+1)
    }

    function update(){
        $.ajax({
            url: "${g.createLink(controller: 'jesqueQueues', action: 'work', id: queueName)}",
            data: { offset: offset, max: listSize },
            success: function(result){
                pages = Math.ceil(result.queue.size / listSize)
                $('tbody').html(template(result.queue));
                $('#pager').html(pagerTemplate({pagination: {page: currentPage , pageCount: pages}}))

            }
        })
    }

    $(document).ready(function(){
        template = Handlebars.compile($("#jobs-body").html());
        pagerTemplate = Handlebars.compile($("#paginate-template").html());
        update();
    })
</g:javascript>
</body>
</html>