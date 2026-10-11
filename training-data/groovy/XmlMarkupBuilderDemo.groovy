import groovy.xml.MarkupBuilder

def sw = new StringWriter()
def xml = new MarkupBuilder(sw)
xml.library(name: 'City') {
    book(id: 1) {
        title('Groovy in Action')
        author('Koenig')
    }
    book(id: 2) {
        title('Programming Groovy')
        author('Subramaniam')
    }
    mkp.comment('end of list')
}
println sw.toString()

def doc = new XmlParser().parseText(sw.toString())
println doc.book.title*.text()
println doc.book.find { it.@id == '2' }.author.text()
