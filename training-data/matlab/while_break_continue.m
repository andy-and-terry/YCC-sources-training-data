n = 0;
while true
    n = n + 1;
    if mod(n, 2) == 0, continue; end
    if n > 9, break; end
    fprintf('%d ', n);
end
fprintf('\n');
