import groovy.transform.CompileStatic
import groovy.transform.TypeChecked

@CompileStatic
class Calculator {
    int add(int a, int b) { a + b }

    List<Integer> squares(List<Integer> xs) {
        xs.collect { it * it }
    }

    static <T extends Comparable<T>> T maxOf(List<T> items) {
        T best = items[0]
        for (T item : items) {
            if (item > best) best = item
        }
        best
    }
}

@TypeChecked
String describe(Object o) {
    if (o instanceof String) {
        return "string of length ${o.length()}"
    } else if (o instanceof List) {
        return "list of size ${o.size()}"
    }
    "other: $o"
}

def calc = new Calculator()
println calc.add(2, 3)
println calc.squares([1, 2, 3])
println Calculator.maxOf(['pear', 'apple', 'zebra'])
println describe('hello')
println describe([1, 2])
println describe(42)
