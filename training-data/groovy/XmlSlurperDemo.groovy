import groovy.xml.XmlSlurper
import groovy.xml.MarkupBuilder

def xml = '''
<library name="City">
  <book id="1" year="1999"><title>Alpha</title><price>12.50</price></book>
  <book id="2" year="2010"><title>Beta</title><price>20.00</price></book>
  <book id="3" year="2015"><title>Gamma</title><price>8.25</price></book>
</library>'''

def lib = new XmlSlurper().parseText(xml)
println lib.@name
println lib.book.size()
println lib.book*.title*.text()
println lib.book.find { it.@id == '2' }.title.text()
println lib.book.findAll { it.@year.toInteger() > 2000 }*.title*.text()
println lib.book.collect { it.price.toBigDecimal() }.sum()

def writer = new StringWriter()
def mb = new MarkupBuilder(writer)
mb.catalog {
    lib.book.each { b ->
        item(id: b.@id.text(), b.title.text())
    }
}
println writer
