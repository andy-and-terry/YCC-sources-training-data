module Geometry

export Circle, area, perimeter

struct Circle
    radius::Float64
end

area(c::Circle) = π * c.radius^2
perimeter(c::Circle) = 2 * π * c.radius

# Not exported — only reachable as Geometry.helper_constant, demonstrating
# that a module's namespace controls what leaks into the caller by default.
helper_constant() = 42

end # module Geometry

using .Geometry

c = Geometry.Circle(3.0)
println(area(c))
println(perimeter(c))
println(Geometry.helper_constant())
