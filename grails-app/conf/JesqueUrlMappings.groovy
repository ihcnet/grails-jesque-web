class JesqueUrlMappings {

    static mappings = {
        "/jesque"(controller: 'jesqueOverview')

        "/jesque/overview"(controller: 'jesqueOverview', action: 'index')

        "/jesque/working"(controller: 'jesqueWorking')

        "/jesque/failed"(controller: 'jesqueFailed')
        "/jesque/failed/retryAll"(controller: 'jesqueFailed', action: 'retryAll')
        "/jesque/failed/clear"(controller: 'jesqueFailed', action: 'clear')
        "/jesque/failed/remove/$id"(controller: 'jesqueFailed', action: 'remove')
        "/jesque/failed/requeue/$id"(controller: 'jesqueFailed', action: 'requeue')

        "/jesque/queues"(controller: 'jesqueQueues')
        "/jesque/queues/details/$id"(controller: 'jesqueQueues', action: 'detail')

        "/jesque/workers"(controller: 'jesqueWorkers')

        "/jesque/stats"(controller: 'jesqueStats')

        "/jesque/scheduled"(controller: 'jesqueScheduled')
    }
}
