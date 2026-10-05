def file = File.createTempFile('demo', '.txt')
file.deleteOnExit()

file.text = '''name,score
ann,90
bob,72
cid,85
'''

file << 'dee,64\n'

def rows = file.readLines().tail().collect { it.split(',') }
println rows.collect { [name: it[0], score: it[1] as int] }
println rows.sum { it[1] as int } / rows.size()

file.eachLine(1) { line, no -> if (no <= 2) println "$no: $line" }

def top = rows.max { it[1] as int }
println "top: ${top[0]}"

file.withWriter { w ->
    rows.each { w.println "${it[0].toUpperCase()}\t${it[1]}" }
}
println file.text.readLines()
println file.length() > 0
