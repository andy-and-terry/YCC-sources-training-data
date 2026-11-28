words = {'apple', 'fig', 'banana'};
lens = cellfun(@length, words);
upper_words = cellfun(@upper, words, 'UniformOutput', false);
disp(lens);
disp(upper_words);
