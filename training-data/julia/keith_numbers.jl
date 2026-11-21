# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function is_keith(n)
    seq = reverse(digits(n))
    k = length(seq)
    while seq[end] < n
        push!(seq, sum(seq[end-k+1:end]))
    end
    return seq[end] == n
end

println(join(filter(is_keith, 10:1199), " "))
