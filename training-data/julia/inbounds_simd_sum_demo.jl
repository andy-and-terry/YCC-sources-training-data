# @inbounds skips bounds checks and @simd allows vectorized reduction.
# Only use @inbounds when indices are guaranteed valid.

function sum_checked(v)
    s = 0.0
    for i in 1:length(v)
        s += v[i]
    end
    return s
end

function sum_fast(v)
    s = 0.0
    @inbounds @simd for i in eachindex(v)
        s += v[i]
    end
    return s
end

v = collect(1.0:1000.0)
println(sum_checked(v))
println(sum_fast(v))
println(sum_fast(v) == sum(v))

# Bounds checking still protects normal code
try
    v[1001]
catch err
    println(typeof(err))
end

# Dot product written with @inbounds
function dot3(a, b)
    @assert length(a) == length(b)
    acc = 0.0
    @inbounds for i in eachindex(a, b)
        acc += a[i] * b[i]
    end
    return acc
end
println(dot3([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]))
