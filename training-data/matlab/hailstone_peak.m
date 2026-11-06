% Highest value reached by the Collatz (hailstone) sequence from n.
function hailstone_peak()
    disp(peak(27));
end

function best = peak(n)
    best = n;
    while n ~= 1
        if mod(n, 2) == 0
            n = n / 2;
        else
            n = 3 * n + 1;
        end
        best = max(best, n);
    end
end
