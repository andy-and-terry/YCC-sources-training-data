def f = File.createTempFile("demo", ".txt")
f.deleteOnExit()

f.text = "line one\nline two\n"
f << "line three\n"
f.withWriterAppend { it.println "line four" }

println f.readLines().size()
f.eachLine { line, n -> println "$n: $line" }
println f.readLines().findAll { it.contains("t") }
println f.text.split("\n").collect { it.toUpperCase() }
println f.length() > 0
f.withReader { r -> println r.readLine() }
