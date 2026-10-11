s = '   MixEd Case  ';
t = strtrim(s);
fprintf('[%s]\n', t);
fprintf('[%s] [%s]\n', upper(t), lower(t));
fprintf('%d\n', strcmpi('ABC', 'abc'));
fprintf('%d\n', strncmp('hello', 'help', 3));
disp(strrep('a-b-c', '-', '+'));
disp(fliplr('abc'));
