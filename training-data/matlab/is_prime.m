function result = is_prime(n)
    if n < 2
        result = false;
        return;
    end
    for i = 2:floor(sqrt(n))
        if mod(n, i) == 0
            result = false;
            return;
        end
    end
    result = true;
end
