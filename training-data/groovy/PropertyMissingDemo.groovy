class Record {
    Map data = [:]

    def propertyMissing(String name) {
        return data[name]
    }

    def propertyMissing(String name, value) {
        data[name] = value
    }
}

def r = new Record()
r.title = "Groovy in Action"
r.year = 2015

println r.title
println r.year
println r.data
