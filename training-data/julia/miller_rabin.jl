function power_mod(base::Int, exp::Int, mod::Int)
    result = 1
    base = base % mod
    while exp > 0
        if isodd(exp)
            result = (result * base) % mod
        end
        exp = exp >> 1
        base = (base * base) % mod
    end
    return result
end

function is_probably_prime(n::Int, rounds::Int=20)
    if n < 2
        return false
    end
    if n == 2 || n == 3
        return true
    end
    if iseven(n)
        return false
    end

    d = n - 1
    r = 0
    while iseven(d)
        d = div(d, 2)
        r += 1
    end

    for _ in 1:rounds
        a = rand(2:n-2)
        x = power_mod(a, d, n)
        if x == 1 || x == n - 1
            continue
        end
        composite = true
        for _ in 1:r-1
            x = power_mod(x, 2, n)
            if x == n - 1
                composite = false
                break
            end
        end
        if composite
            return false
        end
    end
    return true
end

for n in [97, 561, 7919, 100, 104729]
    println(n, " -> ", is_probably_prime(n))
end
