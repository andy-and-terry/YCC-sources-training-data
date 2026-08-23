function order = topo_sort(graph, keys_list)
    visited = containers.Map('KeyType', 'char', 'ValueType', 'logical');
    order = {};
    for i = 1:numel(keys_list)
        [visited, order] = visit_node(keys_list{i}, graph, visited, order);
    end
end

function [visited, order] = visit_node(node, graph, visited, order)
    if isKey(visited, node) && visited(node)
        return;
    end
    visited(node) = true;
    if isKey(graph, node)
        deps = graph(node);
        for i = 1:numel(deps)
            [visited, order] = visit_node(deps{i}, graph, visited, order);
        end
    end
    order{end+1} = node;
end
