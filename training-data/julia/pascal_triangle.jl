function pascal(n::Int)
    rows = Vector{Vector{Int}}()
    for i in 1:n
        row = ones(Int, i)
        for j in 2:i-1
            row[j] = rows[i-1][j-1] + rows[i-1][j]
        end
        push!(rows, row)
    end
    return rows
end

for row in pascal(6)
    println(join(row, " "))
end
