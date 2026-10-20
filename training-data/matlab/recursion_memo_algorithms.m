function main()
    disp(arrayfun(@fib, 0:10));
    disp(gcd_r(48, 18));
    disp(hanoi(5));
    disp(qsort([3 6 1 8 2 9 2]));
    disp(bsearch([1 3 5 7 9], 7));
    disp(primes_upto(30));
    disp(perms_count(4));
end
function r = fib(n)
    if n < 2, r = n; else, r = fib(n - 1) + fib(n - 2); end
end
function r = gcd_r(a, b)
    if b == 0, r = a; else, r = gcd_r(b, mod(a, b)); end
end
function r = hanoi(n)
    if n == 0, r = 0; else, r = 2 * hanoi(n - 1) + 1; end
end
function v = qsort(v)
    if numel(v) <= 1, return; end
    p = v(1); r = v(2:end);
    v = [qsort(r(r < p)), p, qsort(r(r >= p))];
end
function idx = bsearch(v, t)
    lo = 1; hi = numel(v); idx = -1;
    while lo <= hi
        mid = floor((lo + hi) / 2);
        if v(mid) == t, idx = mid; return; elseif v(mid) < t, lo = mid + 1; else, hi = mid - 1; end
    end
end
function p = primes_upto(n)
    s = true(1, n); s(1) = false;
    for i = 2:floor(sqrt(n)), if s(i), s(i * i:i:n) = false; end, end
    p = find(s);
end
function c = perms_count(n)
    c = size(perms(1:n), 1);
end
