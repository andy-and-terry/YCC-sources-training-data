import groovy.json.JsonSlurper
import groovy.json.JsonOutput

def data = [name: "Ada", age: 30, langs: ["Groovy", "Java"]]
def json = JsonOutput.toJson(data)
println json

def parsed = new JsonSlurper().parseText(json)
println parsed.name
println parsed.langs[0]
println JsonOutput.prettyPrint(json)
