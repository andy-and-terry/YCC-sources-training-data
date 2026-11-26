# Primorials up to 1e6, including 1; expect 8.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

values = [1]
acc = 1
p = 2
while true
    global acc, p
    if isprime(p)
        acc *= p
        acc > 10^6 && break
        push!(values, acc)
    end
    p += 1
end
println(length(values), " ", values)
