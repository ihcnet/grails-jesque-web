package grails.plugin.jesqueweb
import grails.plugin.jesque.TriggerDaoService

abstract class JesqueController {

    def scheduledJobDaoService
    TriggerDaoService triggerDaoService

    def jesqueConfigService
    def jesqueFailureService
    def jesqueQueueInfoService
    def jesqueWorkerInfoService
    def jesqueKeysService

    def afterInterceptor = { model ->
        model.version = jesqueConfigService.version
        model.namespace = jesqueConfigService.namespace
        model.redisUri = jesqueConfigService.uri
    }

}
