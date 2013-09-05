<html>
<head>
    <meta name="layout" content="${(grailsApplication.config.jesque.views.layout) ?: 'jesque'}"/>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1><g:message code="jesque.web.workers.multi.head"/> <small><g:message code="jesque.web.workers.multi.intro"/></small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="jesque.web.workers.column.hostname"/></th>
                <th><g:message code="jesque.web.workers.column.workers"/></th>
            </tr>
            </thead>
            <tbody>

            <g:each in="${hostMap}" var="entry">
                <tr class="clickable" data-target="${g.createLink(action: 'detail', id: entry.key)}">
                    <td>${entry.key}</td>
                    <td>${entry.value.size}</td>
                </tr>
            </g:each>
            <tr class="clickable" data-target="${g.createLink(action: 'detail', id: 'all')}">
                <td>all workers</td>
                <td>${totalWorkerCount}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>