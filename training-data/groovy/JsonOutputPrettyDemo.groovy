import groovy.json.JsonOutput
import groovy.json.JsonSlurper

def data = [
    name: 'Widget',
    price: 9.99,
    tags: ['a', 'b'],
    dims: [w: 3, h: 4],
    active: true,
    note: null
]
def json = JsonOutput.toJson(data)
println json
println JsonOutput.prettyPrint(json)

def back = new JsonSlurper().parseText(json)
assert back.dims.w == 3
println back.tags*.toUpperCase()
println JsonOutput.toJson([1, 'two', [three: 3]])
