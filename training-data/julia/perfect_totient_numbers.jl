# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
phi(n) = count(k -> gcd(k, n) == 1, 1:n)

function chain_sum(m)
    total = 0
    while m > 1
        m = phi(m)
        total += m
    end
    return total
end

println(join(filter(n -> chain_sum(n) == n, 2:199), " "))
