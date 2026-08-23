function result = is_power_of_two(n)
    result = n > 0 && bitand(n, n - 1) == 0;
end
