function node = bt_new(value)
    node = struct('value', value, 'left', [], 'right', []);
end

function root = bt_insert(root, value)
    if isempty(root)
        root = bt_new(value);
        return;
    end
    if value < root.value
        root.left = bt_insert(root.left, value);
    else
        root.right = bt_insert(root.right, value);
    end
end

function result = bt_inorder(root)
    result = [];
    if isempty(root)
        return;
    end
    result = [bt_inorder(root.left), root.value, bt_inorder(root.right)];
end

root = [];
values = [5, 3, 8, 1, 4, 7, 9];
for i = 1:length(values)
    root = bt_insert(root, values(i));
end
disp(bt_inorder(root))
