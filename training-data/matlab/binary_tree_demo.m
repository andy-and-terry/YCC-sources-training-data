function node = bt_insert(node, value)
    if isempty(node)
        node = struct('value', value, 'left', [], 'right', []);
    elseif value < node.value
        node.left = bt_insert(node.left, value);
    else
        node.right = bt_insert(node.right, value);
    end
end

function result = bt_inorder(node)
    if isempty(node)
        result = [];
    else
        result = [bt_inorder(node.left), node.value, bt_inorder(node.right)];
    end
end

root = [];
values = [5, 3, 8, 1, 4, 7, 9];
for i = 1:length(values)
    root = bt_insert(root, values(i));
end

disp(bt_inorder(root))
