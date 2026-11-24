# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function mobius(n::Int)
    result = 1
    p = 2
    while p * p <= n
        if n % p == 0
            n ÷= p
            n % p == 0 && return 0
            result = -result
        end
        p += 1
    end
    return n > 1 ? -result : result
end

println(join(mobius.(1:30), " "))
