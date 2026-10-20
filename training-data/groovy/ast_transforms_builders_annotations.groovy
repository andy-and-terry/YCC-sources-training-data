import groovy.transform.*
@Canonical class Pt { int x, y }
println new Pt(1, 2)
println new Pt(1, 2) == new Pt(1, 2)
@Sortable(includes = ['last', 'first']) class Name { String first, last }
println([new Name(first: 'b', last: 'z'), new Name(first: 'a', last: 'z'), new Name(first: 'c', last: 'a')]*.first)
@Builder class Car { String make; int year }
println Car.builder().make('VW').year(1999).build().make
@TupleConstructor class T { String a; int b = 5 }
println new T('x').b
@EqualsAndHashCode class E { int v }
println([new E(v: 1), new E(v: 1)].toSet().size())
@Lazy class LL { @Lazy list = { println 'init'; [1, 2] }() }
def ll = new LL(); println 'before'; println ll.list
@Singleton class S { def v = 7 }
println S.instance.v
@TypeChecked int add(int a, int b) { a + b }
println add(2, 3)
@CompileStatic class CS { static String hi() { 'static' } }
println CS.hi()
@Delegate List<Integer> inner = [1, 2, 3]
println inner.size()
def sb = new StringBuilder()
sb.with { append 'a'; append 'b' }
println sb
@WithReadLock def r() { 'locked' }
@AutoClone class AC implements Cloneable { List l = [1] }
println new AC().clone().l
