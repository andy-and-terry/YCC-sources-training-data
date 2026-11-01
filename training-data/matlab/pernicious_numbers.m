% Pernicious numbers: the popcount is prime.
out = [];
for n = 1:20
    c = sum(dec2bin(n) == '1');
    if isprime(c)
        out(end + 1) = n; %#ok<AGROW>
    end
end
disp(num2str(out));
