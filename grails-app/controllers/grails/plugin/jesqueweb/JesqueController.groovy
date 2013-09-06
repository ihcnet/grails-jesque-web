package grails.plugin.jesqueweb
import grails.plugin.jesque.TriggerDaoService
import net.greghaines.jesque.meta.dao.KeysDAO
import net.greghaines.jesque.meta.dao.QueueInfoDAO
import net.greghaines.jesque.meta.dao.WorkerInfoDAO

abstract class JesqueController {

    QueueInfoDAO queueInfoDao
    WorkerInfoDAO workerInfoDao
    KeysDAO keysDao
    def scheduledJobDaoService
    TriggerDaoService triggerDaoService

    def jesqueConfigService
    def jesqueFailureService

    def afterInterceptor = { model ->
        model.version = jesqueConfigService.version
        model.namespace = jesqueConfigService.namespace
        model.redisUri = jesqueConfigService.uri
    }

}
