# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
function pell(count)
    terms = [0, 1]
    for i in 3:count
        push!(terms, 2 * terms[end] + terms[end-1])
    end
    return terms[1:count]
end

for (i, p) in enumerate(pell(15))
    println("P(", i - 1, ") = ", p)
end
