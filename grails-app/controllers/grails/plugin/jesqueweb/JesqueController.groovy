package grails.plugin.jesqueweb
import grails.plugin.jesque.TriggerDaoService
import net.greghaines.jesque.meta.dao.KeysDAO
import net.greghaines.jesque.meta.dao.WorkerInfoDAO

abstract class JesqueController {

    WorkerInfoDAO workerInfoDao
    KeysDAO keysDao
    def scheduledJobDaoService
    TriggerDaoService triggerDaoService

    def jesqueConfigService
    def jesqueFailureService
    def jesqueQueueInfoService

    def afterInterceptor = { model ->
        model.version = jesqueConfigService.version
        model.namespace = jesqueConfigService.namespace
        model.redisUri = jesqueConfigService.uri
    }

}
