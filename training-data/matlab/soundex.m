names = {'Robert', 'Rupert', 'Tymczak', 'Pfister', 'Honeyman'};
for k = 1:numel(names)
    fprintf('%s -> %s\n', names{k}, soundex(names{k}));
end

function code = soundex(word)
    w = lower(word);
    groups = {'bfpv', 'cgjkqsxz', 'dt', 'l', 'mn', 'r'};
    digit = zeros(1, 26);
    for k = 1:numel(groups)
        digit(groups{k} - 'a' + 1) = k;
    end
    code = upper(w(1));
    last = digit(w(1) - 'a' + 1);
    for ch = w(2:end)
        d = digit(ch - 'a' + 1);
        if d > 0 && d ~= last
            code(end + 1) = char('0' + d);
        end
        if ch ~= 'h' && ch ~= 'w'
            last = d;
        end
    end
    code = [code '000'];
    code = code(1:4);
end
