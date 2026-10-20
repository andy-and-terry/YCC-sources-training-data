module Geometry
export area, Circle
struct Circle; r::Float64; end
area(c::Circle) = π * c.r^2
helper() = "internal"
end
using .Geometry
println(area(Circle(1.0)), " ", Geometry.helper())
x = 1
function shadow()
    x = 2
    return x
end
function modify()
    global x
    x = 3
end
println(shadow(), x); modify(); println(x)
let y = 5
    println(y)
end
@isdefined(y) || println("y not defined")
function outer()
    n = 0
    inner() = n += 1
    inner(); inner()
    n
end
println(outer())
const K = 100
println(K, " ", isconst(@__MODULE__, :K), " ", nameof(Geometry), " ", parentmodule(area))
println(Base.@locals() |> length)
for i in 1:2 z = i end
println(@isdefined z)
