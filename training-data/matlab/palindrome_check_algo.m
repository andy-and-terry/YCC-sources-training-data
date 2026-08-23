function result = palindrome_check_algo(s)
    normalized = lower(s);
    normalized = normalized(isstrprop(normalized, 'alphanum'));
    result = strcmp(normalized, fliplr(normalized));
end
