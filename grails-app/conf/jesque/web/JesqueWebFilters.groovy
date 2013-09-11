package jesque.web

class JesqueWebFilters {

    def grailsApplication

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if (grailsApplication.config.grails.jesque.enabled == false) {
                    render('Jesque is disabled')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
