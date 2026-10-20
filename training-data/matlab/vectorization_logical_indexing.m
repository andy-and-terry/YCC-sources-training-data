x = 1:10;
evens = x(mod(x, 2) == 0);
disp(evens)
x(x > 7) = 0;
disp(x)
mask = x > 2 & x < 6;
disp(find(mask))
disp(any(x == 0)); disp(all(x >= 0))
y = x .^ 2 + 3 * x - 1;
disp(y(1:3))
disp(cumsum(1:5)); disp(prod(1:5)); disp(diff([1 4 9 16]))
A = magic(4);
disp(A(A > 10)')
disp(sum(A(:)))
disp(numel(find(A > 8)))
[m, idx] = max(A(:));
disp([m idx])
disp(linspace(0, 1, 5))
disp(repmat([1 2], 2, 2))
