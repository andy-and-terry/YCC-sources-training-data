# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
function is_hamming(n)
    for p in (2, 3, 5)
        while n % p == 0
            n ÷= p
        end
    end
    return n == 1
end

println(join(first(filter(is_hamming, 1:100), 20), " "))
