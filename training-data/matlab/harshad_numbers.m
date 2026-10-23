% Harshad (Niven) numbers: divisible by their digit sum
n = 1:50;
digit_sum = arrayfun(@(x) sum(num2str(x) - '0'), n);
harshad = n(mod(n, digit_sum) == 0);
disp(harshad);
fprintf('%d Harshad numbers up to 50\n', numel(harshad));
