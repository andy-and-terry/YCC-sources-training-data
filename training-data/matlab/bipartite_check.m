function isBipartite = bipartite_check(adj, numNodes)
    color = zeros(1, numNodes);
    isBipartite = true;
    for start = 1:numNodes
        if color(start) ~= 0
            continue
        end
        color(start) = 1;
        queue = [start];
        while ~isempty(queue)
            node = queue(1);
            queue(1) = [];
            for neighbor = 1:numNodes
                if adj(node, neighbor) == 1
                    if color(neighbor) == 0
                        color(neighbor) = -color(node);
                        queue = [queue, neighbor];
                    elseif color(neighbor) == color(node)
                        isBipartite = false;
                        return
                    end
                end
            end
        end
    end
end

adj = [0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];
disp(bipartite_check(adj, 4))
