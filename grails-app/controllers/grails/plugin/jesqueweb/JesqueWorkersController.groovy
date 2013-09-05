package grails.plugin.jesqueweb

class JesqueWorkersController extends JesqueController {

    def index() {
        def model = [:]
        def hostMap = workerInfoDao.workerHostMap
        def viewName
        if (hostMap.size() == 1) {
            viewName = 'singleHost'
            model.workers = hostMap.values().asList()[0]
        } else {
            viewName = 'multipleHosts'
            model.hostMap = hostMap
            model.totalWorkerCount = hostMap.values().flatten().size()
        }

        render(view: viewName, model: model)
    }

    def detail(String id) {
        def model = [:]
        def workerInfo = workerInfoDao.getWorker(id)
        def hostMap = workerInfoDao.workerHostMap
        def viewName

        if (workerInfo) {
            viewName = 'detail'
            model.activeSubTab = workerInfo.host
            model.worker = workerInfo
        } else if (id == 'all') {
            viewName = 'singleHost'
            model.workers = hostMap.values().asList().flatten()
        } else if (hostMap[id]) {
            viewName = 'singleHost'
            model.workers = hostMap[id]
        } else {
            redirect(action: 'index')
        }
        model.activeSubTabs = hostMap.keySet()
        model.subTabs = hostMap.size() > 1 ? hostMap.keySet() : null

        render view: viewName, model: model
    }

    def remove(String id) {

        def workerInfo = workerInfoDao.getWorker(id)

        if (workerInfo)
            workerInfoDao.removeWorker(id)

        if (workerInfoDao.workerHostMap[workerInfo.host])
            redirect(action: 'detail', id: workerInfo.host)
        else
            redirect(action: 'index')
    }
}
