function find_any_all_demo()
    v = [4 8 15 16 23 42];
    disp(find(v > 10));
    disp(find(v > 10, 1));
    disp(find(v > 10, 2, 'last'));
    disp(any(v == 15));
    disp(all(v > 0));

    M = [1 0 3; 0 5 0; 7 8 0];
    [r, c] = find(M);
    disp([r c]);
    disp(any(M));
    disp(all(M, 2)');
    disp(nnz(M));

    [m, idx] = max(v);
    fprintf('max %d at %d\n', m, idx);
    [~, order] = sort(v, 'descend');
    disp(order);
    disp(isempty(find(v > 100)));
end
