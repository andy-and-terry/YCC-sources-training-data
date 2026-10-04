import groovy.text.SimpleTemplateEngine
import groovy.text.StreamingTemplateEngine

def engine = new SimpleTemplateEngine()

def tpl = engine.createTemplate('Dear ${name}, you owe $${amount}. <% if (late) { %>This is overdue!<% } %>')
println tpl.make([name: 'Ada', amount: 42, late: true]).toString()
println tpl.make([name: 'Bob', amount: 10, late: false]).toString()

def listTpl = engine.createTemplate('''Items:
<% items.each { item -> %>  - ${item.toUpperCase()}
<% } %>Total: ${items.size()}''')
println listTpl.make([items: ['pen', 'ink', 'pad']])

def streaming = new StreamingTemplateEngine().createTemplate('Hello, ${who}!')
println streaming.make([who: 'world'])

// Closure-based lazy GString
def counter = 0
def lazy = "count=${-> ++counter}"
println lazy
println lazy
