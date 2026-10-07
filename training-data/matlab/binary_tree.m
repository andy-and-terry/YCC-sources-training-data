function node = bt_insert(node, value)
    if isempty(node)
        node = struct('value', value, 'left', [], 'right', []);
        return;
    end
    if value < node.value
        node.left = bt_insert(node.left, value);
    elseif value > node.value
        node.right = bt_insert(node.right, value);
    end
end

function result = bt_inorder(node, result)
    if isempty(node)
        return;
    end
    result = bt_inorder(node.left, result);
    result(end + 1) = node.value;
    result = bt_inorder(node.right, result);
end

root = [];
values = [5, 3, 8, 1, 4, 7, 9];
for i = 1:numel(values)
    root = bt_insert(root, values(i));
end
disp(bt_inorder(root, []))
