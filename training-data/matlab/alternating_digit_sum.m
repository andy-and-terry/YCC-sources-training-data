function alternating_digit_sum()
    for n = [1234 99999 1000]
        fprintf('%d %d\n', n, ads(n));
    end
end

function total = ads(n)
    digits = fliplr(num2str(n) - '0');
    signs = (-1) .^ (0:numel(digits)-1);
    total = sum(digits .* signs);
end
