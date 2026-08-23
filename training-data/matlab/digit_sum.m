function total = digit_sum(n)
    total = 0;
    num = n;
    while num > 0
        total = total + mod(num, 10);
        num = floor(num / 10);
    end
end
