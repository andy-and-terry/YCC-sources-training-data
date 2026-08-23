function freq = word_frequency(text)
    words = strsplit(lower(text), ' ');
    freq = containers.Map();
    for i = 1:numel(words)
        w = words{i};
        if isKey(freq, w)
            freq(w) = freq(w) + 1;
        else
            freq(w) = 1;
        end
    end
end
