% Wilson's theorem primality test.
wilson = @(n) n >= 2 && mod(prod(2:n-1), n) == n - 1;
for n = 2:12   % factorial stays exact in double up to this range
    if wilson(n), fprintf('%d ', n); end
end
fprintf('\n');
