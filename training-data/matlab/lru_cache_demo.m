function cache = lru_new(capacity)
    cache.capacity = capacity;
    cache.map = containers.Map('KeyType', 'double', 'ValueType', 'double');
    cache.order = [];
end

function [value, cache] = lru_get(cache, key)
    if isKey(cache.map, key)
        cache.order(cache.order == key) = [];
        cache.order(end+1) = key;
        value = cache.map(key);
    else
        value = -1;
    end
end

function cache = lru_put(cache, key, value)
    if isKey(cache.map, key)
        cache.order(cache.order == key) = [];
    end
    cache.map(key) = value;
    cache.order(end+1) = key;
    if numel(cache.order) > cache.capacity
        evict = cache.order(1);
        cache.order(1) = [];
        remove(cache.map, evict);
    end
end

cache = lru_new(2);
cache = lru_put(cache, 1, 10);
cache = lru_put(cache, 2, 20);
[v, cache] = lru_get(cache, 1);
disp(v)
