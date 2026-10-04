println '42' as Integer
println '3.14' as BigDecimal
println 65 as char
println([1, 2, 2, 3] as Set)
println([a: 1, b: 2].keySet() as List)
println('abc' as List)
println(['x', 'y'] as String[])
println((1..5) as int[])

interface Greeter { String greet(String name) }
def g = { name -> "Hello, $name" } as Greeter
println g.greet('Ada')

def multi = [
    greet: { n -> "Hi $n" },
    toString: { 'custom greeter' }
] as Greeter
println multi.greet('Bo')

class Celsius {
    double deg
    Object asType(Class c) {
        if (c == Double) return deg
        if (c == String) return "${deg}C"
        super.asType(c)
    }
}
def temp = new Celsius(deg: 21.5)
println temp as String
println temp as Double

println('x'.isInteger() ? 'int' : 'not a number')
