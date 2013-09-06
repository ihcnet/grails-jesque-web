package grails.plugin.jesqueweb

import net.greghaines.jesque.meta.KeyType

class JesqueStatsController extends JesqueController {

    def detail(String id) {
        if (!id)
            id = 'redis'
        def model = [:]
        switch (id) {
            case "resque":
                model.title = g.message(code: 'jesque.web.stats.resque.intro', args: [jesqueConfigService.uri])
                model.stats = createResqueStats()
                break
            case "redis":
                model.title = g.message(code: 'jesque.web.stats.redis.intro', args: [jesqueConfigService.uri])
                model.stats = jesqueKeysService.redisInfo
                break
            case "keys":
                model.title = g.message(code: 'jesque.web.stats.keys.intro', args: [jesqueConfigService.uri])
                model.keys = jesqueKeysService.keyInfos
                break
        }
        model
    }

    def keys(String id) {
        def offset = params.offset
        def max = params.max
        offset = offset?.isInteger() ? offset.toInteger() : 0
        max = max?.isInteger() ? max.toInteger() : 20

        def model = [:]

        def viewName
        def keyInfo = jesqueKeysService.getKeyInfo(jesqueConfigService.namespace + ':' + id, offset, max)
        if (!keyInfo) {
            viewName = 'keyString'
            model.keyName = id
        } else if (keyInfo.type == KeyType.STRING) {
            viewName = 'keyString'
            model.key = keyInfo
        } else {
            viewName = 'keySet'
            model.key = keyInfo
            model.max = max
            model.offset = offset
            model.total = keyInfo.size
        }

        render(view: viewName, model: model)
    }

    private Map<String, Object> createResqueStats() {
        def resqueStats = [:]
        resqueStats.environment = "development"
        resqueStats.failed = jesqueFailureService.count
        resqueStats.pending = jesqueQueueInfoService.pendingCount
        resqueStats.processed = jesqueQueueInfoService.processedCount
        resqueStats.queues = jesqueQueueInfoService.queueNames.size()
        resqueStats.servers = "[ $jesqueConfigService.uri ]"
        resqueStats.workers = jesqueWorkerInfoService.workerCount
        resqueStats.working = jesqueWorkerInfoService.activeWorkerCount
        return resqueStats
    }
}
