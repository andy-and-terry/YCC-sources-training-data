function result = roman_numerals(n)
    values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    symbols = {'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'};
    result = '';
    remaining = n;
    for i = 1:length(values)
        while remaining >= values(i)
            result = [result, symbols{i}];
            remaining = remaining - values(i);
        end
    end
end
