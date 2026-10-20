import groovy.json.*
import groovy.xml.*
def json = new JsonBuilder([name: 'Ada', tags: ['a', 'b'], nested: [x: 1]])
println json.toString()
def parsed = new JsonSlurper().parseText('{"a":{"b":[1,2,3]},"s":"v"}')
println parsed.a.b.sum() + ' ' + parsed.s
println JsonOutput.prettyPrint('{"k":1}')
def sw = new StringWriter()
new MarkupBuilder(sw).root { item(id: 1, 'first'); item(id: 2, 'second') }
println sw
def xml = new XmlSlurper().parseText('<r><i id="1">a</i><i id="2">b</i></r>')
println xml.i.collect { it.text() } + ' ' + xml.i.find { it.@id == '2' }.text()
def f = File.createTempFile('demo', '.txt')
f.text = "l1\nl2\nl3\n"
println f.readLines().size() + ' ' + f.text.length()
f.eachLine { println it.toUpperCase() }
f << 'l4\n'
println f.readLines().last()
f.withWriter { it.println 'overwritten' }
println f.text.trim()
f.delete()
println f.exists()
