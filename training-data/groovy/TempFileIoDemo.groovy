def f = File.createTempFile('demo', '.txt')
f.deleteOnExit()

f.text = "alpha\nbeta\ngamma\n"
f << "delta\n"

println f.readLines().size()
f.eachLine { line, n -> println "$n: $line" }
println f.readLines().collect { it.toUpperCase() }
println f.withReader { it.readLine() }

f.withWriter { w ->
    (1..3).each { w.println "line $it" }
}
println f.text.trim().split('\n').toList()
f.delete()
println f.exists()
