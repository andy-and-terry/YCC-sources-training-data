function result = is_anagram(a, b)
    normalize = @(s) sort(lower(s(s ~= ' ')));
    result = strcmp(normalize(a), normalize(b));
end
