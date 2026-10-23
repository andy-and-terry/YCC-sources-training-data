// ConfigSlurper parses Groovy-syntax config with environment overrides
def text = '''
app {
    name = 'demo'
    retries = 3
}
db {
    url = 'jdbc:h2:mem:dev'
    pool.size = 5
}
environments {
    production {
        db.url = 'jdbc:postgresql://prod/app'
        db.pool.size = 20
    }
}
'''

def dev = new ConfigSlurper().parse(text)
println "dev url:  ${dev.db.url}"
println "dev pool: ${dev.db.pool.size}"

def prod = new ConfigSlurper('production').parse(text)
println "prod url:  ${prod.db.url}"
println "prod pool: ${prod.db.pool.size}"
println "shared:   ${prod.app.name} x${prod.app.retries}"

// flatten gives dotted keys
println prod.flatten().sort().collect { k, v -> "$k=$v" }.join('\n')
