words = {'apple', 'fig', 'banana'};
lens = cellfun(@numel, words);
disp(lens)
disp(upper(words{2}))
