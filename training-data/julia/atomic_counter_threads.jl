using Base.Threads

# Compare a racy counter with an atomic one.
const counter = Atomic{Int}(0)

@threads for i in 1:1000
    atomic_add!(counter, 1)
end
println("atomic total: ", counter[])

# Per-thread partial sums avoid contention without atomics.
partials = zeros(Int, nthreads())
@threads :static for i in 1:1000
    partials[threadid()] += i
end
println("sum: ", sum(partials))

old = atomic_xchg!(counter, 10)
println(old, " -> ", counter[])
println(atomic_cas!(counter, 10, 20), " ", counter[])
