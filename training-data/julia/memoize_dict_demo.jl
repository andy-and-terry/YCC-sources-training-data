const fib_cache = Dict{Int,BigInt}()

function fib(n::Int)
    n <= 2 && return big(1)
    get!(fib_cache, n) do
        fib(n - 1) + fib(n - 2)
    end
end

println(fib(10))
println(fib(90))
println(fib(150))
println(length(fib_cache))

function memoize(f)
    cache = Dict()
    return x -> get!(() -> f(x), cache, x)
end

slow_square(x) = (println("computing ", x); x^2)
fast = memoize(slow_square)
println(fast(4))
println(fast(4))
