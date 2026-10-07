import groovy.transform.CompileStatic
import groovy.transform.TypeChecked

@TypeChecked
int sumAll(List<Integer> xs) {
    int total = 0
    for (int x : xs) total += x
    return total
}

@CompileStatic
class Calc {
    static double average(Collection<? extends Number> nums) {
        double s = 0
        nums.each { s += it.doubleValue() }
        s / nums.size()
    }
}

println sumAll([1, 2, 3, 4])
println Calc.average([2, 4, 9])
