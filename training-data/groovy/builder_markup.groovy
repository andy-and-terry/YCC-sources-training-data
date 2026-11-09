import groovy.xml.MarkupBuilder
def sw = new StringWriter()
new MarkupBuilder(sw).root {
    item(id: 1, 'first')
    item(id: 2, 'second')
}
println sw
