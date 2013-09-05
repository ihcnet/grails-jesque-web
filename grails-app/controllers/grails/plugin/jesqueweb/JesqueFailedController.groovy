package grails.plugin.jesqueweb

class JesqueFailedController extends JesqueController {

    def index() {
        def offset = params.offset?.isInteger() ? params.offset.toInteger() : 0
        def max = params.max?.isInteger() ? params.max.toInteger() : 10
        def model = [:]

        model.offset = offset
        model.max = max
        model.fullFailureCount = failureDao.count
        model.total = model.fullFailureCount
        model.failures = failureDao.getFailures(offset, max)

        model
    }

    def requeue(long id) {
        failureDao.requeue(id.toLong())

        redirect(action: 'index')
    }

    def remove(long id) {
        failureDao.remove(id.toLong())

        redirect(action: 'index')
    }

    def clear() {
        failureDao.clear()

        redirect(action: 'index')
    }

    def retryAll() {
        failureDao.count.times {
            failureDao.requeue(it)
        }

        redirect(action: 'index')
    }
}
