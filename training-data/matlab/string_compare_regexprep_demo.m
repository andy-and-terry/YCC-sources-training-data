disp(strcmp('abc', 'abc'));
disp(strcmpi('ABC', 'abc'));
disp(strncmp('hello', 'help', 3));
disp(strcmp({'a', 'b', 'c'}, 'b'));

s = 'The quick brown fox';
disp(upper(s));
disp(strrep(s, 'quick', 'slow'));
disp(regexprep(s, '(\w+) (\w+)', '$2 $1'));
disp(regexprep(s, '\s+', '_'));
disp(regexprep('a1b22c333', '\d+', '#'));
disp(regexprep('hello world', '(\w)(\w*)', '$2$1'));

[tok, rest] = strtok(s);
disp(tok);
disp(rest);

disp(strfind(s, 'o'));
disp(contains(s, 'brown'));
disp(startsWith(s, 'The'));
disp(endsWith(s, 'dog'));

words = strsplit('one,two,,three', ',');
disp(numel(words));
disp(strjoin(words, ' | '));
disp(strtrim(sprintf('  padded \t')));
disp(fliplr('stressed'));

tokens = regexp('key1=val1;key2=val2', '(\w+)=(\w+)', 'tokens');
for i = 1:numel(tokens)
    fprintf('%s => %s\n', tokens{i}{1}, tokens{i}{2});
end

names = regexp('x=12, y=34', '(?<name>\w)=(?<val>\d+)', 'names');
disp(names(2).val);
disp(regexp('abc123', '\d', 'match', 'once'));
disp(lower('MiXeD'));

disp(num2str(strcmp(sort({'b', 'a'}), {'a', 'b'})));
