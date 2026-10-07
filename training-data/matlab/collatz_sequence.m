function seq = collatz_sequence(n)
    seq = n;
    while n ~= 1
        if mod(n, 2) == 0
            n = n / 2;
        else
            n = 3 * n + 1;
        end
        seq(end + 1) = n;
    end
end

disp(collatz_sequence(6))
disp(numel(collatz_sequence(27)))
