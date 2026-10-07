import groovy.text.SimpleTemplateEngine

def engine = new SimpleTemplateEngine()
def tpl = '''Dear $name,
<% items.each { %>  - ${it.title}: \\$${it.price}
<% } %>Total: \\$${items.sum { it.price }}
'''
def out = engine.createTemplate(tpl).make([
    name : 'Alice',
    items: [[title: 'Book', price: 12], [title: 'Pen', price: 3]]
])
println out.toString()
