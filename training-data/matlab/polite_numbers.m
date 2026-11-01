% Ways to write n as a sum of two or more consecutive positive integers.
ways = zeros(1, 16);
for n = 1:16
    k = 2;
    while k * (k + 1) / 2 <= n
        if mod(n - k * (k - 1) / 2, k) == 0
            ways(n) = ways(n) + 1;
        end
        k = k + 1;
    end
end
disp(num2str(ways));
