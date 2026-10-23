# A Harshad (Niven) number is divisible by the sum of its digits.
is_harshad(n::Integer) = n > 0 && n % sum(digits(n)) == 0

println(filter(is_harshad, 1:50))
println(count(is_harshad, 1:1000))

# Longest run of consecutive Harshad numbers below 200
function longest_run(limit)
    best_start, best_len, start = 1, 0, 0
    for n in 1:limit
        if is_harshad(n)
            start == 0 && (start = n)
            if n - start + 1 > best_len
                best_start, best_len = start, n - start + 1
            end
        else
            start = 0
        end
    end
    return best_start:(best_start + best_len - 1)
end

println(longest_run(200))
