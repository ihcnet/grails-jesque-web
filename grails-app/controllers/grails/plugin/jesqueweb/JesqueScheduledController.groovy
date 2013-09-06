package grails.plugin.jesqueweb

class JesqueScheduledController extends JesqueController {

    def index() {
        [scheduledJobs: scheduledJobDaoService.all]
    }
}
