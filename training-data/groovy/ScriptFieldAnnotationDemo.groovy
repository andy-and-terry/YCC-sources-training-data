import groovy.transform.Field

@Field int calls = 0
@Field List<String> log = []

def record(String msg) {
    calls++
    log << msg
}

record('start')
record('work')
record('stop')

println "calls = $calls"
println log.join(' -> ')
