function total = count_set_bits(n)
    total = 0;
    while n > 0
        total = total + bitand(n, 1);
        n = bitshift(n, -1);
    end
end

disp(count_set_bits(13))
disp(count_set_bits(255))
