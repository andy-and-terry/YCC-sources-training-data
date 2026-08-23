function [root, parent] = uf_find(parent, x)
    if parent(x) == x
        root = x;
    else
        [root, parent] = uf_find(parent, parent(x));
    end
end

function parent = uf_union(parent, x, y)
    [root_x, parent] = uf_find(parent, x);
    [root_y, parent] = uf_find(parent, y);
    if root_x ~= root_y
        parent(root_x) = root_y;
    end
end

parent = 1:5;
parent = uf_union(parent, 1, 2);
parent = uf_union(parent, 2, 3);
[r1, parent] = uf_find(parent, 1);
[r3, parent] = uf_find(parent, 3);
disp(r1 == r3)
