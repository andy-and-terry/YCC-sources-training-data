function pascal_row(n::Int)
    row = [big(1)]
    for k in 1:n
        push!(row, row[end] * (n - k + 1) ÷ k)
    end
    return row
end

println(pascal_row(5))
println(pascal_row(10))
println(sum(pascal_row(10)) == 2^10)
println(binomial(10, 3), " ", binomial(52, 5))

for n in 0:4
    println(" "^(4 - n), join(pascal_row(n), " "))
end
