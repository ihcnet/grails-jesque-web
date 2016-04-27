package grails.plugin.jesqueweb

import net.greghaines.jesque.meta.dao.KeysDAO

class JesqueKeysService {

    KeysDAO keysDao

    def getRedisInfo(){
        keysDao.redisInfo
    }

    def getKeyInfos(){
        keysDao.keyInfos
    }

    def getKeyInfo(String key, int offset, int max){
        keysDao.getKeyInfo(key, offset, max)
    }
}
