function result = is_bipartite(adj)
    n = size(adj, 1);
    color = zeros(1, n);

    for start = 1:n
        if color(start) ~= 0
            continue;
        end
        color(start) = 1;
        queue = start;
        while ~isempty(queue)
            node = queue(1);
            queue(1) = [];
            for neighbor = 1:n
                if adj(node, neighbor) == 1
                    if color(neighbor) == 0
                        color(neighbor) = -color(node);
                        queue(end + 1) = neighbor;
                    elseif color(neighbor) == color(node)
                        result = false;
                        return;
                    end
                end
            end
        end
    end
    result = true;
end

even_cycle = [0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];
disp(is_bipartite(even_cycle))

odd_cycle = [0 1 1; 1 0 1; 1 1 0];
disp(is_bipartite(odd_cycle))
