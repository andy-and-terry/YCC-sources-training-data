String.metaClass.shout = { -> delegate.toUpperCase() + '!' }
println 'hi'.shout()
Integer.metaClass.double = { -> delegate * 2 }
println 5.double()
def e = new Expando(name: 'dyn')
e.greet = { "hi $name" }
println e.greet()
class Cat { static category = [] }
class StringExt { static String twice(String s) { s * 2 } }
use(StringExt) { println 'ab'.twice() }
class Dyn {
    def props = [:]
    def propertyMissing(String n, v) { props[n] = v }
    def propertyMissing(String n) { props[n] }
}
def dyn = new Dyn()
dyn.color = 'red'
println dyn.color
class A { def hello() { 'A.hello' } }
A.metaClass.hello = { -> 'patched' }
println new A().hello()
println A.metaClass.respondsTo(new A(), 'hello').size()
def obj = new Object()
obj.metaClass.extra = 42
println obj.extra
println 'abc'.metaClass.methods.any { it.name == 'toUpperCase' }
@groovy.transform.Memoized
def slow(n) { n * n }
println slow(9)
println Eval.me('2 + 3 * 4')
println new GroovyShell().evaluate('"sh".toUpperCase()')
