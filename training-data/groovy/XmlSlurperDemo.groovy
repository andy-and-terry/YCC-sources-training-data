import groovy.xml.MarkupBuilder
import groovy.xml.XmlSlurper

def xml = '''<library>
  <book id="1"><title>Dune</title><year>1965</year></book>
  <book id="2"><title>Emma</title><year>1815</year></book>
</library>'''

def lib = new XmlSlurper().parseText(xml)
println lib.book.size()
println lib.book*.title*.text()
println lib.book.find { it.@id == '2' }.title
println lib.book.findAll { it.year.toInteger() > 1900 }.title

def sw = new StringWriter()
new MarkupBuilder(sw).items { item(id: 1, 'one'); item(id: 2, 'two') }
println sw
