import groovy.transform.ToString
import groovy.transform.EqualsAndHashCode

@ToString(includeNames = true)
@EqualsAndHashCode
class Point3D {
    int x, y, z
}

def a = new Point3D(x: 1, y: 2, z: 3)
def b = new Point3D(x: 1, y: 2, z: 3)

println a
println a == b
println a.hashCode() == b.hashCode()

def points = [a, b] as Set
println points.size()
