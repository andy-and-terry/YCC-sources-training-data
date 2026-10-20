function main()
    f = @(x) x .^ 2;
    g = @(x, y) x + y;
    disp(f(1:4)); disp(g(2, 3));
    h = @sin; disp(h(0));
    compose = @(f1, f2) @(x) f1(f2(x));
    disp(compose(@sqrt, @abs)(-16));
    disp(summ(1, 2, 3)); [a, b] = minmax([4 1 9]); disp([a b]);
    disp(fact(5)); disp(feval(@plus, 1, 2));
    disp(nargin('summ')); disp(func2str(f));
    cellfun(@(x) fprintf('%d;', x), {1, 2, 3}); fprintf('\n');
    disp(arrayfun(@(x) x * 2, 1:3)); disp(opt(5)); disp(opt(5, 10));
end
function s = summ(varargin)
    s = sum([varargin{:}]);
end
function [lo, hi] = minmax(v)
    lo = min(v); hi = max(v);
end
function r = fact(n)
    if n <= 1, r = 1; else, r = n * fact(n - 1); end
end
function r = opt(a, b)
    if nargin < 2, b = 1; end
    r = a * b;
end
