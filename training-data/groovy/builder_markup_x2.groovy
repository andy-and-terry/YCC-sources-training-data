import groovy.xml.MarkupBuilder
def w = new StringWriter()
new MarkupBuilder(w).list { item(id: 1, 'a'); item(id: 2, 'b') }
println w
