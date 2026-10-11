using Random

function estimate_pi(n; rng = MersenneTwister(2024))
    inside = 0
    for _ in 1:n
        x, y = rand(rng), rand(rng)
        inside += (x^2 + y^2 <= 1)
    end
    return 4 * inside / n
end

for n in (1_000, 100_000)
    est = estimate_pi(n)
    println(n, " samples: ", est, " error ", abs(est - pi))
end
