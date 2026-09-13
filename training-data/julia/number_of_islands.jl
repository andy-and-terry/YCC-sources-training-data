function num_islands(grid::Matrix{Int})
    rows, cols = size(grid)
    visited = falses(rows, cols)
    count = 0

    function flood(r::Int, c::Int)
        stack = [(r, c)]
        while !isempty(stack)
            (cr, cc) = pop!(stack)
            if cr < 1 || cr > rows || cc < 1 || cc > cols
                continue
            end
            if visited[cr, cc] || grid[cr, cc] == 0
                continue
            end
            visited[cr, cc] = true
            push!(stack, (cr + 1, cc))
            push!(stack, (cr - 1, cc))
            push!(stack, (cr, cc + 1))
            push!(stack, (cr, cc - 1))
        end
    end

    for r in 1:rows, c in 1:cols
        if grid[r, c] == 1 && !visited[r, c]
            flood(r, c)
            count += 1
        end
    end
    return count
end

grid = [1 1 0 0 0;
        1 1 0 0 0;
        0 0 1 0 0;
        0 0 0 1 1]

println(num_islands(grid))
