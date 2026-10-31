function self_describing_numbers()
    for n = [1210 2020 21200 1211]
        fprintf('%d %d\n', n, is_self_describing(n));
    end
end

function ok = is_self_describing(n)
    d = num2str(n) - '0';
    ok = true;
    for i = 1:numel(d)
        if sum(d == i - 1) ~= d(i)
            ok = false;
            return;
        end
    end
end
