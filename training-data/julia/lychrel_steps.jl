# Reverse-and-add until a palindrome; count the steps.
rev(n) = parse(BigInt, reverse(string(n)))

function steps(n)
    n = big(n)
    for count in 0:99
        count > 0 && n == rev(n) && return count
        n += rev(n)
    end
    return -1
end

println(join(map(steps, [56, 57, 59, 79, 89]), " "))
