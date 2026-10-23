# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
function padovan(count)
    p = ones(Int, count)
    for i in 4:count
        p[i] = p[i-2] + p[i-3]   # 1-based indexing
    end
    return p
end

println(join(padovan(15), " "))
