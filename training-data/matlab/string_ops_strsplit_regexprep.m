s = 'a,b,,c';
parts = strsplit(s, ',');
disp(numel(parts));
disp(strjoin(upper(parts), '-'));
disp(regexprep('abc123', '\d', '#'));
disp(strrep('hello world', 'world', 'there'));
