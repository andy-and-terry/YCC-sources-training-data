def file = File.createTempFile('demo', '.txt')
file.deleteOnExit()

file.text = "alpha\nbeta\ngamma\n"
file << "delta\n"
file.withWriterAppend { w -> w.println 'epsilon' }

println "Size: ${file.length()} bytes"
println "Lines: ${file.readLines().size()}"

file.eachLine { line, no -> println "$no: ${line.toUpperCase()}" }

def longWords = file.readLines().findAll { it.length() > 4 }
println longWords

file.withReader { r ->
    println "First line: ${r.readLine()}"
}

def copy = new File(file.parentFile, file.name + '.copy')
copy.bytes = file.bytes
println copy.exists() && copy.text == file.text
copy.delete()

new File(System.getProperty('java.io.tmpdir')).eachFileMatch(~/demo.*\.txt/) {
    println "found temp file: ${it.name.startsWith('demo')}"
}
