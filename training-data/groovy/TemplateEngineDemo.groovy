import groovy.text.SimpleTemplateEngine
import groovy.text.GStringTemplateEngine

def engine = new SimpleTemplateEngine()
def text = '''Dear $name,
<% items.each { item -> %>  - ${item.title}: \\$${item.price}
<% } %>Total: \\$${items.sum { it.price }}
'''

def binding = [
    name : 'Ada',
    items: [[title: 'Book', price: 12], [title: 'Pen', price: 3]]
]
println engine.createTemplate(text).make(binding).toString()

def gengine = new GStringTemplateEngine()
def t = gengine.createTemplate('Hello ${who}, today is ${day}')
println t.make(who: 'World', day: 'Monday')

// Templates are reusable with different bindings
def greeter = engine.createTemplate('${greeting}, ${name}!')
['Hi': 'Bob', 'Yo': 'Cy'].each { g, n ->
    println greeter.make(greeting: g, name: n)
}
