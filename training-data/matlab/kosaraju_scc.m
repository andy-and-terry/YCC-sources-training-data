function sccs = kosaraju_scc(adj, numNodes)
    visited = false(1, numNodes);
    order = [];
    for i = 1:numNodes
        if ~visited(i)
            [visited, order] = fill_order(adj, i, visited, order, numNodes);
        end
    end

    transposed = adj';
    visited = false(1, numNodes);
    sccs = {};
    for idx = numel(order):-1:1
        node = order(idx);
        if ~visited(node)
            [visited, component] = collect_component(transposed, node, visited, numNodes);
            sccs{end + 1} = component;
        end
    end
end

function [visited, order] = fill_order(adj, node, visited, order, numNodes)
    visited(node) = true;
    for neighbor = 1:numNodes
        if adj(node, neighbor) == 1 && ~visited(neighbor)
            [visited, order] = fill_order(adj, neighbor, visited, order, numNodes);
        end
    end
    order = [order, node];
end

function [visited, component] = collect_component(adj, node, visited, numNodes)
    visited(node) = true;
    component = [node];
    for neighbor = 1:numNodes
        if adj(node, neighbor) == 1 && ~visited(neighbor)
            [visited, more] = collect_component(adj, neighbor, visited, numNodes);
            component = [component, more];
        end
    end
end

adj = zeros(5);
adj(1, 2) = 1; adj(2, 3) = 1; adj(3, 1) = 1; adj(3, 4) = 1; adj(4, 5) = 1;
sccs = kosaraju_scc(adj, 5);
for i = 1:numel(sccs)
    disp(sccs{i})
end
