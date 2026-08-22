function result = fibonacci(n)
    persistent cache;
    if isempty(cache)
        cache = containers.Map('KeyType', 'double', 'ValueType', 'double');
    end
    if n < 2
        result = n;
        return;
    end
    if isKey(cache, n)
        result = cache(n);
        return;
    end
    result = fibonacci(n - 1) + fibonacci(n - 2);
    cache(n) = result;
end
