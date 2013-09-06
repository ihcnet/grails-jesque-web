package grails.plugin.jesqueweb

class JesqueOverviewController extends JesqueController {

    def index() {
        [
                queueList: queueInfoDao.queueInfos,
                totalFailureCount: jesqueFailureService.count,
                working: workerInfoDao.activeWorkers,
                totalWorkerCount: workerInfoDao.workerCount
        ]
    }

}
