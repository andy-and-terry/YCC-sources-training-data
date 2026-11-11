% Amicable pairs: d(a) == b and d(b) == a with a ~= b.
d = @(n) sum(find(mod(n, 1:n-1) == 0));

for a = 2:1499
    b = d(a);
    if b > a && d(b) == a
        fprintf('%d %d\n', a, b);
    end
end
