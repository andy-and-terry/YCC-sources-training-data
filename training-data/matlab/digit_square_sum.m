function total = digit_square_sum(n)
    digits = num2str(abs(n)) - '0';
    total = sum(digits .^ 2);
end

disp(digit_square_sum(123));
disp(digit_square_sum(-99));
