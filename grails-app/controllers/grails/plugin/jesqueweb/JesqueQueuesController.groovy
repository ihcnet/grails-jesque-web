package grails.plugin.jesqueweb

class JesqueQueuesController extends JesqueController {

    def index() {
        def model = [:]

        model.queueList = queueInfoDao.queueInfos
        model.totalFailureCount = jesqueFailureService.count

        model
    }

    def detail() {
        def queueName = params.id
        def offset = params.offset?.isInteger() ? params.offset.toInteger() : 0
        def max = params.max?.isInteger() ? params.max.toInteger() : 20
        def model = [:]

        def queue = queueInfoDao.getQueueInfo(queueName, offset, max)
        if (!queue) {
            redirect(action: 'index')
            return
        }

        model.offset = offset
        model.max = max

        model.queueName = queueName

        model.subTabs = queueInfoDao.queueNames
        model.activeSubTab = queueName

        model.queue = queue
        model.total = model.queue.size

        model
    }

    def remove(String id) {
        queueInfoDao.removeQueue(id)

        redirect(action: 'index')
    }
}
