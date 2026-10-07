function order = bfs_traverse(graph, start)
    visited = containers.Map('KeyType', 'char', 'ValueType', 'logical');
    visited(start) = true;
    queue = {start};
    order = {};
    while ~isempty(queue)
        node = queue{1};
        queue(1) = [];
        order{end+1} = node;
        neighbors = graph(node);
        for i = 1:numel(neighbors)
            n = neighbors{i};
            if ~isKey(visited, n)
                visited(n) = true;
                queue{end+1} = n;
            end
        end
    end
end

function order = dfs_traverse(graph, start)
    visited = containers.Map('KeyType', 'char', 'ValueType', 'logical');
    order = {};
    order = dfs_visit(graph, start, visited, order);
end

function order = dfs_visit(graph, node, visited, order)
    if isKey(visited, node)
        return;
    end
    visited(node) = true;
    order{end+1} = node;
    neighbors = graph(node);
    for i = 1:numel(neighbors)
        order = dfs_visit(graph, neighbors{i}, visited, order);
    end
end

graph = containers.Map();
graph('a') = {'b', 'c'};
graph('b') = {'d'};
graph('c') = {'d'};
graph('d') = {'e'};
graph('e') = {};

disp(bfs_traverse(graph, 'a'))
disp(dfs_traverse(graph, 'a'))
