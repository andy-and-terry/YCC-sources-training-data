% Integer (1..3999) to Roman numeral using a greedy table.
function int_to_roman()
    fprintf('%s %s\n', to_roman(1994), to_roman(58));
end

function out = to_roman(n)
    values = [1000 900 500 400 100 90 50 40 10 9 5 4 1];
    symbols = {'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'};
    out = '';
    for i = 1:numel(values)
        while n >= values(i)
            out = [out symbols{i}]; %#ok<AGROW>
            n = n - values(i);
        end
    end
end
