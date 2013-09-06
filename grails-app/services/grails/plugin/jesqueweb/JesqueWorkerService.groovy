package grails.plugin.jesqueweb

import net.greghaines.jesque.meta.dao.WorkerInfoDAO

class JesqueWorkerService {

    WorkerInfoDAO workerInfoDao

    def methodMissing(name, args) {
        workerInfoDao.invokeMethod(name, args)
    }
}
