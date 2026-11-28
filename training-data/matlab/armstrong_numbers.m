function armstrong_numbers()
    result = [];
    for n = 1:999
        d = num2str(n) - '0';
        if sum(d .^ numel(d)) == n
            result(end + 1) = n;
        end
    end
    disp(result); % 1..9 153 370 371 407
end
