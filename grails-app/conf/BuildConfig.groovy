grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        mavenLocal()
        mavenCentral()
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "https://oss.sonatype.org/content/repositories/snapshots/"
    }
    dependencies {
        test "org.gebish:geb-spock:0.9.0"
    }
    plugins {
        compile(':redis:1.3.1') {
            export = false
        }
        compile(':jesque:0.6.2') {
            export = false
        }
        build(":tomcat:$grailsVersion")
        compile(":hibernate:$grailsVersion") {
            export = false
        }

        test(":spock:0.7") {
            export = false
            exclude "spock-grails-support"
        }
        test(":geb:0.9.0") {
            export = false
        }

        build(':release:2.0.2', ':rest-client-builder:1.0.2') {
            export = false
        }
    }
}

//grails.plugin.location.jesque = "../grails-jesque"