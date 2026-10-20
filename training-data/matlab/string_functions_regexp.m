s = 'Hello, World';
disp(upper(s)); disp(lower(s)); disp(length(s)); disp(fliplr(s)); disp(strrep(s, 'l', 'L'))
disp(strsplit('a,b,,c', ','))
disp(strjoin({'x', 'y', 'z'}, '-'))
disp(strtrim('   pad  ')); disp(num2str(pi, 4)); disp(str2num('[1 2 3]') * 2); disp(str2double('3.5') + 1)
disp(sprintf('%05.1f|%-5s|%d|%x', 3.14159, 'ab', 42, 255))
[tok, rest] = strtok('one two three');
disp(tok); disp(rest)
[t, n] = regexp('ab12cd345', '\d+', 'match', 'start');
disp(t); disp(n)
disp(regexprep('a1b22', '\d+', '#'))
names = regexp('key=value', '(?<k>\w+)=(?<v>\w+)', 'names');
disp(names.k); disp(names.v)
disp(strcmp('a', 'a')); disp(strcmpi('A', 'a')); disp(strncmp('hello', 'help', 3)); disp(strfind('abcabc', 'bc'))
disp(isempty('')); disp(ischar(s)); disp(['abc'; 'def'](2, :)); disp(double('A')); disp(char([72 105]))
disp(contains(s, 'World')); disp(startsWith(s, 'He')); disp(numel(num2str(12345)))
