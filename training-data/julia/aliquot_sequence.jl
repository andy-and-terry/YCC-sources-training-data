# Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum(n) = sum(d for d in 1:n÷2 if n % d == 0; init = 0)

seq = [12]
while seq[end] > 1 && length(seq) < 20
    push!(seq, aliquot_sum(seq[end]))
end
println(join(seq, " "))
