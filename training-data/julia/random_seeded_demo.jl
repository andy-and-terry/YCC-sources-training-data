using Random

# A seeded RNG object gives reproducible, independent streams.
rng1 = MersenneTwister(42)
rng2 = MersenneTwister(42)
println(rand(rng1, 3) == rand(rng2, 3))

rng = Xoshiro(1)
println(length(rand(rng, 1:6, 10)))
println(all(1 .<= rand(rng, 1:6, 100) .<= 6))

v = collect(1:10)
shuffle!(rng, v)
println(sort(v) == 1:10)
println(length(randperm(rng, 5)))

println(length(randstring(rng, 8)))
println(length(randsubseq(rng, 1:100, 0.5)) <= 100)

sample = rand(rng, ["a", "b", "c"])
println(sample in ["a", "b", "c"])

Random.seed!(rng, 7)
draw = rand(rng)
Random.seed!(rng, 7)
println(draw == rand(rng))
println(0 <= randn(rng)^2)
