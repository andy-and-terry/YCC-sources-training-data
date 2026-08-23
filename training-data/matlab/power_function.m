function result = my_power(base, exp)
    if exp == 0
        result = 1;
    elseif mod(exp, 2) == 0
        half = my_power(base, exp / 2);
        result = half * half;
    else
        result = base * my_power(base, exp - 1);
    end
end
