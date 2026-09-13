function count = number_of_islands(grid)
    [rows, cols] = size(grid);
    visited = false(rows, cols);
    count = 0;
    for r = 1:rows
        for c = 1:cols
            if grid(r, c) == 1 && ~visited(r, c)
                visited = flood_fill(grid, visited, r, c, rows, cols);
                count = count + 1;
            end
        end
    end
end

function visited = flood_fill(grid, visited, r, c, rows, cols)
    stack = [r, c];
    while ~isempty(stack)
        cur = stack(end, :);
        stack(end, :) = [];
        cr = cur(1);
        cc = cur(2);
        if cr < 1 || cr > rows || cc < 1 || cc > cols
            continue
        end
        if visited(cr, cc) || grid(cr, cc) == 0
            continue
        end
        visited(cr, cc) = true;
        stack = [stack; cr + 1, cc; cr - 1, cc; cr, cc + 1; cr, cc - 1];
    end
end
