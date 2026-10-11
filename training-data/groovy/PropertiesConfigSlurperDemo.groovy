def config = new ConfigSlurper().parse('''
app {
    name = 'demo'
    port = 8080
}
db {
    url = "jdbc:${app.name}"
    pool { size = 5 }
}
environments {
    dev { app.port = 9090 }
}
''')
println config.app.name
println config.db.url
println config.db.pool.size
println config.app.port
println config.flatten()

def props = new Properties()
props.load(new StringReader('a=1\nb=two\n# comment'))
println props.a + props.b
println props.stringPropertyNames().sort()
