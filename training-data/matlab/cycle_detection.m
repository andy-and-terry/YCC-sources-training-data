function result = has_cycle(n, adj)
    WHITE = 0;
    GRAY = 1;
    BLACK = 2;
    color = zeros(1, n) + WHITE;
    result = false;

    for start = 1:n
        if color(start) == WHITE
            if dfs_visit(start)
                result = true;
                return;
            end
        end
    end

    function found = dfs_visit(u)
        color(u) = GRAY;
        found = false;
        for v = 1:n
            if adj(u, v) == 1
                if color(v) == GRAY
                    found = true;
                    return;
                elseif color(v) == WHITE && dfs_visit(v)
                    found = true;
                    return;
                end
            end
        end
        color(u) = BLACK;
    end
end

cyclic = [0 1 0; 0 0 1; 1 0 0];
disp(has_cycle(3, cyclic))

acyclic = [0 1 1; 0 0 1; 0 0 0];
disp(has_cycle(3, acyclic))
