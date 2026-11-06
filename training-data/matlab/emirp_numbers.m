% Emirps: primes whose digit reversal is a different prime.
emirps = [];
for n = 2:99
    r = str2double(fliplr(num2str(n)));
    if r ~= n && isprime(n) && isprime(r)
        emirps(end + 1) = n; %#ok<AGROW>
    end
end
disp(emirps);
