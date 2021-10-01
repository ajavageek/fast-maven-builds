package blog.frankel.ch.fastmavenbuilds

import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.support.beans
import org.springframework.web.servlet.function.ServerResponse
import org.springframework.web.servlet.function.router

@SpringBootApplication
class FastMavenBuildsApplication

fun main(args: Array<String>) {
    runApplication<FastMavenBuildsApplication>(*args) {
        addInitializers(
            beans {
                bean {
                    CommandLineRunner {
                        println("Started Fast Maven Builds application")
                    }
                }
                bean {
                    router {
                        GET("/") { ServerResponse.ok().body("It was built fast!") }
                    }
                }
            }
        )
    }
}


