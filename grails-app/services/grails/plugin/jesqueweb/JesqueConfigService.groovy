package grails.plugin.jesqueweb

import net.greghaines.jesque.Config
import net.greghaines.jesque.utils.VersionUtils

class JesqueConfigService {

    Config jesqueConfig


    def getNamespace() {
        jesqueConfig.namespace
    }

    def getUri() {
        jesqueConfig.URI
    }

    def getVersion() {
        VersionUtils.version
    }

}
