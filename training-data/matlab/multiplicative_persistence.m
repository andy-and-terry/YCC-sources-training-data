function multiplicative_persistence()
    for n = [39 77 999 10]
        fprintf('%d %d\n', n, persistence(n));
    end
end

function steps = persistence(n)
    steps = 0;
    while n >= 10
        n = prod(num2str(n) - '0');
        steps = steps + 1;
    end
end
