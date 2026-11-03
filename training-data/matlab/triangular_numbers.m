n = 1:10;
tri = cumsum(n);
assert(isequal(tri, n .* (n + 1) / 2));
disp(tri);
