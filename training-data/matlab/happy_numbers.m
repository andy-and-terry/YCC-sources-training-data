function happy_numbers()
    found = [];
    n = 1;
    while numel(found) < 8
        if is_happy(n)
            found(end + 1) = n;
        end
        n = n + 1;
    end
    disp(found); % 1 7 10 13 19 23 28 31
end

function tf = is_happy(n)
    seen = [];
    while n ~= 1 && ~ismember(n, seen)
        seen(end + 1) = n;
        d = num2str(n) - '0';
        n = sum(d .^ 2);
    end
    tf = (n == 1);
end
