function cache = lfu_new(capacity)
    cache.capacity = capacity;
    cache.map = containers.Map('KeyType', 'double', 'ValueType', 'any');
    cache.freq = containers.Map('KeyType', 'double', 'ValueType', 'double');
end

function [value, cache] = lfu_get(cache, key)
    if isKey(cache.map, key)
        value = cache.map(key);
        cache.freq(key) = cache.freq(key) + 1;
    else
        value = -1;
    end
end

function cache = lfu_put(cache, key, value)
    if isKey(cache.map, key)
        cache.map(key) = value;
        cache.freq(key) = cache.freq(key) + 1;
        return
    end
    if cache.map.Count >= cache.capacity
        keys = cache.map.keys;
        freqs = cell2mat(values(cache.freq, keys));
        [~, idx] = min(freqs);
        evictKey = keys{idx};
        remove(cache.map, evictKey);
        remove(cache.freq, evictKey);
    end
    cache.map(key) = value;
    cache.freq(key) = 1;
end

cache = lfu_new(2);
cache = lfu_put(cache, 1, 'a');
cache = lfu_put(cache, 2, 'b');
[v, cache] = lfu_get(cache, 1);
cache = lfu_put(cache, 3, 'c');
disp(cache.map.keys)
