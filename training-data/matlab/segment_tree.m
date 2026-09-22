function tree = segment_tree(data)
    n = numel(data);
    tree = zeros(1, 4 * n);
    tree = build_tree(tree, data, 1, 1, n);
end

function tree = build_tree(tree, data, node, start_idx, stop_idx)
    if start_idx == stop_idx
        tree(node) = data(start_idx);
        return;
    end
    mid = floor((start_idx + stop_idx) / 2);
    tree = build_tree(tree, data, 2 * node, start_idx, mid);
    tree = build_tree(tree, data, 2 * node + 1, mid + 1, stop_idx);
    tree(node) = tree(2 * node) + tree(2 * node + 1);
end

function tree = update_tree(tree, node, start_idx, stop_idx, index, value)
    if start_idx == stop_idx
        tree(node) = value;
        return;
    end
    mid = floor((start_idx + stop_idx) / 2);
    if index <= mid
        tree = update_tree(tree, 2 * node, start_idx, mid, index, value);
    else
        tree = update_tree(tree, 2 * node + 1, mid + 1, stop_idx, index, value);
    end
    tree(node) = tree(2 * node) + tree(2 * node + 1);
end

function total = query_tree(tree, node, start_idx, stop_idx, l, r)
    if r < start_idx || stop_idx < l
        total = 0;
        return;
    end
    if l <= start_idx && stop_idx <= r
        total = tree(node);
        return;
    end
    mid = floor((start_idx + stop_idx) / 2);
    total = query_tree(tree, 2 * node, start_idx, mid, l, r) + ...
            query_tree(tree, 2 * node + 1, mid + 1, stop_idx, l, r);
end

data = [1, 3, 5, 7, 9, 11];
n = numel(data);
tree = segment_tree(data);
disp(query_tree(tree, 1, 1, n, 2, 4))
tree = update_tree(tree, 1, 1, n, 2, 10);
disp(query_tree(tree, 1, 1, n, 2, 4))
