# Val turns an ordinary value into a type parameter, so multiple
# dispatch can pick a method for it instead of an if/elseif chain --
# and when the value is known at the call site, the compiler can
# specialize the whole dispatch away at compile time.
area(::Val{:circle}, r) = pi * r^2
area(::Val{:square}, s) = s^2
area(::Val{:triangle}, base, height) = 0.5 * base * height

shape_area(shape::Symbol, args...) = area(Val(shape), args...)

println(shape_area(:circle, 2.0))
println(shape_area(:square, 3.0))
println(shape_area(:triangle, 4.0, 5.0))
