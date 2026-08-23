function count = n_queens(queens, n)
    if numel(queens) == n
        count = 1;
        return;
    end
    count = 0;
    for col = 0:n-1
        if is_safe(queens, col)
            count = count + n_queens([queens, col], n);
        end
    end
end

function safe = is_safe(queens, col)
    safe = true;
    for i = 1:numel(queens)
        dist = numel(queens) - i + 1;
        if queens(i) == col || abs(queens(i) - col) == dist
            safe = false;
            return;
        end
    end
end
