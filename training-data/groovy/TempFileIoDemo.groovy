def file = File.createTempFile('groovy-demo', '.txt')
file.deleteOnExit()

file.text = 'alpha\nbeta\ngamma\n'
println file.text.readLines()

file << 'delta\n'
file.withWriterAppend { writer ->
    writer.writeLine('epsilon')
}

println file.readLines().size()

file.eachLine { line, number ->
    if (number <= 2) {
        println "$number: $line"
    }
}

def upper = file.readLines().collect { it.toUpperCase() }
println upper.join(',')

file.withReader { reader ->
    println reader.readLine()
}

println file.length()
println file.exists()
println file.name.endsWith('.txt')

def copy = new File(file.parentFile, file.name + '.bak')
copy.bytes = file.bytes
println copy.text == file.text
copy.delete()
println copy.exists()
