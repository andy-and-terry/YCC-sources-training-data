function apply_and_log(f::Function, values::Vector{Int})
    results = Int[]
    for v in values
        push!(results, f(v))
    end
    return results
end

squares = apply_and_log([1, 2, 3, 4]) do x
    x^2
end
println(squares)

total = reduce([1, 2, 3, 4, 5]; init = 0) do acc, x
    acc + x
end
println(total)

open(tempname(), "w") do io
    write(io, "hello from a do block\n")
end
