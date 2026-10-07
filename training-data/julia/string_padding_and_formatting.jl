using Printf

names = ["Al", "Beatrice", "Sam"]
scores = [9, 87, 100]

for (name, score) in zip(names, scores)
    println(rpad(name, 10) * lpad(string(score), 5))
end

println(join(names, ", "))
println(@sprintf("Pi is approximately %.3f", pi))
