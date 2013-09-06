package grails.plugin.jesqueweb

class JesqueOverviewController extends JesqueController {

    def index() {
        [
                queueList: jesqueQueueInfoService.queueInfos,
                totalFailureCount: jesqueFailureService.count,
                working: jesqueWorkerInfoService.activeWorkers,
                totalWorkerCount: jesqueWorkerInfoService.workerCount
        ]
    }

}
