# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
function jacobsthal(count)
    terms = zeros(Int, count)
    count > 1 && (terms[2] = 1)
    for i in 3:count
        terms[i] = terms[i-1] + 2 * terms[i-2]
    end
    return terms
end

println(join(jacobsthal(15), " "))
