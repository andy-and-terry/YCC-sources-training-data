class Bag {
    private Map data = [:]
    def propertyMissing(String name) { data[name] }
    def propertyMissing(String name, value) { data[name] = value }
    def methodMissing(String name, args) {
        if (name.startsWith('has')) return data.containsKey(name[3..-1].toLowerCase())
        throw new MissingMethodException(name, Bag, args)
    }
}
def b = new Bag()
b.color = 'red'
b.size = 3
println b.color
println b.size
println b.hasColor()
println b.hasWeight()
try { b.explode() } catch (MissingMethodException e) { println 'no such method' }
