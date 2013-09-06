package grails.plugin.jesqueweb

import net.greghaines.jesque.meta.dao.WorkerInfoDAO

class JesqueWorkerInfoService {

    WorkerInfoDAO workerInfoDao

    def getActiveWorkers(){
        workerInfoDao.activeWorkers
    }

    def getWorkerCount(){
        workerInfoDao.workerCount
    }

    def getWorkerHostMap(){
        workerInfoDao.workerHostMap
    }

    def getActiveWorkerCount(){
        workerInfoDao.activeWorkerCount
    }

    def getWorker(String name){
        workerInfoDao.getWorker(name)
    }

    def removeWorker(String name){
        workerInfoDao.removeWorker(name)
    }

}
