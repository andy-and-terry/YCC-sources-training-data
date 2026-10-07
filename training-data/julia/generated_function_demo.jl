# @generated functions specialize their body per argument *type* at
# compile time: inside the body, `x` refers to the TYPE of the argument,
# and the function must return a quoted expression to run at call time.
@generated function describe_type(x)
    label = if x <: Integer
        "an integer type"
    elseif x <: AbstractFloat
        "a floating-point type"
    else
        "some other type"
    end
    # $label splices the compile-time-computed string into the returned
    # expression; typeof(x) below refers to the actual runtime argument.
    return :(string(typeof(x), " is ", $label))
end

println(describe_type(1))
println(describe_type(1.5))
println(describe_type("hi"))
println(describe_type(Int32(3)))
