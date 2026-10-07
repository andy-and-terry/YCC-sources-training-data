function order = bfs_graph(adjacency, start)
    n = numel(adjacency);
    visited = false(1, n);
    visited(start) = true;
    queue = start;
    order = [];
    while ~isempty(queue)
        node = queue(1);
        queue(1) = [];
        order(end + 1) = node; %#ok<AGROW>
        neighbors = adjacency{node};
        for i = 1:numel(neighbors)
            next = neighbors(i);
            if ~visited(next)
                visited(next) = true;
                queue(end + 1) = next; %#ok<AGROW>
            end
        end
    end
end

adjacency = {[2, 3], [1, 4], [1, 4], [2, 3, 5], [4]};
disp(bfs_graph(adjacency, 1))
