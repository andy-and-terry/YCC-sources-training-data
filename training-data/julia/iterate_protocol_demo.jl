struct FibonacciSeq
    n::Int
end

function Base.iterate(fib::FibonacciSeq, state = (0, 1, 0))
    a, b, count = state
    if count >= fib.n
        return nothing
    end
    return (a, (b, a + b, count + 1))
end

Base.length(fib::FibonacciSeq) = fib.n
Base.eltype(::Type{FibonacciSeq}) = Int

for value in FibonacciSeq(8)
    print(value, " ")
end
println()

println(collect(FibonacciSeq(6)))
