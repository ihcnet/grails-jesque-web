class JesqueUrlMappings {

    static mappings = {
        "/jesque"(controller: 'jesqueOverview')

        "/jesque/overview"(controller: 'jesqueOverview')

        "/jesque/working"(controller: 'jesqueWorking')

        "/jesque/failed"(controller: 'jesqueFailed')

        "/jesque/queues"(controller: 'jesqueQueues')
        "/jesque/queues/details/$id"(controller: 'jesqueQueues', action: 'detail')

        "/jesque/workers"(controller: 'jesqueWorkers')

        "/jesque/stats"(controller: 'jesqueStats')

        "/jesque/scheduled"(controller: 'jesqueScheduled')
    }
}
