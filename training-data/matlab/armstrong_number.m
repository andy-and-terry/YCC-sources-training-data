function result = is_armstrong(n)
    digits_str = num2str(n);
    power = length(digits_str);
    total = sum(arrayfun(@(c) str2double(c)^power, digits_str));
    result = (total == n);
end
