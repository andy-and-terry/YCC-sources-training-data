class Outer {
    static int created = 0
    String name

    static class Nested {
        String label
        Nested(String label) { this.label = label; Outer.created++ }
    }

    class Inner {
        String describe() { "inner of $name" }
    }

    Inner makeInner() { new Inner() }
}

def n = new Outer.Nested('x')
println n.label
println Outer.created
def o = new Outer(name: 'parent')
println o.makeInner().describe()
